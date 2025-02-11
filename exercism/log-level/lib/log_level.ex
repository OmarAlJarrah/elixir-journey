defmodule LogLevel do
  @data %{
    0 => {:trace, false},
    1 => {:debug, true},
    2 => {:info, true},
    3 => {:warning, true},
    4 => {:error, true},
    5 => {:fatal, false}
  }

  def to_label(level, legacy?) do
    {label, supports_legacy?} = Map.get(@data, level, {:unknown, :x})
    if label == :unknown or (not supports_legacy? and legacy?), do: :unknown, else: label
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    label = LogLevel.to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
