#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require "execjs"
require "rainbow"

source = open("./water3js/water3.js").read
$context = ExecJS.compile source

#data = context.exec "return data"
#result = context.exec "return getWater(data)"

def get_result(data)
  $context.exec "return getWater(#{data})"
end

def get_water(data)
  height = data.max
  width = data.length
  grid = Array.new(width) { |i| Array.new(height) }
  for x in 0..width-1
    for y in 0..height-1
      grid[x][y] = y < data[x] ? :block : :water
    end
  end
  remove_pass grid
  grid.collect { |column| column.count(:water) }.each.reduce(:+)
end

def remove_pass(grid)
  for y in 0..grid[0].length-1
    for x in 0..grid.length-1
      clear(grid, x, y) || break
    end
    for x in (0..grid.length-1).to_a.reverse
      clear(grid, x, y) || break
    end
  end
end

def clear(grid, x, y)
  if grid[x][y] == :water && clear?(grid, x, y)
    grid[x][y] = :air
    true
  else
    false
  end
end

def clear?(grid, x, y)
  left_clear?(grid, x, y) || right_clear?(grid, x, y)
end

def left_clear?(grid, x, y)
  x == 0 || grid[x-1][y] == :air
end

def right_clear?(grid, x, y)
  x >= grid.length-1 || grid[x+1][y] == :air
end

puts "Height\tWidth\tHugh\tJames"
for test in 1..100
  height = rand(2..10)
  data = Array.new(rand(10..100)) { rand(1..height) }
  print "#{height}\t#{data.length}\t"
  $stdout.flush
  hugh = get_result(data)
  print "#{hugh}\t"
  $stdout.flush
  james = get_water(data)
  print "#{james}\t"
  $stdout.flush
  if(hugh == james)
    puts "PASS".foreground(:green)
  else
    puts "FAIL".foreground(:red)
  end
end
