puts "Добро пожаловать в наш магазин, выберите тавары из каталога" 
puts "Для завершения покупок или выхода введите stop в строке названия товара"
catalog = {}
cost = 0 
  loop  do
   puts "Название тавара"
  name_t = gets.chomp
  break if name_t == "stop" 
  puts "Стоимость тавара"
  name_price = gets.chomp.to_f
  puts "Ко-во тавара"
  name_quanta = gets.chomp.to_f
  catalog[name_t] = {name_price=>name_quanta}     
end
  catalog.each {|name_t, name_price| cost += name_price.keys.first * name_price.values.first}
puts catalog
puts "Стоимость всех ваших товаров = #{cost}$"
