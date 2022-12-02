defmodule AOC2022Test.Day1 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day1

  test "part 1 sample" do
    stream = read_input("day1_sample.txt")

    res = part_1(stream)

    assert res == 24000
  end

  test "part 1" do
    stream = read_input("day1.txt")

    res = part_1(stream)

    assert res == 70720
  end

  test "part 2 sample" do
    stream = read_input("day1_sample.txt")

    res = part_2(stream)

    assert res == 45000
  end

  test "part 2" do
    stream = read_input("day1.txt")

    res = part_2(stream)

    assert res == 207_148
  end
end
