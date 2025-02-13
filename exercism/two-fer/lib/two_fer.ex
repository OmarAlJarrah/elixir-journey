defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_bitstring(name) do
    cond do
      is_list(name) -> nil
      is_bitstring(name) -> "One for #{name}, one for me."
    end
  end
end
