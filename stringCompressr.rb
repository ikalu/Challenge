class StrCompression
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def manipulate_string
    string = word.split('')
    compr_str = compress(string)
    puts compr_str
    uncompr_str = uncompress(compr_str)
    puts uncompr_str
  end

  def compress(string)
    new_string = ''
    counter = 0

    string.each_index do |i|
      str = new_string.chop
      if !str.end_with?(string[i])
        new_string << string[i] 

        counter += 1
      end

      ((i + 1)..((string.length) - 1)).each do |a|
        break if !new_string.end_with?(string[a])
        counter += 1
      end

      new_string << counter.to_s if counter != 0
      counter = 0
    end

    new_string
  end

  def uncompress(compr_str)
    str = compr_str.split('')

    old_string = ''

    str.each_index do |i|
      next if i.odd?

      old_string << str[i]*str[i + 1].to_i
    end

    old_string
  end

end

str = StrCompression.new("aabcccccaaa")
str.manipulate_string
