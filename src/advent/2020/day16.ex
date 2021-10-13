defmodule Advent.Day16 do
  def part1(file \\ "/tmp/input.txt"), do: file |> get_data() |> sum_invalid_fields()
  def part2(file \\ "/tmp/input.txt"), do: file |> get_data() |> filter_valid_tickets() |> find_positions()

  defp filter_valid_tickets(data), do: {data |> elem(1) |> Map.values |> filter_valid_tickets([(data |> elem(2))] ++ (data |> elem(3)) ), data}
  defp filter_valid_tickets(ranges, tkts) do
    Enum.reduce(tkts, [], fn tkt, acc ->
      case Enum.reduce(tkt, 0, fn f, acc2 -> Enum.any?(ranges,
        fn [{min1, max1}, {min2, max2}] -> f >= min1 and f <= max1 or f >= min2 and f <= max2 end) && acc2 || acc2 + f end) do
          0 -> [tkt | acc]
          _ -> acc
        end
    end)
  end

  defp find_positions({valid_tkts, data}), do: data |> elem(1) |> filter_fields() |> find_position(valid_tkts)
  defp find_position({total_fields, dep_fields}, valid_tkts) do
    dep_fields |> Map.keys |> Enum.reduce(%{}, fn key, acc ->
      position = find_pos(Enum.to_list(0..total_fields - 1), valid_tkts, dep_fields[key])
      Map.put(acc, key, position)
    end)
    |> Map.to_list()
    |> IO.inspect
    |> reduce_frequency(%{})
  end

  defp reduce_frequency([], field_position), do: field_position
  defp reduce_frequency(lst, field_position) do
    {keys, positions, new_field_position} = Enum.filter(lst, fn {_key, list} -> length(list) == 1 end)
          |> Enum.reduce({[], [], field_position}, fn {key, [position]}, {acc1, acc2, acc3} -> {[key] ++ acc1, [position | acc2], Map.put(acc3, key, position)} end)

    case keys == [] do
      true ->
        raise "ooops"
      false ->
        #IO.inspect lst
        #IO.inspect positions
        #IO.inspect new_field_position
        :ok
    end

    lst |> Enum.reduce([], fn {key1, list}, acc ->
              IO.inspect key1
              case key1 not in keys do
                true -> [{key1, list -- positions} |> IO.inspect | acc]
                false -> acc
              end
            end)
    |> reduce_frequency(new_field_position)
  end

  defp find_pos(acc, valid_tks, minmax) do
    valid_tks |> Enum.reduce(acc, fn tkt, acc3 ->
      check_min_max(tkt, minmax, acc3)
    end)
  end
  defp check_min_max(tkt, [{min1, max1}, {min2, max2}], acc) do
    tkt |> Enum.with_index(0) |> Enum.reduce(acc, fn {v, idx}, acc2 ->
      case v >= min1 and v <= max1 or v >= min2 and v <= max2 do
        false -> List.delete(acc2, idx)
        true -> acc2
      end
    end)
  end

  defp filter_fields(positions), do:
    {positions |> Map.keys |> length, positions} # Map.take(positions, ["departure location", "departure station", "departure platform", "departure track", "departure date", "departure time"])}

  defp get_data(file), do: file |> File.read!() |> :binary.split(["\n"], [:global, :trim]) |> parse_input()

  defp sum_invalid_fields(data), do: data |> elem(1) |> Map.values |> List.flatten() |> sum_invalid_fields(data |> elem(3) |> List.flatten())
  defp sum_invalid_fields(ranges, tkts), do:
    Enum.reduce(tkts, 0, fn tkt, acc -> Enum.any?(ranges, fn {min, max} -> min <= tkt and tkt <= max end) && acc || acc + tkt end)

  defp parse_input(input), do:
    Enum.reduce(input, {:fields, %{}, [], []}, fn line, acc = {section, _fields, _my_tkt, _nearby_tkts} -> parse_line(section, line, acc) end)

  defp parse_line(_, "", acc), do: acc
  defp parse_line(:fields, "your ticket:", {_section, fields, my_tkt, nearby_tkts}), do: {:my_ticket, fields, my_tkt, nearby_tkts}
  defp parse_line(:fields, line, acc), do: line |> :binary.split([":", " or "], [:global, :trim]) |> parse_field(acc)
  defp parse_line(:my_ticket, "nearby tickets:", {_section, fields, my_tkt, nearby_tkts}), do: {:nearby_tkts, fields, my_tkt, nearby_tkts}
  defp parse_line(:my_ticket, line, {_section, fields, _my_tkt, nearby_tkts}), do: {:my_ticket, fields, get_ticket_value(line), nearby_tkts}
  defp parse_line(:nearby_tkts, line, {_section, fields, my_tkt, nearby_tkts}), do: {:nearby_tkts, fields, my_tkt, [get_ticket_value(line) | nearby_tkts]}

  defp parse_field([name|values], {section, fields, my_tkt, nearby_tkts}), do: {section, Map.put(fields, name, get_values(values)), my_tkt, nearby_tkts}

  defp get_values(values), do:
    Enum.reduce(values, [], fn v, acc ->
      [min, max] = String.split(v, "-", trim: true) |> Enum.map(&to_integer/1)
      [{min, max} | acc]
    end)

  defp get_ticket_value(line), do: line |> :binary.split(",", [:global]) |> Enum.map(&String.to_integer/1)

  defp to_integer(v), do: v |> String.trim() |> String.to_integer()

end
