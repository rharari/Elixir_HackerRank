defmodule NumberLineJumps do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/kangaroo/problem
  """

  def main() do
    [x1,v1,x2,v2] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    print_result(x2 - x1, v1 - v2)
  end

  def print_result(0, 0), do: IO.puts("YES")
  def print_result(_, 0), do: IO.puts("NO")
  def print_result(v, x), do: IO.puts(rem(v, x) == 0 and v * x > 0 && "YES" || "NO")

end
