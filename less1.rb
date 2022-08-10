puts "Привет! , Введи своё Имя "
name=gets.chomp.capitalize

puts "Введите #{name} ваш рост  "
height=Float(gets.chomp)

ideal_wt = (height - 110) * 1.15
if ideal_wt < 0
    puts " #{name} , ваш вес уже оптимальный "
else 
     puts " #{name}, Ваш вес не оптимальный "
end
