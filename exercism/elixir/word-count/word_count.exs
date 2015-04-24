defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    treated_sentence = Regex.replace(~r/[^\w\s-]/u, String.downcase(sentence), "")
    Enum.reduce(
      Enum.map(
        String.split(treated_sentence, ~r/[\s_]+/),
        fn w -> Map.put(%{}, w, 1) end
      ), fn m, acc -> 
        Dict.merge(m, acc, fn k, v1, v2 -> v1+v2 end)
      end
    )
  end
end
