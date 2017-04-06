#!/usr/bin/ruby

nice_tower = "abcd"

towers = [nice_tower, "", ""]

def show_towers(towers)
  puts "\n The towers"
  puts " ---------\n"
  towers.each_with_index{
    |tower, i|
    puts "\t#{i}\t#{tower}"
  }
end

def show_keys
  puts " keys: o left, p right, q to quit, h help\n"
end

def show_help(a)
  puts " \tMove the letters one by one, from tower to tower, so tha the"
  puts " last tower shows #{a}.\n"
  puts " Rules:  a can't go to the right of any other letter, b can't go to the right of c or d"
  puts " c can't go to the right of d, and d can go to the right of any other\n\n"
  show_keys
end

def filter_input
  commands = "opqh"
  raw_input = gets.chomp
  if commands.include?(raw_input[0])
    return raw_input[0]
  else
    return filter_input
  end
end

show_help(nice_tower)

until towers[2] == nice_tower
  show_towers(towers)
  towers[2] = nice_tower
  order = filter_input
  case order
    when "o"
      puts "o"
    when "p"
      puts "p"
    when "h"
      show_help(nice_tower)
    when "q"
      abort("LOOOSER!!!")
  end
end

puts "you win!"
