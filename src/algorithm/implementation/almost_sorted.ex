defmodule AlmostSorted do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/almost-sorted/problem

  iex(1)> AlmostSorted.run()
  """

  def run() do
    IO.gets("")
    a = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    na = Enum.sort(a)
    case verify(a, na, 1) do
      true -> IO.puts("yes")
      {i0, i1} -> check_swap(i0, i1, a, na)
    end
  end

  def check_swap(i0, i1, a, na) do
    a2 = a |> List.replace_at(i0-1, Enum.at(a, i1 - 1)) |> List.replace_at(i1 - 1, Enum.at(a, i0 - 1))
    case a2 == na do
      true -> IO.puts("yes\nswap #{i0} #{i1}")
      false -> check_revert(i0, i1, a, na)
    end
  end

  def check_revert(i0, i1, a, na) do
    a2 = Enum.slice(a, 0, i0 - 1) ++ (Enum.slice(a, i0 - 1, (i1 - i0 + 1)) |> Enum.reverse()) ++ Enum.slice(a, i1, length(a))
    case a2 == na do
      true -> IO.puts("yes\nreverse #{i0} #{i1}")
      false -> IO.puts("no")
    end
  end

  def verify([], _, _), do: true
  def verify([h1|t1], [h2|t2], index) when h1 == h2, do: verify(t1, t2, index + 1)
  def verify([_|t1], [h2|_], index), do: verify2(t1, h2, index, index + 1)

  def verify2([], _, i0, i1), do: {i0, i1}
  def verify2([h1|_], h2, i0, index) when h1 == h2, do: {i0, index}
  def verify2([_|t1], h2, i0, index), do: verify2(t1, h2, i0, index + 1)

end
