defmodule RepeatedString do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/repeated-string/problem
  """

  @letter 97 # 'a'
  def run() do
    str = IO.gets("") |> String.trim |> String.to_charlist()
    n = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    count(@letter, str) * div(n, length(str)) + count(@letter, Enum.split(str, rem(n, length(str))) |> elem(0)) |> IO.inspect
  end
  def count(l, s), do: Enum.count(s, fn o -> o == l end)
end
