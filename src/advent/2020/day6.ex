defmodule Advent.Day6 do

  def start(file \\ "/tmp/input.txt"), do:
    File.read!(file)
    |> to_charlist()
    |> Kernel.++([10, 10])
    |> Enum.reduce({%{}, 0, 0}, fn letter, acc -> process(acc, letter) end)
    |> elem(2)

  defp process({letters, 1, total}, 10), do: {%{}, 0, total + (Map.keys(letters) |> Enum.count())}
  defp process({letters, _, total}, 10), do: {letters, 1, total}
  defp process({letters, _, total}, letter), do: {letters |> Map.put(letter, 1), 0, total}

end
