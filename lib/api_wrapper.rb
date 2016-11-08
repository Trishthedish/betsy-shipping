require 'httparty'
require 'awesome_print'

class Api_Wrapper
  # would we need to change how we calls these constants?
  BASE_URL = "https://trish-petsy.herokuapp.com/"
  GITHUB_KEY = ENV["GITHUB_KEY"]
  GITHUB_SECRET = ENV["GITHUB_SECRET"]

  def self.method(search_term)
    url = BASE_URL + "verb" + "?q=#{search_term} + &app_id=#{GITHUB_KEY}&app_key=#{GITHUB_SECRET}"
    # we should change data ...
    data = HTTParty.get(url)
    # empty_array = better name needed...
    empty_array = []
    # "ship_formation"? better name needed...
    # like origin, destination, weight city stae. etc..
    # ship_formation will be the key that holds all the info I seek?
    data["ship_formations"].each do |formation|
      #shorten what we call for each specific key.
      info = formation["info"]

      empty_array << build_shipment(info)
    end
    empty_array
  end

  # no idea if this is proper language.
  def self.get_price(package)
    url = BASE_URL + "search" + "?r=#{??}"
                                        #do I need first?
    package = HTTParty.get(url).parsed_response.first
    build_shipment(package)
  end

  private

  def self.build_shipment(shipment)
    # will this be some sort of loop to go through the things that will be in destination: city, state, zip, country:
    # destination = Location.new(
    #   :country => 'US',
    #   :state => 'AZ',
    #   :city => 'Phoenix',
    #   :zip => '85020'
    destination = shipment["destination"]

    # I believe this will be a default weight, tht we create in API.
    #   Package.new(
    #   (7.5 * 16),          # 7.5 lbs, times 16 oz/lb.
    #   [15, 10, 4.5],       # 15x10x4.5 inches DIMENSIONS fixed
    #   :units => :imperial) # US style.
    # ]
    weight = shipment["weight"]

    # should this be a loop to get: city, state, zip, country.
    # in this case for now. We will be shipping from Seattle
    # so it will be Seattle, WA,
    # origin = Location.new(
    # :country => 'US',
    # :state => 'WA',
    # :city => 'Seattle',
    # :zip => '98161'
    origin = shipment["origin"]

    shipment.new(destination, weight, origin)


  end


end
