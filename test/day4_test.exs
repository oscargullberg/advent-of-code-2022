defmodule AOC2022Test.Day4 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day4

  test "part 1 sample" do
    stream = read_input("day4_sample.txt")

    res = part_1(stream)

    assert res == 2
  end

  test "part 1" do
    stream = read_input("day4.txt")

    res = part_1(stream)

    assert res == 567
  end

  test "part 2 sample" do
    stream = read_input("day4_sample.txt")

    res = part_2(stream)

    assert res == 4
  end

  test "part 2" do
    stream = read_input("day4.txt")

    res = part_2(stream)

    assert res == 907
  end
end
