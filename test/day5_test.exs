defmodule AOC2022Test.Day5 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day5

  test "part 1 sample" do
    stream = read_input("day5_sample.txt")

    res = part_1(stream)

    assert res == "CMZ"
  end

  test "part 1" do
    stream = read_input("day5.txt")

    res = part_1(stream)

    assert res == "QPJPLMNNR"
  end

  test "part 2 sample" do
    stream = read_input("day5_sample.txt")

    res = part_2(stream)

    assert res == "MCD"
  end

  test "part 2" do
    stream = read_input("day5.txt")

    res = part_2(stream)

    assert res == "BQDNWJPVJ"
  end
end
