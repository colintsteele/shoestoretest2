class Month

  attr_accessor :driver, :url, :name

  def initialize(driver, url, name)
    @driver = driver
    @url = url
    @name = name
  end

  def shoe_results
    @driver.divs( class:'shoe_result' )
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

  def shoe_desc? shoe
    shoe.td(class:'shoe_description').exists?
  end

  def all_shoe_images_present?
    return false unless @driver.div( class:'shoe_result' ).exists?
    shoe_results.each do |shoe|

      image = shoe.td( class:'shoe_image')

      if image.exists?
        return false if image.img.attribute_value('src').empty?
      else
        return false if image.img.exists?
      end

    end

  end

  def all_shoe_prices_present?
    return false unless shoe_price?
    shoe_prices.each do |price|
      if price.text.nil?
        false
      else
        false if price.text == ''
      end

    end
  end


  def all_blurbs_present?
    return false unless @driver.td( class:'shoe_description').exists?

    shoe_results.each do |shoe|
      desc = shoe.td( class:'shoe_description')
      return false unless desc.exists?

      if desc.text.empty?
        return false
      else
        return false unless desc.text.size > 10
      end

    end

  end




end
