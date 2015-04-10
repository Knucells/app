require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

class NokogiriController < ApplicationController
  page = 'http://www.imsdb.com/scripts/Authors-Anonymous.html'
  doc = Nokogiri::HTML(open(page))
  
  #code remove anything in <b></b> tags, and only outputs
  #the movie script (kept in <pre></pre> tags)
  text = doc.css('b').remove
  text = doc.css('pre')

  content = text.to_s.scan(/\w+/)
  puts content.length, content.uniq.length, content.uniq.sort[0..8]

  helper_method :frequencies
  
  def frequencies(content)
    Hash[
      content.group_by(&:downcase).map{ |word, instances|
        [word,instances.length]
        }.sort_by(&:last).reverse
      ]
  end
end
  
