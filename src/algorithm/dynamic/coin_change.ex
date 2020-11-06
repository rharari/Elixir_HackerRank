defmodule CoinChange do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/coin-change/problem

    c("coin_change.ex")
    CoinChange.run()

    TODO: not working as expected
  """

  def sum(coins, amount, coins2 \\ [], total_combinations \\ 0) do
    IO.inspect coins2
    s = Enum.sum(coins2)
    sum(coins, amount, coins2, s, total_combinations)
  end
  def sum(coins, amount, coins2, calculated, total_combinations) when calculated > amount, do: total_combinations
  def sum(coins, amount, coins2, calculated, total_combinations) when calculated == amount do
    IO.inspect "       -> #{inspect coins2} = $#{calculated}"
    sum_next(coins, amount, coins2, total_combinations + 1)
  end
  def sum(coins, amount, coins2, _calculated, total_combinations), do: sum_next(coins, amount, coins2, total_combinations)
  def sum_next(coins, amount, coins2, total_combinations) do
    coins
    |> Enum.with_index
    |> Enum.each(fn({coin, i}) ->
      n = coin
      {_, remaining} = Enum.split(coins, i + 1)
      sum(remaining, amount, coins2 ++ [n], total_combinations)
    end)
  end

  def run do
    amount = 4
    coins = [3, 2, 1, 9, 8, 5, 7, 10] |> prepare_coins([], amount)
    sum(coins, amount)
  end

  def prepare_coins([], acc, _), do: acc |> IO.inspect
  def prepare_coins([h|t], acc, total) do
    l = div(total, h)
    case l > 0 do
      true -> prepare_coins(t, acc ++ (1..l |> Enum.map(fn _x -> h end)), total)
      false -> prepare_coins(t, acc , total)
    end

  end


end