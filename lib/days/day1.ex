defmodule AOC2022.Day1 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    input
    |> get_elf_sums
    |> Enum.at(0)
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    input
    |> get_elf_sums
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp get_elf_sums(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_while(
      [],
      fn
        "", acc ->
          {:cont, acc, []}

        elem, acc ->
          {:cont, [String.to_integer(elem) | acc]}
      end,
      fn
        acc ->
          {:cont, acc, []}
      end
    )
    |> Stream.map(&Enum.sum/1)
    |> Enum.sort(:desc)
  end
end
