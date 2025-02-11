defmodule BirdCount do
  def today(list), do: List.first(list)

  def increment_day_count(list) do
    case list do
      [] -> [1]
      [head | rest] -> Enum.concat([head + 1], rest)
    end
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn val -> val == 0 end)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    Enum.count(list, fn num -> num >= 5 end)
  end
end
