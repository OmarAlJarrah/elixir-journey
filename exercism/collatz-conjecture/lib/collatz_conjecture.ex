defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    cond do
      input == 1 -> 0
      Integer.is_even(input) -> calc(div(input, 2)) + 1
      Integer.is_odd(input) -> calc(input * 3 + 1) + 1
    end
  end
end
