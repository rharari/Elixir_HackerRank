defmodule CaesarCipher do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/caesar-cipher-1/problem

  iex(1)> CaesarCipher.run()
  """

  def run do
    IO.gets("")
    lst = IO.gets("") |> String.trim() |> to_charlist()
    shift = rem IO.gets("") |> String.trim() |> Integer.parse |> elem(0), 26
    lst
    |> Enum.map(
         fn x ->
           case is_letter(x) do
             false -> x
             true -> delta = x < 91 && 90 || 122
                     x2 = x + shift
                     x2 > delta && x2 - 26 || x2
           end
         end
       )
    |> IO.puts
  end

  defp is_letter(x) when x >= 65 and x <= 90 or x >= 97 and x <= 122, do: true
  defp is_letter(_), do: false

end