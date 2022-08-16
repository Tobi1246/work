ALPHABET = ('a'..'z').to_a
vowels = ["a", "e", "i", "o", "u", "y"]
hash_abc = {}
ALPHABET.each_with_index do |letter, i|
  hash_abc[letter] = i + 1 if vowels.index.include?(letter) 	
end
puts hash_abc

	
