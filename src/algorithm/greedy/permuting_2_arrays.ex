defmodule Permuting2Arrays do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/two-arrays/problem

    c("permuting_2_arrays.ex")
    Permuting2Arrays.run()

  """

  def run(), do: IO.gets("") |> String.trim() |> String.to_integer() |> process_queue()
  def process_queue(n), do: Enum.each(1..n, fn _o -> process() end)

  def process(), do: get_line() |> process()
  def process([_n, k]), do: get_line(:sorted) |> Enum.reverse() |> verify(get_line(:sorted), k)

  def verify([], _, _), do: IO.puts("YES")
  def verify([a1|_t1], [a2|_t2], k) when a1 + a2 < k, do: IO.puts("NO")
  def verify([_a1|t1], [_a2|t2], k), do: verify(t1, t2, k)

  def get_line(), do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
  def get_line(:sorted), do: get_line() |> Enum.sort()

end
