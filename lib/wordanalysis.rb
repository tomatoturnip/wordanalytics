require 'pry'

class WordAnalysis

  attr_reader :input
  attr_reader :words_parse
  attr_reader :characters_parse

  def initialize(input)
    @input = input
    @words_parse = input.split(' ')
    @characters_parse = input.split('')
  end

  def select_letters
    @characters_parse.select {|c| c =~ /[^\d|\s]/ }
  end

  def select_symbols
    @characters_parse.select {|c| c =~ /[^\w\|\d|\s]/ }
  end

  def word_count
    word_count = Hash.new(0)
    @words_parse.each {|word| word_count[word] += 1}
    word_count
  end

  def letter_count
    letter_count = Hash.new(0)
    select_letters.each {|letter| letter_count[letter] += 1}
    letter_count
  end

  def symbol_count
    symbol_count = Hash.new(0)
    select_symbols.each {|symbol| symbol_count[symbol] += 1}
    symbol_count
  end

  def common_words
    common_words = word_count.sort_by {|word, count| -count}.first(3)
  end

  def common_letters
    common_letters = letter_count.sort_by {|letter, count| -count}.first(3)
  end

end



