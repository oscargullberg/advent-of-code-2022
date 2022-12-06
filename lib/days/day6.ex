defmodule AOC2022.Day6 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    input
    |> parse_graphemes()
    |> solve(4)
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    input
    |> parse_graphemes()
    |> solve(14)
  end

  defp parse_graphemes(input) do
    input
    |> Stream.take(1)
    |> Stream.flat_map(fn str -> String.graphemes(str) end)
  end

  defp solve(graphemes, marker_count) do
    is_marker = fn list ->
      list |> Enum.take(marker_count) |> Enum.uniq() |> Enum.count() == marker_count
    end

    graphemes
    |> Enum.reduce_while([], fn elem, acc ->
      if length(acc) >= marker_count and is_marker.(acc) do
        {:halt, acc}
      else
        {:cont, [elem | acc]}
      end
    end)
    |> Enum.count()
  end
end
