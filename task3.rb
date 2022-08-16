num = [0, 1]
i = 2
while (num[i-2] + num[i-1]) <= 100
 num[i] = (num[i-2] + num[i-1])
 num << num[i]
  i += 1
end 
 puts num
