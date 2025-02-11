defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    List.insert_at(list, 0, language)
  end

  def remove(list) do
    {popped, new_list} = List.pop_at(list, 0)
    new_list
  end

  def first(list) do
    List.first(list)
  end

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
