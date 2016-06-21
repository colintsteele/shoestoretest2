require 'spec_helper'

describe 'Subscription Field' do

  before :all do

    @driver = Watir::Browser.new :phantomjs
    @url = 'http://shoestore-manheim.rhcloud.com/'
    @page = Home.new(@driver, @url)
  end

  after :all do
    @driver.quit
  end


  it 'found the subscriber submission field' do
    expect( @page.email_submission_field ).to exist
  end

  it 'accepted valid subscriber e-mail submission' do
    user = 'foo@bar.com'
    @page.email_submission_field.set user
    @page.email_submission_form.submit
    expect( @page.email_submission_flash.text ).to include('Thanks!')
  end

  #failing tests
  it 'did not accept invalid subscriber e-mail' do
    user = 'foo bar.com'
    @page.email_submission_field.set user
    @page.email_submission_form.submit
    expect( @page.email_submission_flash.text ).to include('Sorry!')
  end

end

