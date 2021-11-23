defmodule DivisibleSum do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/divisible-sum-pairs/problem
  """

  def run(),do: ex(0,rd()|>Enum.at(1),rd())
  def ex(l,_,[]),do: l|>IO.puts()
  def ex(l,k,[h|t]),do: Enum.reduce(t,l,fn o,l->rem(h+o,k)==0&&l+1||l end)|>ex(k,t)
  def rd(),do: IO.gets("")|>String.trim|>String.split|>Enum.map(&String.to_integer/1)

end
