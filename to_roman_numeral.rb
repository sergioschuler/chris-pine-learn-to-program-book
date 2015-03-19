# to_roman_numeral.rb

class Integer
  def to_roman
    roman_numbers = {
                      1000=>'M', 
                      900=>'CM',
                      500=>'D',
                      400=>'CD',
                      100 => "C",
                      90 => "XC",
                      50 => "L",  
                      40 => "XL",  
                      10 => "X",
                      9 => "IX",
                      5 => "V",
                      4 => "IV",
                      1 => "I"
                    }
    
    integer = self
    result = []

    while integer != 0
      
      roman_numbers.each_pair do |normal_number, roman_number|
        
        if (integer - normal_number) >= 0
          result << roman_number
          integer -= normal_number
        end
      end
    end

    return result.join
  end
end

(1..15).each { |i| puts i.to_roman }
