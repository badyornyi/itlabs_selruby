#1. Create a method which will take a natural number as an argument and will find a sum of all its digits

#it has strange behaviour in case when 1st digit of number is 0 (such as 012, 0177, etc)
#code recognize them as octal numbers
def sum_of_digits (nat_num)
  if nat_num.class.is_a?(Fixnum) && nat_num >= 0
    str_digits = nat_num.to_s
    arr_digits = str_digits.split('')
    i = 0
    sum_digits = 0
    while i < (arr_digits.length)
      sum_digits = sum_digits+arr_digits[i].to_i
      i+=1
    end

    #return sum_digits
    puts "Your number's digits sum is #{sum_digits}"
  else
    #return 0
    puts "Sorry, but #{nat_num} is not a number or not a natural number"
  end
end


#2. There is a string. Find a maximum number of digits placed in a row in it

#str = 'qw12e63406q4qeg156g16w1'
def digits_maxnum_in_string (str)
  arr = Array.new
  max_length = 0
  str.chars do |char|
    if char == '0'
      i_char = char.to_i
      arr = arr << i_char
      if max_length < arr.length
        max_length = arr.length
      end
    elsif (i_char = char.to_i) > 0
      arr = arr << i_char
      if max_length < arr.length
        max_length = arr.length
      end
    else
      arr = Array.new
    end
  end
  puts "Maximum number of digits in a row is #{max_length}"
  #return max_length
end


#3. There is a string. Find a maximal number (not a digit) in it

#str = 'qw10e614q4qeg156g16w1'
def max_number_in_string (str)
  arr = Array.new
  number = 0
  temp_num = 0
  temp_str = ''
  str.chars do |char|
    if char == '0'
      i_char = char.to_i
      arr = arr << i_char
      temp_str = temp_str + arr[-1].to_s
      temp_num = temp_str.to_i
      if number < temp_num
        number = temp_num
      else
        arr = Array.new
      end
    elsif (i_char = char.to_i) > 0
      arr = arr << i_char
      temp_str = temp_str + arr[-1].to_s
      temp_num = temp_str.to_i
      if number < temp_num
        number = temp_num
      else
        arr = Array.new
      end
    else
      arr = Array.new
      temp_num = 0
      temp_str = ''
    end
  end
  puts "Maximum number in a string is #{number}"
  #return number
end


#4. There are two strings. Find number of first chars from first string matching first chars of the second string. Consider two cases:
#- strings are definitely different
#- strings can completely match
#str1 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
#str2 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
#str3 = 'auqila angam erolod te erobal tu tnudidicni ropmet domsuie od des ,tile gnicsipida rutetcesnoc ,tema tis rolod muspi meroL'


#5. There is an array of integers. First puts elements with even indexes and then with odd indexes

#ary = [1,2,3,4,5,6,7,8,9]
def even_and_odd_indexes (ary)
  puts 'Elements with even indexes are:'
  i = 0
  while i < ary.length
    puts ary[i]
    i = i+2
  end
  puts 'Elements with odd indexes are:'
  i = 1
  while i < ary.length
    puts ary[i]
    i = i+2
  end
end


#6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]

#ary = [1,2,3,4,5,6,7,8,9]
def arr_last_element_index (ary)
  last_index = ary.length - 1
  puts "Last index of your array is #{last_index}"
end


#7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number. Don't do it for first and last elements

#ary = [2,3,8,2,5,6,7,2,8]
def modify_even_number_in_ary (ary)
  i = 1
  last_index = ary.length - 1
  while i < last_index
    if ary[i].even?
      ary[i] = ary[i] + ary[0]
    end
    i+=1
  end
  return ary
end


#8. There is a hash where keys and values are strings. Modify it: all keys should be symbols and all values should be integers. If you couldn't modify some value set it to nil

#h = {'Lorem' => '1', 'dolor' => ':sit', 'amet' => '-3', 'adipiscing' => 'elit','sed' => 'do', 'eiusmod' => '0'}
def hash_str_to_sym_and_int (h)
  a_keys = h.keys
  a_values = h.values

  h.delete_if do |key, value|
    key.class == String
  end

  i = 0
  while i < a_keys.length
    a_keys[i] = a_keys[i].to_sym
    if a_values[i] == '0'
      a_values[i] = a_values[i].to_i
    elsif a_values[i].to_i.is_a?(Fixnum) && a_values[i].to_i != 0
      a_values[i] = a_values[i].to_i
    else
      a_values[i] = nil
    end
    h[a_keys[i]]=a_values[i]
    i+=1
  end
  return h
end


#9. There is a hash where keys are symbols and values are integers. Modify it: remove all pairs where symbols start with "s" character

#h = {Lorem: 1, solor: 3, smet: 5, adipiscing: 7, Sed: 9, eiusmod: 0}
def hash_rem_pair_key_start_s_char (h)
  h.delete_if do |key, value|
    key.to_s.split('')[0] == 's'
  end
  return h
end


#10. There is a hash where keys are symbols and values are integers. Modify it: leave only pairs where value is natural number and more than 0

#h = {Lorem: 1, solor: 3, smet: -5, adipiscing: -7, Sed: 9, eiusmod: 0}
def hash_leave_pair_val_natural (h)
  h.delete_if do |key, value|
    value <= 0
  end
  return h
end