# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/contests/w35/challenges/lucky-purchase
# hacker hank - week of code 35

defmodule E1 do
  @moduledoc false

  def main() do go(IO.gets("") |> String.strip |> String.to_integer, fillArray([0])) end
  
end