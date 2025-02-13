defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    number
    |> Integer.to_charlist(2)
    |> Enum.count(fn val -> val == ?1 end)
  end
end

# IO.puts(EliudsEggs.egg_count(7))
