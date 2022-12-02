defmodule AOC2022.Day2 do
  @doc """
  Opponent: A for Rock, B for paper, C for scissors
  Player: X for rock, Y for paper, Z for scissors
  """
  @spec part_1(File.Stream.t()) :: number()
  def part_1(input) do
    input
    |> get_columns()
    |> Stream.map(&get_score/1)
    |> Enum.sum()
  end

  @spec part_2(File.Stream.t()) :: number()
  def part_2(input) do
    input
    |> get_columns()
    |> Stream.map(fn [opp, round_res | _] -> [opp, get_player_move(round_res, opp)] end)
    |> Stream.map(&get_score/1)
    |> Enum.sum()
  end

  defp get_columns(input), do: input |> Stream.map(fn ln -> ln |> String.trim() |> String.split(" ") end)

  defp get_score([opponent, player]) do
    choice_scores = %{"X" => 1, "Y" => 2, "Z" => 3}

    round_score =
      case {player, opponent} do
        {"X", "C"} -> 6
        {"Y", "A"} -> 6
        {"Z", "B"} -> 6
        {"X", "A"} -> 3
        {"Y", "B"} -> 3
        {"Z", "C"} -> 3
        {_, _} -> 0
      end

    choice_scores[player] + round_score
  end

  # X means you need to lose, Y means you need to end the round in a draw, and Z means win
  defp get_player_move(round_res, opp_move) do
    opp_to_player = %{"A" => "X", "B" => "Y", "C" => "Z"}

    case {round_res, opp_move} do
      {"X", "A"} -> "Z"
      {"X", "B"} -> "X"
      {"X", "C"} -> "Y"
      {"Y", move} -> opp_to_player[move]
      {"Z", "A"} -> "Y"
      {"Z", "B"} -> "Z"
      {"Z", "C"} -> "X"
    end
  end
end
