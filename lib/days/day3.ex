defmodule AOC2022.Day3 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn ln -> String.split_at(ln, trunc(String.length(ln) / 2)) end)
    |> Stream.map(fn {x, y} -> get_common_elems([x, y]) end)
    |> get_sum()
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_every(3)
    |> Stream.map(&get_common_elems/1)
    |> get_sum()
  end

  defp get_common_elems(lists) do
    is_empty = MapSet.new()

    lists
    |> Enum.reduce(MapSet.new(), fn elem, acc ->
      set =
        String.to_charlist(elem)
        |> MapSet.new()

      case acc do
        ^is_empty -> set
        _ -> MapSet.intersection(acc, set)
      end
    end)
  end

  defp get_prio([c] = x) when x >= 'a' and x <= 'z' do
    c - 96
  end

  defp get_prio([c] = x) when x >= 'A' and x <= 'Z' do
    c - 38
  end

  defp get_sum(common_elems) do
    common_elems
    |> Stream.map(&MapSet.to_list/1)
    |> Stream.map(&get_prio/1)
    |> Enum.sum()
  end
end
