module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    nums_a.reverse.map.with_index do |dig, ind|
      if ind.odd?
        dig *= 2
        dig -= 9 if dig >= 10
      end
      sum += dig.to_s.chars.map(&:to_i).sum
    end
    sum.modulo(10).zero?
  end
end
