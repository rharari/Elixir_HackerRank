defmodule ClosestNumber do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/closest-number/problem

    c("closest_number.ex")

    iex(1)> ClosestNumber.run()
  """

  def run(), do: IO.gets("") |> String.trim() |> Integer.parse |> elem(0) |> run_check_closest()

  def run_check_closest(0), do: {:ok}
  def run_check_closest(q) do
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    |> check_closest() |> IO.puts
    run_check_closest(q - 1)
  end

  def check_closest([a, b, x]) do
    v = :math.pow(a, b)
    div1 = trunc(v / x)
    check_closest(v, x * (div1), x * (div1 + 1))
  end
  def check_closest(_, d1, d2) when d1 < 0, do: d2
  def check_closest(v, d1, d2) do
    v1 = abs(v - d1)
    case min(v1, abs(v - d2)) == v1 do
      true -> d1
      false -> d2
    end
  end

end
