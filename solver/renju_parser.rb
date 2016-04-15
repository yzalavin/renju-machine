require 'nokogiri'

class RenjuParser
  def retrieve_trains
    doc.xpath('//move').map { |m| m.text.split(' ') }
  end

  private

  def doc
    Nokogiri::XML(File.open("data.rif"))
  end
end
