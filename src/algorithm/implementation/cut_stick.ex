defmodule CutStick do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/cut-the-sticks/problem

  c("cut_stick.ex")
  CutStick.run()
  """

  def run() do
    IO.gets("") # skip n
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1) |> Enum.sort() |> do_cut()
  end

  def do_cut([]), do: :ok
  def do_cut(arr=[h|_]) do
    arr
    |> print_lenght()
    |> Enum.reduce([], fn o, acc ->
      case o == h do
        true -> acc
        false -> acc ++ [o - h]
      end
    end)
    |> do_cut()
  end

  def print_lenght(arr) do
    IO.puts(length(arr))
    arr
  end

end
