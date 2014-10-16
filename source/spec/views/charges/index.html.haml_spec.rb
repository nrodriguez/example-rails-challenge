require 'rails_helper'

RSpec.describe "charges/index.html.haml", :type => :view do
  describe "shows all types of charges" do
  	it "displays failed charges" do
	  	visit root_path
      expect(page).to have_content('Failed Charges')
	  end
	  it "displays disputed charges" do
	  	visit root_path
      expect(page).to have_content('Disputed Charges')
	  end
	  it "displays successful charges" do
	  	visit root_path
      expect(page).to have_content('Successful Charges')
	  end
	end

  describe "shows the proper number of charges" do
    before(:all) do
      customer = FactoryGirl.create(:customer)
      10.times do
        FactoryGirl.create(:successful_charge, customer_id: customer.id)
      end

      5.times do
        FactoryGirl.create(:failed_charge, customer_id: customer.id)
      end

      5.times do
        FactoryGirl.create(:disputed_charge, customer_id: customer.id)
      end
    end

    it "displays the proper amount of failed charges" do
      visit root_path
      page.assert_selector('#failed_charges tr#charge', :count => 5)
    end

    it "displays the proper amount of disputed charges" do
      visit root_path
      page.assert_selector('#disputed_charges tr#charge', :count => 5)
    end

    it "displays the proper amount of successful charges" do
      visit root_path
      page.assert_selector('#successful_charges tr#charge', :count => 10)
    end
  end
end
