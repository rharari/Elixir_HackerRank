# day 13 - part 1 - O(n)
defmodule Advent.Day13 do

  def start(file \\ "/tmp/input.txt"), do: File.read!(file) |> String.split(["\n", ","], trim: true) |> find_bus() |> elem(2)

  def find_bus([time|lst_bus_id]), do: Enum.reduce(lst_bus_id, {String.to_integer(time), -1, 0}, &calculate_time/2)

  defp calculate_time("x", acc), do: acc
  defp calculate_time(id, acc) when is_binary(id), do: calculate_time(String.to_integer(id), acc)
  defp calculate_time(id, acc), do: calculate_time(id, acc, (id - rem(elem(acc, 0), id)))
  defp calculate_time(id, {time, min_wait_time, _best_result}, m) when m < min_wait_time or min_wait_time < 0, do: {time, m, id * m}
  defp calculate_time(_, acc, _), do: acc

end
