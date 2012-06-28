require "bancomer36/version"

module Bancomer36
  class CheckDigit

    # Replaces letters in input string with numbers
    def letter_sub(input)
      hash = {
        'A' => '1', 'B' => '2', 'C' => '3', 'D' => '4', 'E' => '5', 'F' => '6',
        'G' => '7', 'H' => '8', 'I' => '9', 'J' => '1', 'K' => '2', 'L' => '3',
        'M' => '4', 'N' => '5', 'O' => '6', 'P' => '7', 'Q' => '8', 'R' => '9',
        'S' => '1', 'T' => '2', 'U' => '3', 'V' => '4', 'W' => '5', 'X' => '6',
        'Y' => '7', 'Z' => '8', '0' => '0', '1' => '1', '2' => '2', '3' => '3',
        '4' => '4', '5' => '5', '6' => '6', '7' => '7', '8' => '8', '9' => '9'
      }
      output = ""
      input.each_char { |c| output << hash[c] }
      output
    end

    # Coverts a string containing numbers to an array of integers
    def to_int_array(input)
      input.chars.to_a.collect { |x| x.to_i }
    end

  end
end
