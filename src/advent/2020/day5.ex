defmodule Advent.Day5 do

  @rows 0..128 |> Enum.map(fn o -> o end)
  @cols [0,1,2,3,4,5,6,7]

  def start(part, file \\ "/tmp/input.txt")
  def start(:part1, file), do:
    File.stream!(flie)
    |> Enum.reduce(0, fn o, acc -> max(acc, find_seat_id(to_charlist(o), @rows, @cols)) end)

  def start(:part2, file), do:
    File.stream!(file)
    |> Enum.map(fn o -> find_seat_id(to_charlist(o), @rows, @cols) end)
    |> Enum.sort()
    |> Enum.reduce_while(-1, fn o, acc ->
        cond do
          acc == -1 -> {:cont, o}
          o - acc == 1 -> {:cont, o}
          true -> {:halt, o - 1}
        end
      end)

  def find_seat_id(_, [rows], [cols]), do: rows * 8 + cols

  def find_seat_id([v|t], rows, cols) when v in [?F,?B], do:
    find_seat_id(t, split_half(rows) |> elem(v == ?F && 0 || 1), cols)

  def find_seat_id([v|t], rows, cols), do:
    find_seat_id(t, rows, split_half(cols) |> elem(v == ?L && 0 || 1))

  defp split_half(lst), do: Enum.split(lst, div(length(lst), 2))

end
