# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/cavity-map
# hackerrank - Cavity Map

defmodule E1 do
  def main() do
    read(IO.gets("") |> String.trim |> String.to_integer)
  end

  def read(1) do IO.write IO.gets("") end
  def read(2) do IO.write IO.gets("") <> IO.gets("") end
  def read(n) do
    linePrev = IO.gets("") |> String.strip
    IO.puts linePrev
    line = IO.gets("") |> String.strip
    go_print(n - 1, linePrev, line)
  end

  def go_print(1, _, line) do IO.write line end
  def go_print(n, linePrev, line) do
    lineNext = IO.gets("") |> String.strip
    last = String.at(line, 0)
    print(String.length(line) - 1, line, last, 1, last, linePrev, lineNext)
    go_print(n - 1, line, lineNext)
  end

  def print(size, line, _, pos, acc, _, _) when pos == size do
    IO.puts acc <> String.at(line, pos)
  end
  def print(size, line, last, pos, acc, linePrev, lineNext) do
    this = String.at(line, pos)
    next = String.at(line, pos+1)
    top = String.at(linePrev, pos)
    bottom = String.at(lineNext, pos)
    print(size, line, this, pos + 1, acc <> printChar(last, this, next, top, bottom), linePrev, lineNext)
  end

  def printChar(last, this, next, top, bottom) when last < this and this > next and this > top and this > bottom do
    "X"
  end
  def printChar(_, this, _, _, _) do this end

end