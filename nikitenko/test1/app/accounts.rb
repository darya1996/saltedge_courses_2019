require_relative 'transactions'

class Accounts < Transactions
  def get_account_info
    @acc_hash = {}.to_a
	@acc_hash << account_information
	puts JSON.pretty_generate @acc_hash
	get_transaction_info
  end	

  def account_information
	{
	  "name" => acc_name_html.at_css("h5#user--identificator").text,
	  "balance" => card_html.css("tbody td[class=ng-scope] span")[1].text,
	  "currency" => card_html.css("tbody td[class=ng-scope] span")[0].text,
	}
  end	

  def acc_name_html
	Nokogiri::HTML.fragment(browser.div(class: "well").html)
  end	

  def card_html
	Nokogiri::HTML.fragment(browser.table(id: "dashboardDeposits").html)
  end	

end	