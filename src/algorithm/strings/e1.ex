# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/camelcase
# hacker hank - Camel Case

defmodule E1 do
  def main() do
    s = IO.gets("") |> String.strip |> String.graphemes
    IO.write count(s, 1)
  end


  def count([], acc) do acc end
  def count([h|t], acc) when h < "a" do count(t, acc + 1) end
  def count([_|t], acc) do count(t, acc) end

end