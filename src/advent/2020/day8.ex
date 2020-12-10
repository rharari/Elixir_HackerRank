# https://adventofcode.com/2020/day/8

defmodule Advent.Day8 do

  def start(file \\ "/tmp/input.txt") do
    File.read!(file)
    |> String.split()
    |> load_program([])
    |> execute_program(0, 0, %{})
  end

  defp execute_program(program, line, acc, executed), do:
    execute_line(program |> elem(line), program, line, acc, Map.put(executed, line, 1), Map.get(executed, line) != nil)

  defp execute_line(_, _, _, acc, _, true), do: acc
  defp execute_line({"nop", _}, program, line, acc, executed, _), do: execute_program(program, line + 1, acc, executed)
  defp execute_line({"acc", v}, program, line, acc, executed, _), do: execute_program(program, line + 1, acc + v, executed)
  defp execute_line({"jmp", v}, program, line, acc, executed, _), do: execute_program(program, line + v, acc, executed)

  defp load_program([], program), do: program |> Enum.reverse() |> List.to_tuple()
  defp load_program([cmd, vl | t], program), do: load_program(t, [{cmd, String.to_integer(vl)} | program])

end
