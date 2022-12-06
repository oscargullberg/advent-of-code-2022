defmodule AOC2022.Day5 do
  @spec part_1(File.Stream.t()) :: String.t()
  def part_1(input) do
    input
    |> parse_input()
    |> solve(&move_pop/4)
  end

  @spec part_2(File.Stream.t()) :: String.t()
  def part_2(input) do
    parse_input(input)
    |> solve(&move_ordered/4)
  end

  defp parse_input(input) do
    input
    |> Enum.split_while(fn x -> String.trim(x) != "" end)
    |> then(fn {above, [_ | instructions]} ->
      [_ | stack_strs] = Enum.reverse(above)

      stacks =
        stack_strs
        |> Enum.map(fn str ->
          str |> String.replace("    ", " x ") |> String.split()
        end)
        |> Enum.flat_map(fn l ->
          l
          |> Enum.with_index(fn elem, index -> {index + 1, elem} end)
          |> Enum.filter(fn {_, elem} -> elem != "x" end)
        end)
        |> Enum.reduce(%{}, fn {k, v}, acc ->
          acc |> Map.update(k, [v], fn ex -> [v | ex] end)
        end)

      moves =
        instructions
        |> Stream.map(fn m ->
          Regex.named_captures(~r/move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/, m)
        end)
        |> Enum.to_list()

      {stacks, moves}
    end)
  end

  defp solve({stacks, moves}, mover_fn) do
    Enum.reduce(
      moves,
      stacks,
      fn %{
           "move" => move,
           "from" => from,
           "to" => to
         },
         stacks ->
        {from, to, move} =
          {String.to_integer(from), String.to_integer(to), String.to_integer(move)}

        mover_fn.(stacks, move, from, to)
      end
    )
    |> Enum.reduce("", fn {_, [h | _]}, acc -> acc <> h end)
    |> String.replace(~r/[^A-Z]/, "")
  end

  defp move_pop(stacks, move, from, to) do
    Enum.reduce(
      1..move,
      stacks,
      fn _, acc ->
        [popped | rest] = acc[from]

        acc
        |> Map.put(from, rest)
        |> Map.update!(to, fn existing -> [popped | existing] end)
      end
    )
  end

  defp move_ordered(stacks, move, from, to) do
    stacks
    |> Map.put(from, Enum.drop(stacks[from], move))
    |> Map.update!(to, fn existing -> Enum.take(stacks[from], move) ++ existing end)
  end
end
