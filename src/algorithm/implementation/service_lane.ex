defmodule ServiceLane do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/service-lane/problem

  iex(1)> ServiceLane.run()
  """

  def run do
    [_, t] = read_kbd()
    run_tests(t, read_kbd2())
  end

  defp run_tests(0, _), do: {:ok}
  defp run_tests(t, width) do
    [i, j] = read_kbd()
    v = Enum.slice(width, i, j - i + 1) |> Enum.min
    IO.puts(v)
    run_tests(t - 1, width)
  end
  defp read_kbd(), do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
  defp read_kbd2(), do: IO.gets("") |> String.trim |> String.split
end