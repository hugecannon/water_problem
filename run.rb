#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require "execjs"

source = open("./water3js/water3.js").read
context = ExecJS.compile source

puts context.exec "return getWater(data)"
