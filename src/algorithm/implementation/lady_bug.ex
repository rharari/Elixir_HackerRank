defmodule LadyBug do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/happy-ladybugs/problem

  iex(1)> LadyBug.run()
  """
  def run do
    1..read_keyboard()
    |> Enum.each(fn _ ->
      IO.gets("")
      list = IO.gets("") |> String.trim() |> String.graphemes()
      case "_" in list do
        true -> list |> Enum.group_by(fn x -> x end) |> has_more_than_one()
        false -> list |> check_sequence(nil, 0)
      end
    end)
  end
  def read_keyboard(), do: IO.gets("") |> Integer.parse() |> elem(0)

  defp check_sequence([], _, 1), do: IO.puts("NO")
  defp check_sequence([], _, _), do: IO.puts("YES")
  defp check_sequence([h|t], nil, qtd), do: check_sequence(t, h, qtd + 1)
  defp check_sequence([h|t], h, qtd), do: check_sequence(t, h, qtd + 1)
  defp check_sequence(_, _, 1), do: IO.puts("NO")
  defp check_sequence([h|t], _, _), do: check_sequence(t, h, 1)

  defp has_more_than_one(elements), do: has_more_than_one(Map.keys(elements), elements)
  defp has_more_than_one([], _), do: IO.puts("YES")
  defp has_more_than_one(["_"|t], elements), do: has_more_than_one(t, elements)
  defp has_more_than_one([h|t], elements) do
    case elements[h] |> length > 1 do
      true -> has_more_than_one(t, elements)
      false -> IO.puts("NO")
    end
  end

end