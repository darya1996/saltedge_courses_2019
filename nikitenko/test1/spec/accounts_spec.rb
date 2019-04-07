require_relative 'spec_helper'
require_relative "../app/test1"

describe Accounts do 
  let(:nokogiri) {Nokogiri::HTML}
  let(:acc_name_html) {nokogiri.fragment(File.read("fixtures/acc_name_html.html"))}
  let(:card_html) {nokogiri.fragment(File.read("fixtures/card_html.html"))}
  let(:transaction_html) {nokogiri.fragment(File.read("fixtures/transaction_html.html"))}

  before do
    #allow(subject).to receive(:browser)
    allow(subject).to receive(:acc_name_html) { acc_name_html }
    allow(subject).to receive(:card_html) { card_html }
    allow(subject).to receive(:transaction_html) { transaction_html }
  end	

  describe "#account_information" do
    it "parses data" do
      expect(subject.send(:account_information)).to match({
       "name" => String,
       "balance" => String,
       "currency" => String
      })
    end
   end

  describe "#transaction_information" do
    it "parses data" do
      expect(subject.send(:transaction_information,0)).to match({
       "date" => String,
       "description" => String,
       "amount" => String
      })
    end
  end
  
end