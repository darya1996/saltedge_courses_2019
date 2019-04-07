require_relative 'accounts'

class Web_Banking< Accounts
  def run 
    browser.goto('https://my.fibank.bg/oauth2-server/login?client_id=E_BANK')
	  browser
	  go_to_demo
	  get_account_info
  end	

  def go_to_demo
	  browser.a(id: "demo-link").click
  end	

  def browser
	  @browser ||= Watir::Browser.new :chrome
  end	
end	