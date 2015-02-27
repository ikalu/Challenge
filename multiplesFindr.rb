class Multiples

  def find_multiples
    sum = 0

    (1..1000).each do |num|
      if num % 15 == 0
        print num
        print ' '
        sum += num
        puts sum
      elsif (num % 3 == 0 or num % 5 == 0)
        print num
        print ' '
        sum += num
        puts sum
      end
    end

    puts sum
  end

end
num = Multiples.new
num.find_multiples
