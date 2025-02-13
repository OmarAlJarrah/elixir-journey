defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    # IO.puts(tuple_size(numbers))

    case tuple_size(numbers) do
      0 ->
        :not_found

      _ ->
        result = binary_search(numbers, key, 0, tuple_size(numbers) - 1)

        case result do
          -1 -> :not_found
          num -> {:ok, num}
        end
    end
  end

  def binary_search(numbers, target, left, right) do
    if left >= tuple_size(numbers) or right >= tuple_size(numbers) or left > right do
      -1
    end

    if left < 0 or right < 0 do
      -1
    end

    if left == right do
      cond do
        elem(numbers, left) == target -> left
        true -> -1
      end
    else
      mid = left + div(right - left, 2)
      # IO.puts("#{left} - #{right} - #{mid}")

      cond do
        elem(numbers, mid) == target -> mid
        elem(numbers, mid) > target -> binary_search(numbers, target, left, mid)
        elem(numbers, mid) < target -> binary_search(numbers, target, mid + 1, right)
      end
    end
  end
end

# BinarySearch.search({}, 1)
