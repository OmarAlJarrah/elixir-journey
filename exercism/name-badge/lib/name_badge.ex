defmodule NameBadge do
  def print(id, name, department) do
    head =
      if is_nil(id) do
        ""
      else
        "[#{id}] - "
      end

    tail =
      " - " <>
        if is_nil(department) do
          "OWNER"
        else
          String.upcase(department)
        end

    "#{head}#{name}#{tail}"
  end
end
