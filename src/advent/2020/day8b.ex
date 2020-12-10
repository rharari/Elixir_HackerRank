defmodule Advent.Day8b do

  def start(file \\ "/tmp/input.txt") do
    File.read!(file)
    |> String.split()
    |> load_program([])
    |> fix_program(0)
  end

  defp fix_program(program, replace_cmd), do:
  fix_program(program, replace_cmd, tuple_size(program) - 1)

  defp fix_program(program, replace_cmd, last_line) do
    {line, acc} = execute_program(program, replace_cmd, 0, 0, %{}, last_line)
    case line - 1 == last_line do
      true -> acc
      false -> fix_program(program, replace_cmd + 1, last_line)
    end
  end

  defp execute_program(_, _, line, acc, _, last_line) when last_line < line, do: {line, acc}
  defp execute_program(program, replace_cmd, line, acc, executed, last_line), do:
    execute_line(program |> elem(line), replace_cmd, program, line, acc, Map.put(executed, line, 1), Map.get(executed, line) != nil, last_line)

  defp execute_line(_, _, _, line, acc, _, true, _), do: {line, acc}
  defp execute_line({"nop", 0}, replace_cmd, program, line, acc, executed, _, last_line), do:
    execute_program(program, replace_cmd, line + 1, acc, executed, last_line)
  defp execute_line({"nop", v}, 0, program, line, acc, executed, _, last_line), do:
    execute_program(program, -1, line + v, acc, executed, last_line)
  defp execute_line({"nop", _}, replace_cmd, program, line, acc, executed, _, last_line), do:
    execute_program(program, replace_cmd - 1, line + 1, acc, executed, last_line)
  defp execute_line({"acc", v}, replace_cmd, program, line, acc, executed, _, last_line), do:
    execute_program(program, replace_cmd, line + 1, acc + v, executed, last_line)
  defp execute_line({"jmp", _}, 0, program, line, acc, executed, _, last_line), do:
    execute_program(program, -1, line + 1, acc, executed, last_line)
  defp execute_line({"jmp", v}, replace_cmd, program, line, acc, executed, _, last_line), do:
    execute_program(program, replace_cmd - 1, line + v, acc, executed, last_line)

  defp load_program([], program), do: program |> Enum.reverse() |> List.to_tuple()
  defp load_program([cmd, vl | t], program), do: load_program(t, [{cmd, String.to_integer(vl)} | program])

end
