
puts "Введите значение a"
a = gets.chomp.to_f

puts "Введите значение b"
b = gets.chomp.to_f

puts "Введите  значение c"
c = gets.chomp.to_f


d = (b**2)-(4*a*c)
if d < 0 
	puts "Нет корней"
else 
	x1 = (-b+Math.sqrt(b))/2*a.to_f
	x2 = (-b-Math.sqrt(b))/2*a.to_f
puts "x1 = #{x1}"
puts "x2 = #{x2}"
end

