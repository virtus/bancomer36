require "bancomer36/version"

module Bancomer36
  class CheckDigit

    # Replaces letters in input string with numbers
    # input is a string containing letters from A to Z and numbers from 0 to 9
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

    # Converts a string containing numbers to an array of integers
    def to_int_array(input)
      input.chars.to_a.collect { |x| x.to_i }
    end

    # Multiplies by 2 the elements in even positions (0, 2, 4...)
    # input is a array of integers with values ranging from 0 to 9
    def multiply_by_2(input)
      output = []
      input.each_with_index do |value, index|
        if index % 2 == 0
          output << value * 2
        else
          output << value
        end
      end
      output
    end

    # Sums units and tens for each element greater than 9
    # input is a array of integers with values ranging from 0 to 18
    def sums_units_and_tens(input)
      hash = {
        10 => 1, 11 => 2, 12 => 3, 13 => 4, 14 => 5,
        15 => 6, 16 => 7, 17 => 8, 18 => 9
      }
      output = []
      input.each do |x|
        if x > 9
          output << hash[x]
        else
          output << x
        end
      end
      output
    end

    # Sums all elements
    # input is a array of integers with values ranging from 0 to 9
    def sums_all_elements(input)
      input.inject(:+)
    end

    # Substracts from the next multiple of ten
    # input is an integer
    def substracts_from_next_ten(input)
      output = 10 - input % 10
      output = 0 if output == 10
      output
    end

    # Returns the check digit
    # input is a string containing letters from A to Z and numbers from 0 to 9
    def check_digit(input)
      input = letter_sub(input)
      input = to_int_array(input)
      input = multiply_by_2(input)
      input = sums_units_and_tens(input)
      input = sums_all_elements(input)
      input = substracts_from_next_ten(input)
      input
    end

    # Appends the check digit
    # input is a string containing letters from A to Z and numbers from 0 to 9
    def append_check_digit(input)
      input + check_digit(input).to_s
    end

    # Validates the check digit
    # input is a string containing letters from A to Z and numbers from 0 to 9
    # and a check digit at the end
    def check_digit_valid?(input)
      digit = input[-1].to_i
      input = input[0..input.length-1]
      input = input
      check_digit(input) == digit
    end
  end
end
