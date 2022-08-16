m_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Введите данные"
puts "Дата"
date = gets.chomp.to_i
puts "Месяц"
month = gets.chomp.to_i
puts "Год"
year = gets.chomp.to_i
n_date = 0
for i in 0..month - 2
  n_date += m_day[i]
end
if (year % 4 == 0)
	n_date += 1
 else ((year % 400 == 0) && (year % 100 == 0))
 	n_date = n_date
end
n_date = date + n_date
puts "Порядковый номер даты #{n_date}"
