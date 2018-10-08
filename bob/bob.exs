defmodule Bob do
  @numbers ~r(^[^a-zA-ZА-Яа-я]*$)

  def hey(input) do
    cond do     
      String.trim(input) == "" -> "Fine. Be that way!"
      # check the number only possibilities first
      only_numbers?(input) && is_question?(input) -> "Sure."
      only_numbers?(input) -> "Whatever."
      is_uppercase?(input) && is_question?(input) -> "Calm down, I know what I'm doing!"
      is_uppercase?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  def only_numbers?(input) do
    input =~ @numbers
  end

  def is_uppercase?(input) do
    String.upcase(input) == input
  end

  def is_question?(input) do
    String.ends_with? input, "?"
  end
end
