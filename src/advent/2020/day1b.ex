defmodule Advent.Day1b do

  @lucky_num 2020

  def part2(arr), do:
    arr |> Enum.sort() |> find()

  def find(lst) when length(lst) < 3, do: {:error, "not found"}
  def find([first,second|tail]) do
    {lst,[last]} = Enum.split(tail, length(tail) - 1)
    find(first, second, last, lst, tail)
  end

  def find(first, second, last, _lst, _tail) when first + second + last == @lucky_num, do: first * second * last
  def find(first, second, last, lst, _tail) when first + second + last > @lucky_num, do: find([first, second] ++ lst)
  def find(first, second, _last, _lst, tail) do
    case find([second | tail]) do
      {:error, _reason} -> find([first | tail])
      v -> v
    end
  end

end
