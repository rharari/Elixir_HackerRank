# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/game-with-cells
# hacker hank - Army Game

defmodule E1 do

  defp get_side(i), do: i + rem i,2
  def main() do
    [m, n] = for n <- IO.gets("") |> String.strip |> String.split, do: get_side(String.to_integer(n))
    IO.puts("#{div m * n,4}")
  end

end