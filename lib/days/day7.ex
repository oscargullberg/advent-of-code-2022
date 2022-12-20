defmodule AOC2022.Day7 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    %{:parsed => parsed} =
      input
      |> parse()

    get_sizes(parsed)
    |> Map.values()
    |> Enum.filter(fn x -> x <= 100_000 end)
    |> Enum.sum()
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    %{:parsed => parsed} =
      input
      |> parse()

    sizes = get_sizes(parsed)
    used = sizes["/"]
    curr_free = 70_000_000 - used
    req = 30_000_000 - curr_free

    sizes
    |> Map.values()
    |> Enum.sort()
    |> Enum.find(fn x -> x >= req end)
  end

  defp parse(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Enum.reduce(%{:path => [], :parsed => %{}}, &parse/2)
  end

  defp parse(line, acc = %{:path => path, :parsed => tree}) do
    case line do
      "$ cd " <> p ->
        new_path =
          case p do
            ".." ->
              [_ | t] = path
              t

            "/" ->
              ["/"]

            x ->
              ["#{x}/" | path]
          end

        Map.put(acc, :path, new_path)

      "$ ls" ->
        acc

      ln ->
        cwd = Enum.reverse(path) |> Enum.join("")
        parsed = parse_ls_line(ln)
        new_tree = Map.update(tree, cwd, [parsed], fn existing -> [parsed | existing] end)
        Map.put(acc, :parsed, new_tree)
    end
  end

  defp parse_ls_line("dir " <> name) do
    {:dir, name}
  end

  defp parse_ls_line(ln) do
    [filesize, name] = String.split(ln)
    {:file, name, String.to_integer(filesize)}
  end

  defp get_sizes(map) do
    map
    |> Enum.to_list()
    |> Enum.sort_by(fn {k, _} -> String.length(k) end, :desc)
    |> Enum.reduce(%{}, fn {k, list}, outer ->
      sum =
        Enum.reduce(list, 0, fn el, acc ->
          acc +
            case el do
              {:file, _, size} ->
                size

              {:dir, name} ->
                outer["#{k}#{name}/"]

              _ ->
                0
            end
        end)

      Map.put(outer, k, sum)
    end)
  end
end
