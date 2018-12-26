defmodule LeonardoPrimes do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/leonardo-and-prime/problem

  iex(1)> LeonardoPrimes.run()

  c "leonardo_primes.ex"

  """


  def run() do
    n = 10000000000
    acc = 0
    i = 1
    count_primes(i, n, 1, 0)
  end

  def count_primes(i, n, total, count) when i > n, do: count
  def count_primes(i, n, total, count) do
    case is_prime(i) do
      true -> total2 = i * total
              case total2 > n do
                true -> count
                false -> count_primes(i + 1, n, total2, count + 1)
              end
      false -> count_primes(i + 1, n, total, count)
    end
  end

  defp is_prime(n) when n in [2, 3], do: true
  defp is_prime(n) do
    v = Float.floor(:math.sqrt(n)) |> round
    !Enum.any?(2..v, &(rem(n, &1) == 0))
  end

end