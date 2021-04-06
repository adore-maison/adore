class AsinGrabberService
  def initialize(option)
    @asin = option
  end

  def perform
    grab_product_details
  end

  private

  def grab_product_details
    product =  {}
    page = MetaInspector.new("https://www.amazon.in/dp/#{@asin}")
    if page.response.status == 200
      product[:description] = page.parsed.xpath('//*[@id="productTitle"]').text.strip
      product[:photo_url] = page.parsed.xpath('//*[@id="landingImage"]').first.values[2]
      product[:comp_price] = page.parsed.xpath('//*[@id="priceblock_ourprice"]').text.scan(/[.0-9]/).join().to_d
      product[:comp_rating] = page.parsed.xpath('//*[@id="acrPopover"]/span[1]/a/i[1]/span').text.split.first.to_d
      product[:comp_review_count] = page.parsed.xpath('//*[@id="acrCustomerReviewText"]').text.split.first.to_i
      product[:main_category] = page.parsed.xpath('//*[@id="wayfinding-breadcrumbs_feature_div"]/ul/li[1]/span/a').text.split.join(' ')
      product
    else
      Rails.logger.error "FAILED TO GRAB ASIN #{@asin}"
      { status: 'error' }
    end
  end
end
