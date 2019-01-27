# Программа для шифрования слова с помощью механизма MD5 или SHA1
require "digest"

METHODS = [:MD5, :SHA1, :SHA2]

puts "Введите слово или фразу для шифрования:"
string = STDIN.gets.chomp

puts "\nКаким способом зашифровать:"
METHODS.each_with_index { |method, index| puts "#{index + 1}. #{method}" }

chosen_index = STDIN.gets.to_i - 1

until chosen_index.between?(0, METHODS.size - 1)
  puts "Введите 1, 2 или 3"
  chosen_index = STDIN.gets.to_i - 1
end

chosen_method = METHODS[chosen_index]

puts "\nВот что получилось:"

case chosen_method
when :MD5 then puts Digest::MD5.hexdigest(string)
when :SHA1 then puts Digest::SHA1.hexdigest(string)
when :SHA2 then puts Digest::SHA2.hexdigest(string)
end
