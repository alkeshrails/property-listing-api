require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'cgi'
require 'json'

namespace :db do
  desc 'Scrape properties and seed the database'
  task scrape_properties: :environment do
    # Load configuration
    config_path = Rails.root.join('config', 'config.yml')
    config = YAML.load_file(config_path)

    # Construct the filter query parameter
    filter_params = {
      "city" => CGI.escape(config['city']),
      "dist" => config['districts'].to_json,
      "rent" => { "min" => config['rent_per_month']['min'].to_s, "max" => config['rent_per_month']['max'].to_s },
      "floor_size" => { "min" => "", "max" => "" },
      "residential" => { "total_room" => { "min" => "", "max" => config['beds_number'].to_s } },
      "office" => {},
      "storefront" => {}
    }.to_json

    # Encode the filter parameter for URL
    encoded_filter = CGI.escape(filter_params)

    # Construct the full URL with ordering and direction
    url = "https://www.urhouse.com.tw/en/rentals?filter=#{encoded_filter}&ordering=price&direction=ASC&mode=list"

    # Open the URL and read the HTML content
    doc = Nokogiri::HTML(URI.open(url))

    # Array to hold all the listings
    listings = []

    # Loop through each listing on the page
    doc.css('.listing-selector').each do |listing| # Replace with actual selector
      # Extract the data based on the assumed structure
      # ...
      # Your scraping logic here
      # ...
    end

    # Sort by price and select 6 random entries
    selected_listings = listings.sort_by { |h| h[:price_per_month] }.sample(6)

    # Output the selected listings
    puts selected_listings.inspect

    # Insert data into the database
    selected_listings.each do |listing|
      # Property.create!({
      #   image_url: listing[:image_url],
      #   title: listing[:title],
      #   price: listing[:price_per_month],
      #   address: listing[:address],
      #   rooms: listing[:rooms],
      #   mrt_station: listing[:mrt_station]
      # })
    end
  end
end
