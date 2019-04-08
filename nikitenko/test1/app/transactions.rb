require 'nokogiri'
require 'watir'
require 'pry'
require 'open-uri'

class Transactions
  def get_transaction_info
    @transactions = {}.to_a
    for i in 0..4
      @transactions << transaction_information(i)
    end
    puts JSON.pretty_generate @transactions
  end	

  def transaction_information(i)
    {
      "date" => transaction_html.css("tbody tr")[i].css("td[class=ng-scope] span")[0].text,
      "description" => transaction_html.css("tbody tr")[i].css("td")[2].css("p")[0].text,
      "amount" => transaction_html.css("tbody tr")[i].css("td[class=ng-scope] span")[3].text
    }
  end

  def transaction_html
    Nokogiri::HTML.fragment(browser.table(id: "lastFiveTransactions").html)
  end	

end	
