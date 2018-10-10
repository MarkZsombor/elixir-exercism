defmodule Words do

  @punctuation ~r/[^\P{P}-]+/u
  @special_characters ~r/[\p{S}]+/u
  @underscore ~r/[_]/u
  @whitespace ~r/\s+/u
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase()
      |> String.replace(@underscore, " ") # convert underscores to spaces
      |> String.replace(@punctuation, "") # remove all punctuation but dashes
      |> String.replace(@special_characters, "") # removes other special chars like $
      |> String.replace(@whitespace, " ") # replace any consecutive whitespace
      |> String.split(" ") #converts to list
      |> countList
  end

  # Can't feed argument into embeded function with piupes?
  def count_list(sentence) do
    sentence
    |> Enum.uniq()
    |> Map.new(fn x -> {x, Enum.count(sentence, fn y -> y == x end)} end)
  end

end
