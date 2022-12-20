defmodule AOC2022.Day8 do
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    grid_data = {grid, _, _} = input |> parse_grid

    grid
    |> Enum.reduce(0, fn {point, _h}, acc ->
      if is_visible(grid_data, point) do
        acc + 1
      else
        acc
      end
    end)
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    grid_data = {grid, _, _} = input |> parse_grid

    grid
    |> Enum.map(fn {point, _h} -> get_tree_score(grid_data, point) end)
    |> Enum.max()
  end

  defp parse_grid(input) do
    rows =
      input
      |> Stream.map(&String.trim/1)
      |> Stream.map(fn ln -> String.split(ln, "", trim: true) end)
      |> Enum.to_list()

    [first_row | _] = rows
    col_cnt = length(first_row)
    row_cnt = length(rows)

    grid =
      rows
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {heights, y}, acc ->
        heights
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {h, x}, acc ->
          Map.put(acc, {x, y}, String.to_integer(h))
        end)
        |> Map.merge(acc)
      end)

    {grid, col_cnt, row_cnt}
  end

  defp is_visible({grid, cols, rows}, point) do
    height = grid[point]
    neigbors = get_neighbors(grid, point)

    if length(neigbors) < 4 do
      true
    else
      neigbors
      |> Enum.filter(fn {p, _} -> grid[p] < height end)
      |> Enum.map(fn p -> get_path_to_edge({cols, rows}, p) end)
      |> Enum.any?(fn path -> visible_to_edge(grid, path, height) end)
    end
  end

  defp get_tree_score({grid, cols, rows}, point) do
    height = grid[point]
    neigbors = get_neighbors(grid, point)

    if length(neigbors) < 4 do
      0
    else
      neigbors
      |> Enum.map(fn p -> get_path_to_edge({cols, rows}, p) end)
      |> Enum.map(fn path -> get_path_score(grid, path, height) end)
      |> Enum.reduce(1, fn el, acc -> el * acc end)
    end
  end

  def get_neighbors(grid, {x, y}) do
    [{{x, y - 1}, :up}, {{x, y + 1}, :down}, {{x - 1, y}, :left}, {{x + 1, y}, :right}]
    |> Enum.filter(fn {point, _} ->
      Map.has_key?(grid, point)
    end)
  end

  defp get_path_to_edge({cols, rows}, {{x, y}, dir}) do
    case dir do
      :up ->
        Enum.to_list(y..0)
        |> Enum.map(fn y -> {x, y} end)

      :down ->
        Enum.to_list(y..(rows - 1))
        |> Enum.map(fn y -> {x, y} end)

      :left ->
        Enum.to_list(x..0)
        |> Enum.map(fn x -> {x, y} end)

      :right ->
        Enum.to_list(x..(cols - 1))
        |> Enum.map(fn x -> {x, y} end)
    end
  end

  defp visible_to_edge(grid, path, height) do
    path |> Enum.all?(fn p -> grid[p] < height end)
  end

  defp get_path_score(grid, path, height) do
    path
    |> Enum.reduce_while(0, fn p, acc ->
      if grid[p] < height do
        {:cont, acc + 1}
      else
        {:halt, acc + 1}
      end
    end)
  end
end
