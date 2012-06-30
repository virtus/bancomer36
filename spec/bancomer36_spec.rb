require 'bancomer36'

describe Bancomer36::CheckDigit do
  before :each do
    @cd = Bancomer36::CheckDigit.new
  end

  context 'internal methods' do
    it 'replaces letters with numbers' do
      @cd.letter_sub('ABCDEFGHI').should == '123456789'
      @cd.letter_sub('JKLMNOPQR').should == '123456789'
      @cd.letter_sub('STUVWXYZ' ).should == '12345678'
    end
    it 'leaves numbers unchanged' do
      @cd.letter_sub('0123456789').should == '0123456789'
    end
    it 'converts a string to an array of ints' do
      @cd.to_int_array('0123456789').should == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    it 'multiplies by 2 each other element starting from the right' do
      input = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      @cd.multiply_by_2(input).should == [0, 2, 2, 6, 4, 10, 6, 14, 8, 18]
    end
    it 'sums units and tens for each element greater than 9' do
      input  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
      output = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      @cd.sums_units_and_tens(input).should == output
    end
    it 'sums all the elements' do
      input  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      @cd.sums_all_elements(input).should == 45
    end
    it 'substracts from the next multiple of ten' do
      @cd.substracts_from_next_ten(45).should == 5
      @cd.substracts_from_next_ten(30).should == 0
    end
  end
  context 'user methods' do
    it 'returns the check digit' do
      @cd.check_digit('ABCDEF01235').should == 0
      @cd.check_digit('010A55001017').should == 3
      @cd.check_digit('54AE05MPHAC9').should == 3
      @cd.check_digit('180S60003011').should == 8
      @cd.check_digit('30FF69000045').should == 8
      @cd.check_digit('AZ00035RG00002L87').should == 1
    end
    it 'appends the check digit' do
      @cd.append_check_digit('ABCDEF01235').should == 'ABCDEF012350'
    end
    it 'validates the check digit' do
      @cd.check_digit_valid?('ABCDEF012350').should be_true
      @cd.check_digit_valid?('ABCDEF012359').should be_false
    end
  end
end
