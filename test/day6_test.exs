defmodule AOC2022Test.Day6 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day6

  test "part 1 sample" do
    stream = read_input("day6_sample.txt")

    res = part_1(stream)

    assert res == 7
  end

  test "part 1" do
    stream = read_input("day6.txt")

    res = part_1(stream)

    assert res == 1953
  end


  test "part 2 sample" do
    stream = read_input("day6.txt")

    res = part_2(stream)

    assert res == 2301
  end
end
