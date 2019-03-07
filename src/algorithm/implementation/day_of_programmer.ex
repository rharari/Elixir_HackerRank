defmodule DayProgrammer do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/day-of-the-programmer/problem

  iex(1)> DayProgrammer.run()
  """

  def run, do: IO.gets("") |> String.trim() |> Integer.parse |> elem(0) |> print_day

  defp print_day(year) when year > 1918 and rem(year,400) === 0, do: IO.puts "12.09.#{year}"
  defp print_day(year) when year > 1918 and rem(year,4) === 0 and rem(year,100) !== 0, do: IO.puts "12.09.#{year}"
  defp print_day(year) when year > 1918, do: IO.puts "13.09.#{year}"
  defp print_day(year) when year === 1918, do: IO.puts "26.09.#{year}"
  defp print_day(year) when rem(year,4) === 0, do: IO.puts "12.09.#{year}"
  defp print_day(year), do: IO.puts "13.09.#{year}"

end