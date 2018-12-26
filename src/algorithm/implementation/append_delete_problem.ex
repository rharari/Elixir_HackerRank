defmodule AppendDeleteProblem do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/append-and-delete/problem

  iex(1)> AppendDeleteProblem.run()
  """

  def run() do
    a1 = IO.gets("") |> String.trim |> String.codepoints
    a2 = IO.gets("") |> String.trim |> String.codepoints
    k = IO.gets("") |> String.trim |> String.to_integer
    limit = length(a1) + length(a2)
    IO.puts(verify(k, limit, diff(a1, a2)) && "Yes" || "No")
  end

  def verify(k, limit, _) when k >= limit, do: true
  def verify(k, _, 0), do: rem(k, 2) === 0
  def verify(k, _, d) when k < d, do: false
  def verify(k, _, d) when rem(k, 2) + rem(d, 2) in [0, 2], do: true
  def verify(_, _, _), do: false

  def diff([], b), do: b |> length()
  def diff(a, []), do: a |> length()
  def diff([h1|t1], [h2|t2]) when h1 === h2, do: diff(t1, t2)
  def diff(t1, t2), do: length(t1) + length(t2)

end
