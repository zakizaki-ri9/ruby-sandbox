# frozen_string_literal: true

def fizz_buzz(num)
  if (num % 15).zero?
    'Fizz Buzz'
  elsif (num % 3).zero?
    'Fizz'
  elsif (num % 5).zero?
    'Buzz'
  else
    n.to_s
  end
end
