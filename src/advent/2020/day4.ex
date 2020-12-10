defmodule Advent.Day4 do

  def start(file \\ "/tmp/input.txt"), do:
    File.read!(file) |> (fn s -> "#{s}\n\n" end).() |> validate_passports()

  defp validate_passports(s) do
    s
    |> to_charlist()
    |> Enum.reduce({0, 0, 0}, fn char, acc -> validate(char, acc, s) end)
    |> (fn {total_valid, _, _} -> total_valid end).()
  end

  defp validate(?:, {valid_passports, count_token, position}, s) do
    case binary_part(s, position - 3, 3) in ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"] do
      true -> {valid_passports, count_token + 1, position + 1}
      false -> {valid_passports, count_token, position + 1}
    end
  end
  defp validate(?\n, {valid_passports, count_token, position}, s) do
    case binary_part(s, position - 1, 1) == "\n" do
      true -> {valid_passports + (count_token == 7 && 1 || 0), 0, position + 1}
      false -> {valid_passports, count_token, position + 1}
    end
  end
  defp validate(_, {valid_passports, count_token, position}, _), do: {valid_passports, count_token, position + 1}

end
