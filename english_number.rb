# english_number.rb
class Integer
  def englishfy

    raise "Integer needs to be smaller than 999.999.999.999.999." if self > 999_999_999_999_999
    raise "Integer can't be negative" if self < 0

    integer_as_str = self.to_s
    result = ""
    quantity_denominator = ["", "thousand", "million", "billion", "trillion"]
    index = 0
    

    while integer_as_str != ""
      if integer_as_str.length >= 3
        result.prepend(englishfy_three(integer_as_str[-3..-1].to_i) + " #{quantity_denominator[index]} ")
        integer_as_str = integer_as_str[0..-4]
        index += 1
      else
        result.prepend(englishfy_three(integer_as_str.to_i) + " #{quantity_denominator[index]} ")
        integer_as_str = ""
        index += 1
      end

    end

    return result.chomp
  end

  private
  def englishfy_three(integer)
    units = [
              'one',
              'two',
              'three',
              'four',
              'five',
              'six',
              'seven',
              'eight',
              'nine'
            ]

    decimals = [
                  'ten',
                  'twenty',
                  'thirty',
                  'fourty',
                  'fifty',
                  'sixty',
                  'seventy',
                  'eighty',
                  'ninety'
                ]

    teens = [
              'eleven',
              'twelve',
              'thirteen',
              'fourteen',
              'fifteen',
              'sixteen',
              'seventeen',
              'eighteen',
              'nineteen'
            ]

    result = ""

    if integer >= 100
      int_hundreds = integer / 100
      result = units[int_hundreds - 1] + " hundred"
      
      integer -= int_hundreds * 100
      result += " " if integer >= 1
    end

    if integer >= 11 && integer <= 19
      result += teens[integer - 11]
      integer = 0
    end

    if integer >= 20
      int_decimals = integer / 10
      result += decimals[int_decimals - 1]
      
      integer -= int_decimals * 10
      result += " " if integer >= 1
    end

    if integer >= 1
      result += units[integer - 1]
    end
        
    return result
  end
end

puts 999_999_999_999_999.englishfy
puts 5.englishfy
puts 15.englishfy
puts 35.englishfy
puts 1700.englishfy