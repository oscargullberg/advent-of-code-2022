defmodule AOC2022Test.Day7 do
  use ExUnit.Case
  import AOC2022.Utils
  import AOC2022.Day7

  test "part 1 sample" do
    stream = read_input("day7_sample.txt")
    res = part_1(stream)
    assert res == 95437
  end

  test "part 1" do
    stream = read_input("day7.txt")
    res = part_1(stream)
    assert res == 1_783_610
  end

  test "part 2 sample" do
    stream = read_input("day7_sample.txt")
    res = part_2(stream)
    assert res == 24_933_642
  end

  test "part 2" do
    stream = read_input("day7.txt")
    res = part_2(stream)
    assert res == 4_370_655
  end
end
