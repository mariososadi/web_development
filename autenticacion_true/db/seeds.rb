File.open("words", "r") do |f|
  f.each_line do |line|
    Word.create(word: line.chomp, canonical: line.chomp.downcase.chars.sort.join)
  end
end