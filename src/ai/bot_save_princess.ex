defmodule BotSavePrincess do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/saveprincess

    c("bot_save_princess.ex")
    BotSavePrincess.run()
  """

  def run() do
    n = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..n |> Enum.reduce({nil, nil}, fn i, {up_down, left_right} ->
        line = IO.gets("") |> String.trim()
        cond do
          up_down != nil -> {up_down, left_right}
          String.starts_with?(line, "p") -> {i == 1 && "UP" || "DOWN", "LEFT"}
          String.ends_with?(line, "p") -> {i == 1 && "UP" || "DOWN", "RIGHT"}
          true -> {nil, nil}
        end
      end)
    |> display_path(div(n - 1,2))
  end
  def display_path(_, 0), do: :ok
  def display_path(v = {up_down, dir}, c) do
    IO.puts "#{up_down}\n#{dir}"
    display_path(v, c - 1)
  end
end
