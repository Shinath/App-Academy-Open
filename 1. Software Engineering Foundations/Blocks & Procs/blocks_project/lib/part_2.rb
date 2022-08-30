def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word}
end

def no_valid_url?(urls)
  valid_endings = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    valid_endings.any? { |ending| url.end_with?(ending) }
  end
end

def any_passing_students?(students)
  students.any? do |student|
    avr = student[:grades].sum / student[:grades].length * 1.0
    avr >= 75
  end
end