require 'rspec'
require 'pry'
require_relative '../lib/wordanalysis'

describe WordAnalysis do

  let(:words_input) {WordAnalysis.new("this is one1 sentence4 par$ed! Here's   an0ther one~~.")}
  let(:characters_input) {WordAnalysis.new("this is a parse")}
  let(:word_freq_input) {WordAnalysis.new("one two two three three three")}
  let(:letter_freq_input) {WordAnalysis.new("here are only letters")}
  let(:most_common_input) {WordAnalysis.new("the the the the top top top words here words words words are words the tope and words")}
  let(:symbol_freq_input) {WordAnalysis.new("!@#{}as 2@3s ajdf !!*")}


  it 'parses the user input into separate words' do
    expect(words_input.words_parse).to eq(["this", "is", "one1", "sentence4", "par$ed!", "Here's", "an0ther", "one~~."])
  end

  it 'parses the use input into separate letters' do
    expect(characters_input.characters_parse).to eq(["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "p", "a", "r", "s", "e"])
  end

  it 'returns the count of each separate word' do
    expect(word_freq_input.word_count).to eq("one"=>1, "two"=>2, "three"=>3)
  end

  it 'returns the count of each letter' do
    expect(letter_freq_input.letter_count).to eq("h"=>1, "e"=>5, "r"=>3, "a"=>1, "o"=>1, "n"=>1, "l"=>2, "y"=>1, "t"=>2, "s"=>1)
  end

  it 'returns the count of each symbol (non-letters and non-digits)' do
    expect(symbol_freq_input.symbol_count).to eq("!"=>3, "@"=>2, "*"=>1)
  end

  it 'returns the top 3 most common words' do
    expect(most_common_input.common_words).to eq([["words", 6], ["the", 5], ["top", 3]])
  end

  it 'returns the top 3 most common letters' do
    expect(most_common_input.common_letters).to eq([["o", 10], ["t", 9], ["e", 9]])
  end

end
