defmodule AOC2022Test.Day3 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day3

  test "part 1 sample" do
    stream = read_input("day3_sample.txt")

    res = part_1(stream)

    assert res == 157
  end

  test "part 1" do
    stream = read_input("day3.txt")

    res = part_1(stream)

    assert res == 8233
  end

  test "part 2 sample" do
    stream = read_input("day3_sample.txt")

    res = part_2(stream)

    assert res == 70
  end

  test "part 2" do
    stream = read_input("day3.txt")

    res = part_2(stream)

    assert res == 2821
  end
end
