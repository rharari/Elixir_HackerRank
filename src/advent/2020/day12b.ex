defmodule Advent.Day12b do
  # part 2
  def start(file \\ "/tmp/input.txt"), do:
    File.read!(file) |> String.split() |> execute({ {1, 10}, {0, 0} })

  def execute([], {_waypt, {x, y}}), do: abs(x) + abs(y)
  def execute([h|t], {waypt, ship}), do: execute(t, execute(:binary.at(h, 0), String.to_integer(:binary.part(h, 1, byte_size(h) - 1)), waypt, ship))

  def execute(?F, v,{xw, yw}, {x, y}), do: {{xw, yw}, {x + v * xw, y + v * yw} }
  def execute(n, v, waypt, ship) when n in [?R, ?L], do: {rotate(waypt, n == ?R && v || -v), ship}
  def execute(n, v, {x, y}, ship) when n in [?N, ?S], do: { {x + (n == ?N && v || -v), y}, ship}
  def execute(n, v, {x, y}, ship), do: { {x, y + (n == ?E && v || -v)}, ship}

  def rotate(waypt, radius), do: (rem(radius, 360) / 90) |> trunc() |> rotate_step(waypt)

  def rotate_step(0, waypt), do: waypt
  def rotate_step(v, {x, y}) when v > 0, do: rotate_step(v - 1, {-y, x})
  def rotate_step(v, {x, y}), do: rotate_step(v + 1, {y, -x})

end
