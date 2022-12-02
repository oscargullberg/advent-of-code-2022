defmodule AOC2022Test.Day2 do
  use ExUnit.Case

  import AOC2022.Utils
  import AOC2022.Day2

  test "part 1 sample" do
    stream = read_input("day2_sample.txt")

    res = part_1(stream)

    assert res == 15
  end

  test "part 1" do
    stream = read_input("day2.txt")

    res = part_1(stream)

    assert res == 14163
  end

  test "part 2 sample" do
    stream = read_input("day2_sample.txt")

    res = part_2(stream)

    assert res == 12
  end

  test "part 2" do
    stream = read_input("day2.txt")

    res = part_2(stream)

    assert res == 12091
  end
end
