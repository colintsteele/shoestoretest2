require_relative 'month'
class Home
  attr_accessor :driver

  def initialize(driver, url)
    @driver = driver
    @url = url
    @driver.goto url

  end

  def email_submission_field
    @driver.text_field( id: 'remind_email_input' )
  end

  def email_submission_form
    @driver.form( id: 'remind_email_form' )
  end

  def email_submission_flash
    @driver.div( id: 'flash')
  end

  def months
    links = []

    @driver.div( id:'header_nav' ).lis.each do |li|
      li.links.each do |link|
        links << @url + '/months/' + link.text.downcase
        #links << link.text.downcase
      end
    end
    links
  end

  def visit_months
    months.each do

    end
  end

end