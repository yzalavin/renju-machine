require 'nokogiri'

class RenjuParser
  def retrieve_trains
    # hash = {}
    # # doc.xpath('//game').first.attributes['rule'].value
    # doc.xpath('//game').each do |node|
    #   rule = node.attributes['rule'].value
    #   hash[rule] = 0 if hash[rule].nil?
    #   hash[rule] += 1
    # end
    # hash.sort_by { |k, v| v }
    doc.xpath('//move').map { |m| m.text.split(' ') }
  end

  private

  def doc
    Nokogiri::XML(File.open("data.rif"))
  end
end
