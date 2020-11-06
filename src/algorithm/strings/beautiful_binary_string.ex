defmodule BeautifulBinaryString do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/beautiful-binary-string/problem
  """

  def main() do
    IO.gets("")
    IO.gets("") |> to_charlist() |> find_element(false, false, 0) |> IO.puts()
  end

  def find_element([], _, _, acc), do: acc
  def find_element([48|t], false, false, acc), do: find_element(t, true, false, acc)
  def find_element([49|t], true, false, acc), do: find_element(t, true, true, acc)
  def find_element([48|t], true, true, acc), do: find_element(t, false, false, acc + 1)
  def find_element([48|t], _, _, acc), do: find_element(t, true, false, acc)
  def find_element([_|t], _, _, acc), do: find_element(t, false, false, acc)

end
