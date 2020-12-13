defmodule Advent.Day11 do

  def start(part \\ :part1, file \\ "/tmp/input2.txt"), do:
    File.read!(file) |> String.split() |> normalize_input() |> execute(part)

  defp execute({seats, rows, cols}, part), do:
    1..(rows * cols) |> Enum.reduce({false, %{}}, fn idx, {changed, acc} ->
      state = seats[idx]
      new_state = verify_seat(state, seats, idx, rows, part)
      {changed || new_state != state, Map.put(acc, idx, new_state)}
    end)
    |> execute(rows, cols, part)

  defp execute({true, seats}, rows, cols, part), do: execute({seats, rows, cols}, part)
  defp execute({false, seats}, _rows, _cols, _part), do: seats |> Map.to_list() |> Enum.count(fn {_, v} -> v == ?# end)

  def get_adjacent_state(seats, idx, rows, :part1) do
    r = rem(idx, rows)
    [ (r == 1) && ?. || (seats[idx - rows - 1]),
      seats[idx - rows],
      (r == 0) && ?. || (seats[idx - rows + 1]),
      (r == 1) && ?. || (seats[idx - 1]),
      (r == 0) && ?. || (seats[idx + 1]),
      (r == 1) && ?. || (seats[idx + rows - 1]),
      seats[idx + rows],
      (r == 0) && ?. || (seats[idx + rows + 1])]
  end

  def get_adjacent_state(seats, idx, rows, :part2), do:
  [ get_vertical(seats, idx, rows, - 1 - rows, 1),
    get_vertical(seats,idx, rows, -rows, - 1),
    get_vertical(seats, idx, rows, -rows + 1, 0),
    get_horizontal(seats, idx, rows, 1),
    get_horizontal(seats, idx, rows, 0),
    get_vertical(seats, idx, rows, rows - 1, 1),
    get_vertical(seats, idx, rows, rows, -1),
    get_vertical(seats, idx, rows, rows + 1, 0)]

  def verify_seat(?., _seats, _idx, _rows, _part), do: ?.
  def verify_seat(?L, seats, idx, rows, part), do:
    (get_adjacent_state(seats, idx, rows, part) |> Enum.any?(fn o -> o == ?# end)) && ?L || ?#

  def verify_seat(?#, seats, idx, rows, part), do:
    (get_adjacent_state(seats, idx, rows, part) |> Enum.count(fn o -> o == ?# end) > (part == :part1 && 3 || 4)) && ?L || ?#

  defp normalize_input(lst), do:
    Enum.reduce(lst, {1, %{}}, fn lst, {idx, acc} ->
      lst |> String.to_charlist() |> Enum.reduce({idx, acc}, fn el, {idx, acc} ->
        {idx + 1, Map.put(acc, idx, el)}
      end)
    end) |> (fn x -> {elem(x, 1), List.first(lst) |> String.length(), length(lst)} end).()

  def get_vertical(seats, idx, rows, delta_rows, rr), do:
    (rem(idx, rows) == rr) && ?. || (
            case seats[idx + delta_rows] do
              nil -> ?.
              ?. -> get_vertical(seats, idx + delta_rows, rows, delta_rows, rr)
              v -> v
            end
    )

  def get_horizontal(seats, idx, rows, rr) do
    delta = rr == 1 && -1 || 1
    (rem(idx, rows) == rr) && ?. || (
      case seats[idx + delta] do
        nil -> ?.
        ?. -> get_horizontal(seats, idx + delta, rows, rr)
        v -> v
      end
    )
  end

end
