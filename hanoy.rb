#!/usr/bin/ruby

nice_tower = "abcd"

$towers = [nice_tower, "", ""]

def show_towers
  puts "\n The towers"
  puts " ---------\n"
  $towers.each_with_index{
    |tower, i|
    puts "\t#{i}\t#{tower}"
  }
end

def show_keys
  puts " keys: a up, z down, q to quit, h help\n"
end

def show_help(a)
  puts " \tMove the letters one by one, from tower to tower, so that the"
  puts " last row shows #{a}.\n"
  puts " Rules:  a can't go to the right of any other letter, b can't go to the right of c or d"
  puts " c can't go to the right of d, and d can go to the right of any other\n\n"
  show_keys
end

def row
  raw_input = gets.chomp
  puts("Choose row number")
  case raw_input
  when "0"
    x = 0
  when "1"
    x = 1
  when "2"
    x = 2
  else
    row(up)
  end
  x
end


def move
  from_row_index = row
  from_row = $towers[from_row_index]
  if from_row == ""
    puts("Wrong!")
    return
  else
    to_row_index = row
    to_row = $towers[to_row_index]
    to_letter = to_row[-1]
    from_letter = from_row[-1]
    if to_letter == nil || from_letter > to_letter
      $towers[from_row_index] = $towers[from_row_index].slice(0..-2)
      $towers[to_row_index]  = $towers[to_row_index] + from_letter
      puts($towers)
    else
      puts("Wrong!")
    end
  end
end

def process_command
  puts "Your command?"
  command = gets.chomp
  case command
  when "m"
    move
  when "h"
    show_help(nice_tower)
  when "q"
    abort("LOOOSER!!!")
  else
    process_command
  end
end



# main procedure

show_help(nice_tower)

until $towers[2] == nice_tower
  show_towers
  process_command
end

puts "you win!"
