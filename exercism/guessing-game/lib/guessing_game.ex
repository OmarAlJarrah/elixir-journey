defmodule GuessingGame do
  def compare(secret_number, guess) do
    cond do
      guess == :no_guess ->
        "Make a guess"

      guess == secret_number ->
        "Correct"

      abs(guess - secret_number) == 1 ->
        "So close"

      guess > secret_number ->
        "Too high"

      guess < secret_number ->
        "Too low"
    end
  end

  def compare(secret_number) do
    "Make a guess"
  end
end
