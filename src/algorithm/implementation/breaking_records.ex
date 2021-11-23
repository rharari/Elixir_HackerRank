defmodule BreakingRecords do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem
  """

  def run() do
    IO.gets("")
    a=IO.gets("")|>String.trim|>String.split|>Enum.map(&String.to_integer/1)
    IO.puts("#{Enum.reduce(a,{-1,-1},fn o,{c,score}->o>c&&{o,score+1} || {c,score}end)|>elem(1)} #{Enum.reduce(a,{10000000000,-1},fn o,{c,score}->o<c&&{o,score+1}||{c,score} end)|>elem(1)}")
  end

end
