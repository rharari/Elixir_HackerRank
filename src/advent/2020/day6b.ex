defmodule Advent.Day6b do

  def start(file \\ "/tmp/input.txt"), do:
    File.read!(file)
    |> to_charlist()
    |> Kernel.++([10, 10])
    |> Enum.reduce({%{}, 0, 0, 0}, fn letter, acc -> process(acc, letter) end)
    |> elem(2)

  defp process({letters, 1, total, members}, 10), do: {%{}, 0, total + ((:maps.filter fn _, v -> v == members end, letters) |> Enum.count()), 0}
  defp process({letters, _, total, members}, 10), do: {letters, 1, total, members + 1}
  defp process({letters, _, total, members}, letter), do: {letters |> Map.update(letter, 1, &(&1 + 1)), 0, total, members}

end
