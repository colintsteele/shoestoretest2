class Month

  attr_accessor :driver, :url

  def initialize(driver, url)
    @driver = driver
    @url = url
  end

  def shoe_results
    @driver.tds( class:'shoe_image' )
  end

  def shoe_prices
    @driver.tds( class:'shoe_price' )
  end

  def visit
    @driver.goto @url
  end

  def shoe_price?
    @driver.td(class:'shoe_price').exists?
  end

  def shoe_image? shoe
    shoe.td(class:'shoe_image').exists?
  end

  def all_shoe_prices_present
    return false unless shoe_price?

    shoe_prices.each do |desc|
      if desc.text.nil?
        false
      else
        false if desc.text == ''
      end

    end
  end

  def all_shoe_images_present


    shoe_results.each do |shoe|
      return false unless shoe_image? shoe
      return false if shoe.td(class:'shoe_image').img.attribute_value('src').nil?
    end
  end



end
