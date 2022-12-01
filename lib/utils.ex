defmodule AOC2022.Utils do
  @spec read_input(String.t()) :: File.Stream.t()
  def read_input(filename) do
    Path.join("inputs", filename)
    |> File.stream!()
  end
end
