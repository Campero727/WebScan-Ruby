#!/usr/bin/env ruby
# Created By Pirata
#
#

require 'wappalyzer'

class String
  def red; colorize(self, "\e[1m\e[31m"); end
  def green; colorize(self, "\e[1m\e[32m"); end
  def dark_green; colorize(self, "\e[32m"); end
  def yellow; colorize(self, "\e[1m\e[33m"); end
  def blue; colorize(self, "\e[1m\e[34m"); end
  def dark_blue; colorize(self, "\e[34m"); end
  def purple; colorize(self, "\e[35m"); end
  def dark_purple; colorize(self, "\e[1;35m"); end
  def cyan; colorize(self, "\e[1;36m"); end
  def dark_cyan; colorize(self, "\e[36m"); end
  def pure; colorize(self, "\e[0m\e[28m"); end
  def bold; colorize(self, "\e[1m"); end
  def colorize(text, color_code) "#{color_code}#{text}\e[0m" end
end


def detect_tech(url)
  analizer=Wappalyzer::Detector.new
  results=analizer.analyze(url)

  puts "*".red*50
  results.each do |tech|
    puts "Technology:".purple+" #{tech[0]}".blue
    puts "Categories: ".purple
    
    tech[1]['categories'].each do |cat|
      puts "\t ->".yellow+" #{cat}"
    end
    
    puts "Confidence: ".purple+"#{tech[1]['confidence']}"
    puts "Version: ".purple+"#{tech[1]['version']}\n\n"
  end

  puts "*".red*50
end

detect_tech('http://192.168.225.245')

