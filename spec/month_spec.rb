

describe "Month" do

  before :all do
    @driver = Watir::Browser.new
    @url = 'http://shoestore-manheim.rhcloud.com'
    @page = Home.new(@driver, @url)

    @months = []

    @page.months.each do |month|
      @months << Month.new(@driver, month)
    end

  end

  after :all do
    @driver.quit
  end


  it 'shows images of shoes' do
    all_images_present = true
    @months.each do |month|
      month.visit
      @driver.tds( class:'shoe_image' ).each do |image|
        bad_image = image.img.attribute_value('src').eql? nil
        all_images_present = false unless bad_image

      end
    end
    expect( all_images_present ).to be_truthy
  end

  it 'has a blurb' do
    all_blurbs_present = true

    @months.each do |month|
      month.visit

      all_blurbs_present = false unless @driver.td(class:'shoe_description').exists?

      @driver.tds( class:'shoe_description' ).each do |desc|

        if desc.text.nil?
          all_blurbs_present = false
        else
          all_blurbs_present = false if desc.text == ''
        end

      end
    end

    expect( all_blurbs_present ).to be_truthy
  end

  it 'has a price' do
    all_prices_present = true

    @months.each do |month|
      month.visit

      all_prices_present = false unless @driver.td(class:'shoe_price').exists?

      @driver.tds( class:'shoe_price' ).each do |desc|

        if desc.text.nil?
          all_prices_present = false
        else
          all_prices_present = false if desc.text == ''
        end

      end
    end
    expect( all_prices_present ).to be_truthy
    
  end





end
