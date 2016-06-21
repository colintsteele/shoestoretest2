require 'spec_helper'

@driver = Watir::Browser.new
@url = 'http://shoestore-manheim.rhcloud.com'
page = Home.new(@driver, @url)

@months = []

page.months.each do |month|
  url = @url + '/months/' + month
  @months << Month.new(@driver, url, month)
end
@months.each do |month|
  describe "Month of #{month.name}" do

    before :all do
      month.visit
    end

    before :each do
      #@result = month.shoe_results?
    end

    it 'shows prices' do
      all_prices_present = true
      all_prices_present = month.all_shoe_prices_present?
      expect( all_prices_present ).to be_truthy
    end

    it 'has images of shoes' do
      all_images_present = true
      all_images_present = month.all_shoe_images_present?
      expect( all_images_present ).to be_truthy
    end

    it 'has a blurb' do
      all_blurbs_present = true
      all_blurbs_present = month.all_blurbs_present?
      expect( all_blurbs_present ).to be_truthy
    end


  end
end
