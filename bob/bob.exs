defmodule Bob do
  def hey(input) do
    cond do     
      String.trim(input) == "" -> "Fine. Be that way!"
      # check the number only possibilities
      input =~ ~r(^[^a-zA-ZА-Яа-я]*$) && String.ends_with? input, "?" -> "Sure."
      input =~ ~r(^[^a-zA-ZА-Яа-я]*$) -> "Whatever."
      String.upcase(input) == input && String.ends_with? input, "?" -> "Calm down, I know what I'm doing!"
      String.upcase(input) == input -> "Whoa, chill out!"
      String.ends_with? input, "?" -> "Sure."
      true -> "Whatever."
    end
  end
end

Bob.hey("44")
