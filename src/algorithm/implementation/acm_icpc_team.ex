defmodule AcmIcpcTeam do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/acm-icpc-team/problem

  iex(1)> AcmIcpcTeam.run()
  """

use Bitwise

  def run do
    load()
    |> find_pairs({0, 0})
    |> print_result()
  end

  defp print_result({max, qtd}), do: IO.puts("#{max}\n#{qtd}")

  def load() do
    [n, _] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    1..n |> Enum.map(fn  _ -> IO.gets("") |> Integer.parse(2) |> elem(0) end)
  end

  def find_pairs([_|[]], v), do: v
  def find_pairs([h|t], {max, total}), do: t |> find_pairs(find_max(h, t, max, total))

  def find_max(_, [], max, total), do: {max, total}
  def find_max(n, [h|t], max, total) do
    n_max = n|> bor(h) |> count_bits()
    cond do
      n_max < max -> find_max(n, t, max, total)
      n_max == max -> find_max(n, t, max, total + 1)
      true -> find_max(n, t, n_max, 1)
    end
  end

  def count_bits(n), do: for(<<bit::1 <- :binary.encode_unsigned(n)>>, do: bit) |> Enum.sum()

end