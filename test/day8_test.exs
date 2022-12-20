defmodule AOC2022Test.Day8 do
  use ExUnit.Case
  import AOC2022.Utils
  import AOC2022.Day8

  test "part 1 sample" do
    stream = read_input("day8_sample.txt")
    res = part_1(stream)
    assert res == 21
  end

  test "part 1" do
    stream = read_input("day8.txt")
    res = part_1(stream)
    assert res == 1825
  end

  test "part 2 sample" do
    stream = read_input("day8_sample.txt")
    res = part_2(stream)
    assert res == 8
  end

  test "part 2" do
    stream = read_input("day8.txt")
    res = part_2(stream)
    assert res == 235200
  end

end
