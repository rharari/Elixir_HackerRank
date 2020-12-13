defmodule Advent.Day12 do

  def start(file \\ "/tmp/input2.txt") do
    File.read!(file) |> String.split() |> move( {2, %{1 => 0, 2 => 0, 3 => 0, 4 => 0} })
  end

  def move([], {_direction, acc}), do: abs(acc[1] - acc[3]) + abs(acc[2] - acc[4])
  def move([h|t], {direction, acc}), do: move(t, execute_move(:binary.at(h, 0), String.to_integer(:binary.part(h, 1, byte_size(h) - 1)), direction, acc))

  def execute_move(?F, v, direction, acc), do: {direction, Map.update!(acc, direction, fn x -> x + v end)}
  def execute_move(?R, v, direction, acc), do: {rotate(direction, v), acc}
  def execute_move(?L, v, direction, acc), do: {rotate(direction, -v), acc}
  def execute_move(?N, v, direction, acc), do: {direction, Map.update!(acc, 1, fn x -> x + v end)}
  def execute_move(?S, v, direction, acc), do: {direction, Map.update!(acc, 3, fn x -> x + v end)}
  def execute_move(?E, v, direction, acc), do: {direction, Map.update!(acc, 2, fn x -> x + v end)}
  def execute_move(?W, v, direction, acc), do: {direction, Map.update!(acc, 4, fn x -> x + v end)}

  def rotate(direction, radius) do
    v = rem( (direction + (rem(radius, 360) / 90) |> trunc()), 4)
    v > 0 && v || 4 + v
  end

end
