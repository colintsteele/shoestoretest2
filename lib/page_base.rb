class PageBase

  @@driver = nil
  @@url = nil

  def initialize driver, url
    @@driver = driver
    @@url = url
  end

end