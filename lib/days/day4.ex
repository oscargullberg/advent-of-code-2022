defmodule AOC2022.Day4 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    input
    |> create_ranges()
    |> Stream.filter(fn {l1..u1, l2..u2} -> (l1 <= l2 and u1 >= u2) or (l2 <= l1 and u2 >= u1) end)
    |> Enum.count()
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    input
    |> create_ranges()
    |> Stream.filter(fn {r1, r2} -> !Range.disjoint?(r1, r2) end)
    |> Enum.count()
  end

  defp create_ranges(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn ln -> String.split(ln, ",") end)
    |> Stream.map(fn [p1, p2] ->
      {String.split(p1, "-"), String.split(p2, "-")}
    end)
    |> Stream.map(fn {[l1, u1], [l2, u2]} ->
      {String.to_integer(l1)..String.to_integer(u1), String.to_integer(l2)..String.to_integer(u2)}
    end)
  end
end
