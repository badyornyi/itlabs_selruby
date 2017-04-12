def ten_random_integers
  i = 0
  while i < 10
    puts '========='
    n = rand(9)
    case
      when n.class != Fixnum
        puts "the #{n} is not FixNum. It is #{n.class}"
      when n == 0
        puts "we've got 0"
      when n.even?
        puts 'the number is even'
      else
        puts 'the number is odd'
    end

    if n.class != Fixnum
      puts "the #{n} is not comparable with 5"
    elsif (n < 5) && (n != 0)
      puts 'the number is less than 5'
    elsif n > 5
      puts 'the number is more than 5'
    elsif n == 5
      puts 'the number is 5'
    end
    i += 1
  end
end