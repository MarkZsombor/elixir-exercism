defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> String.graphemes()
      |> Enum.map(fn x -> 
          [char] = :unicode.characters_to_nfd_list(x) 
          char
        end)
      |> Enum.map(fn x -> convertCharacter(x, shift) end)
      |> List.to_string()
  end

  def convertCharacter(char, shift) do
    cond do
      65 <= char && char <= 90 -> 
        choose_letter(char, shift, 90)
      97 <= char && char <= 122 -> 
        choose_letter(char, shift, 122)
      true -> char
    end
  end

  def choose_letter(char, shift, limit) do
    if char + shift > limit do
      char + shift - 26
    else
      char + shift
    end
  end
end
