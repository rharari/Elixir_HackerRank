# part 2 - brute force - not good!
defmodule Advent.Day13b do

  def start(file \\ "/tmp/input2.txt"), do:
    File.read!(file) |> String.split(["\n", ","], trim: true) |> find_time()

  defp find_time([_|bus_id]) do
      bus_id
      |> Enum.with_index()
      |> Enum.reduce({-1, 1, []}, fn {v, idx}, {max_id, max_offset, acc} ->
          case v do
            "x" -> {max_id, max_offset, acc}
            _ -> i = String.to_integer(v)
                 new_max = max(max_id, i)
                 new_max_offset = (new_max == i) && idx || max_offset
                 {new_max, new_max_offset, acc ++ [{i, idx}]}
          end
      end)
      |> find_time
  end

  defp find_time({max_id, max_offset, lst_bus}), do: find_time(lst_bus, max_offset, lst_bus, max_id)

  defp find_time(max_id, max_offset, lst_bus, current_time) do
    case verify_offset(lst_bus, current_time, max_offset) do
      true -> current_time - max_offset
      false -> find_time(max_id, max_offset, lst_bus, current_time + max_id)
    end
  end

  defp verify_offset(lst_bus, current_time, max_offset) do
    case Enum.find(lst_bus, nil, fn {bus_id, offset} -> rem(current_time - max_offset + offset, bus_id) != 0 end) do
      nil -> true
      _ -> false
    end
  end

end
