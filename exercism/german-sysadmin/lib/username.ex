defmodule Username do
  @latins %{
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue",
    ?ß => ~c"ss"
  }

  def sanitize(username) do
    cut_points =
      username
      |> Enum.with_index()
      |> Enum.filter(fn {v, _i} -> v in [?ä, ?ö, ?ü, ?ß] end)
      |> Enum.map(fn {_v, i} -> i end)

    Enum.filter(
      username,
      fn char ->
        case char do
          alpha when alpha in ?a..?z -> true
          underscore when underscore in ?_..?_ -> true
          fuck when fuck in [?ä, ?ö, ?ü, ?ß] -> true
          _ -> false
        end
      end
    )
    |> Enum.with_index()
    |> Enum.reduce([], fn {char, index}, builder ->
      cond do
        index in cut_points -> builder ++ @latins[char]
        true -> builder ++ [char]
      end
    end)
  end
end

# Username.sanitize(~c"köhler_jäger42")
