defmodule Advent.Day3 do
  @moduledoc """
    see https://adventofcode.com/2020/day/3
  """

    @doc """
      right_down part 1 -> [{3, 1}]
      right_down part 2 -> [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
    """
    def start(right_down \\ [{3, 1}], file \\ "/tmp/input.txt"), do:
      File.read!(file) |> String.split("\n") |> process_paths(right_down)

    defp process_paths(path, right_down), do:
      Enum.reduce(right_down, 1, fn {right, down}, acc ->
          path |> find_bottom(right, down - 1) |> (fn trees -> acc * trees end).()
      end)

    def find_bottom([h|t], right, down), do: find_bottom(t, byte_size(h), right, right, down, down, 0)
    def find_bottom(lst, _, _, _, _, _, acc) when lst in [[], [""]], do: acc
    def find_bottom([h|t], line_length, position, right, 0, down, acc), do:
      find_bottom(t, line_length, position + right, right, down, down, acc + is_tree(binary_part(h, rem(position, line_length), 1)))
    def find_bottom([h|t], line_length, position, right, skip, down, acc), do:
      find_bottom(t, line_length, position, right, skip - 1, down, acc)

    def is_tree("#"), do: 1
    def is_tree(_), do: 0

end
