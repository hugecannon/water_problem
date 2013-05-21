#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require "execjs"

source = open("./water3js/water3.js").read
context = ExecJS.compile source

data = context.exec "return data"
result = context.exec "return getWater(data)"

def get_water(data)
  height = data.max
  width = data.length
  # grid[x][y]
  grid = Array.new(width) { |i| Array.new(height) }
  for x in 0..width-1
    for y in 0..height-1
      grid[x][y] = y < data[x] ? :block : :water
    end
  end
  #print_grid grid
  remove_pass grid
end

def print_grid(grid)
  for y in (0..grid[0].length-1).to_a.reverse
    for x in 0..grid.length-1
      print case grid[x][y]
      when :water
        "~"
      when :block
        "#"
      when :air
        " "
      end
    end
    puts
  end
end

def print_position(grid, p_x, p_y)
  puts "#{p_x}, #{p_y}"
  puts "type: #{grid[p_x][p_y]}"
  puts "clear: #{clear?(grid, p_x, p_y) ? :true : :false}"
  for y in (0..grid[0].length-1).to_a.reverse
    for x in 0..grid.length-1
#      puts "x: #{x}, y: #{y}, p_x: #{p_x}, p_y: #{p_y}"
      if x == p_x && y == p_y
        print case grid[x][y]
        when :water
          "W"
        when :block
          "B"
        when :air
          "A"
        end
      else
        print case grid[x][y]
        when :water
          "~"
        when :block
          "#"
        when :air
          " "
        end
      end
    end
    puts
  end
end

def remove_pass(grid)
  for y in 0..grid[0].length-1
    for x in 0..grid.length-1
      print_position grid, x, y
      clear(grid, x, y) || break
    end
    for x in (0..grid.length-1).to_a.reverse
      print_position grid, x, y
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

get_water(data)
