defmodule Advent.Day4b do

  # part 2
  # https://adventofcode.com/2020/day/4

  def start(file \\ "/tmp/input.txt"), do:
    File.stream!(file)
    |> Stream.chunk_by(fn o -> byte_size(o) == 1 end)
    |> Stream.filter(&(&1 !== ["\n"]))
    |> Stream.scan(0, fn o, _acc -> verify_passports(o) == 7 && 1 || 0 end)
    |> Enum.sum()

  defp verify_passports(o) do
    Stream.scan(o, 0, fn item, _acc ->
      item
      |> :binary.split([<<32>>, <<10>>], [:global, :trim])
      |> Enum.reduce(0, fn x, acc -> acc + verify_passport_item(x) end)
     end)
    |> Enum.sum()
  end

  def verify_passport_item(<<"byr:", data::binary>>), do: in_range(String.to_integer(data), 1920,2002)
  def verify_passport_item(<<"iyr:", data::binary>>), do: in_range(String.to_integer(data), 2010,2020)
  def verify_passport_item(<<"eyr:", data::binary>>), do: in_range(String.to_integer(data), 2020,2030)
  def verify_passport_item(<<"hgt:", data::24, "cm">>), do: <<data::24>> |> String.to_integer |> in_range(150,193)
  def verify_passport_item(<<"hgt:", data::16, "in">>), do: <<data::16>> |> String.to_integer |> in_range(59,76)
  def verify_passport_item(<<"hcl:#", data::48>>), do: <<data::48>> =~ ~r(^[a-z, 0-9]*$) && 1 || 0
  def verify_passport_item(<<"ecl:", data::binary>>) when data in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"], do: 1
  def verify_passport_item(<<"pid:", data::72>>), do: <<data::72>> =~ ~r(^[0-9]*$) && 1 || 0
  def verify_passport_item(_), do: 0

  defp in_range(v, min, max) when v >= min and v <= max, do: 1
  defp in_range(_v, _min, _max), do: 0

end
