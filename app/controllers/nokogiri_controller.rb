require 'rubygems'
require 'nokogiri'
require 'open-uri'

class NokogiriController < ApplicationController
  
	def index
  page = 'http://www.imsdb.com/scripts/Authors-Anonymous.html'
  doc = Nokogiri::HTML(open(page))
  
    @content = doc.css('b').remove
    @content = doc.css('pre')
 
    puts @content
  end
end
  
