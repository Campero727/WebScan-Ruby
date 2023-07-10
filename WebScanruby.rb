#!/usr/bin/env ruby
# Created By Pirata
#

require 'wappalyzer'

analizer=Wappalyzer::Detector.new

results=analizer.analyze('http://192.168.225.245')

puts results

results.each do |tech|
  puts tech[0]
  puts "Categories"
  tech[1]['categories'].each do |cat|
    puts "-> #{cat}"
  end
  puts "Confidence #{tech[1]['confidence']}"
  puts "Version #{tech[1]['version']}"

end

