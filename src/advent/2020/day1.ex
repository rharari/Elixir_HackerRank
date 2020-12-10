defmodule Advent.Day1 do

  @lucky_num 2020

  def part1(arr), do:
    arr |> Enum.sort() |> find()

  def find(lst) when length(lst) < 2, do: {:error, "not found"}
  def find([first|tail]) do
    {lst,[last]} = Enum.split(tail, length(tail) - 1)
    find(first, last, lst, tail)
  end

  def find(first, last, _lst, _tail) when first + last == @lucky_num, do: first * last
  def find(first, last, lst, _tail) when first + last > @lucky_num, do: find([first | lst])
  def find(_first, _last, _lst, tail), do: find(tail)

end
