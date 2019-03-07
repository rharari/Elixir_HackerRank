defmodule DesignerPdfViewer do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/designer-pdf-viewer/problem

  iex(1)> DesignerPdfViewer.run()
  """

  def run do
    width = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    letters = IO.gets("") |> String.trim |> String.to_charlist |> Enum.map(fn n -> n - 97 end)
    IO.puts get_max(letters, width, 0) * length(letters)
  end

  defp get_max([], _, res), do: res
  defp get_max([h|t], width, res), do: get_max(t, width, max(res, Enum.at(width, h)))

end