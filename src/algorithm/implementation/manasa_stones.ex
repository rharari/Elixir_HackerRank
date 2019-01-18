defmodule ManasaStones do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/manasa-and-stones/problem

  iex(1)> ManasaStones.run()
  """
  def run do
    1..read_keyboard()
    |> Enum.each(fn _ ->
          n = read_keyboard() - 1
          calculate(n, read_keyboard(), read_keyboard(), n, [])
            |> Enum.sort |> Enum.uniq |> Enum.join(" ") |> IO.puts
       end)
  end
  def read_keyboard(), do: IO.gets("") |> Integer.parse() |> elem(0)

  defp calculate(_, _, _, -1, arr), do: arr
  defp calculate(n, a, b, x, arr), do: calculate(n, a, b, x - 1, arr ++ [a * n + x * (b - a)])

end