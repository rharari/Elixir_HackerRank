defmodule CuttingBoard do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/board-cutting/problem

    c("cutting_board.ex")
    CuttingBoard.run()

  """

  def run do
    t = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..t |> Enum.each(fn _ ->
      {m,n,size} = read_m_n()
      calculate(read_array(size - m), read_array(size - n), %{total_cost: 0, slice_x: 1, slice_y: 1})
      |> rem(1000000007) |> IO.inspect
    end)
  end

  defp read_m_n() do
    [m, n] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    {m,n, max(m, n)}
  end

  defp read_array(n), do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1) |> Enum.sort() |> adjust_size(n)

  def calculate(x_list, y_list, acc) when x_list == [] or y_list == [], do: acc.total_cost
  def calculate(x_list = [x|_], y_list = [y|_], acc), do:
    (acc.slice_y * x + (acc.slice_x + 1) * y > (acc.slice_y + 1) * y + acc.slice_x * y && :x || :y)
    |> cut(x_list, y_list, acc)

  def cut(:x, [x|tx], y_list, acc), do:
    calculate(tx, y_list, %{acc | total_cost: acc.total_cost + x * acc.slice_y, slice_x: acc.slice_x + 1})
  def cut(:y, x_list, [y|ty], acc), do:
    calculate(x_list, ty, %{acc | total_cost: acc.total_cost + y * acc.slice_x, slice_y: acc.slice_y + 1})

  defp adjust_size(arr, n), do: Enum.reverse(arr) ++ List.duplicate(0, n + 1)

end