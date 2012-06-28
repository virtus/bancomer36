require 'bancomer36'

describe Bancomer36::CheckDigit do
  context 'internal methods' do
    it 'replaces letters with numbers' do
      cd = Bancomer36::CheckDigit.new
      cd.letter_sub('ABCDEFGHI').should == '123456789'
      cd.letter_sub('JKLMNOPQR').should == '123456789'
      cd.letter_sub('STUVWXYZ' ).should == '12345678'
    end
    it 'leaves numbers unchanged' do
      cd = Bancomer36::CheckDigit.new
      cd.letter_sub('0123456789').should == '0123456789'
    end
    it 'converts a string to an array of ints' do
      cd = Bancomer36::CheckDigit.new
      cd.to_int_array('0123456789').should == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    it 'multiplies by 2 the elements in even positions (0, 2, 4...)'
    it 'sums units and tens for each element greater than 9'
    it 'sums all the elements'
    it 'substracts from the next multiple of ten'
  end
  context 'user methods' do
    it 'returns the check digit'
    it 'append the check digit'
    it 'verifies the check digit'
  end
end
