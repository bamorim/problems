defmodule Teenager do
  def hey(input) do
    cond do
      Regex.match?(~r/^\s*$/,input) -> "Fine. Be that way!"
      String.at(input, -1) == "?" -> "Sure."
      Regex.match?(~r/(?=\w)[^\d]/,input) && String.upcase(input) == input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
