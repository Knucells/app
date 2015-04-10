require 'nokogiri'
require 'open-uri'

class NokogiriController < ApplicationController

def frequencies(content)
  Hash[
    content.group_by(&:downcase).map{ |word, instances|
      [word,instances.length]
      }.sort_by(&:last).reverse
    ]
end

doc = Nokogiri::HTML(open('http://www.imsdb.com/scripts/Authors-Anonymous.html'))

doc.css('b').remove
text = doc.css('pre').map(&:text)
text 
# => ["\r\n\r\n\r\n\r\n\r\n\r\n                          Written by\r\n\r\n                       David Congalton\r\n\r\n\r\n\r\n\r\n                                                       July 14 2012\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    North Hayworth Avenue, off Sunset Boulevard. A quiet, tree-\r\n    lined residential street. Note the small apartment complex\r\n    set back from the curb.\r\n\r\n\r\n    Our narrator is HENRY OBERT (O-BURT)(30).\r\n\r\n               This is where whe...

text.join(' ')
# => "\r\n\r\n\r\n\r\n\r\n\r\n                          Written by\r\n\r\n                       David Congalton\r\n\r\n\r\n\r\n\r\n                                                       July 14 2012\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    North Hayworth Avenue, off Sunset Boulevard. A quiet, tree-\r\n    lined residential street. Note the small apartment complex\r\n    set back from the curb.\r\n\r\n\r\n    Our narrator is HENRY OBERT (O-BURT)(30).\r\n\r\n               This is where wher...

content = text.join(' ').scan(/\w+/) 
# => ["Written", "by", "David", "Congalton", "July", "14", "2012", "North", "Hayworth", "Avenue", "off", "Sunset", "Boulevard", "A", "quiet", "tree", "lined", "residential", "street", "Note", "the", "small", "apartment", "complex", "set", "back", "from", "the", "curb", "Our", "narrator", "is", "HENRY", "OBERT", "O", "BURT", "30", "This", "is", "where", "where", "F", "Scott", "Fitzgerald", "died", "on", "December", "21", "1940", "INSERT", "ARCHIVAL", "PHOTOS", "of", "Fitzgerald", "His", "w...

frequencies(content)
end