sides = []
puts "Введите значение первой стороны треугольника"
a=gets.chomp.to_f

puts "Введите значение второй стороны треугольника"
b=gets.chomp.to_f

puts "Введите  значение третьей стороны треугольника"
c=gets.chomp.to_f

sides = [a ,b ,c]
sides.sort


side_a = sides[0]
side_b = sides[1]
hypo_se = sides[2]

puts "#{hypo_se**2} = #{side_a**2} + #{side_b**2}"
if hypo_se**2 < side_a**2 + side_b**2
  puts 'Треугольник равносторонний'
elsif hypo_se**2 == side_a**2 + side_b**2
  puts 'Треугольник прямоугольный'
elsif hypo_se**2 > side_a**2 + side_b**2
  puts 'Треугольник равнобедренный'
else
  puts 'Что-то другое'
end
