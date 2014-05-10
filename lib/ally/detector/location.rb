require 'ally/detector'
require 'ally/detector/location/version'

module Ally
  module Detector
    class Location
      include Ally::Detector

      def detect
        # look for zipcode first
        location = Ally::Detector::Zipcode.new(@inquiry).detect
        if location.nil?
          # if the inquiry has 'at' or 'in', detect place
          if @inquiry.words.include?('at') || @inquiry.words.include?('in')
            # didn't find zip, look for place
            # delete common words (to not confuse place detection)
            @inquiry.delete_words(%w[
              the be to of and a that have i it for not on with he as you do
            ])
            if @inquiry.words.length > 0
              @inquiry.raw = @inquiry.words.join(' ')
              places = Ally::Detector::Place.new(@inquiry).detect
              unless places.nil?
                place = places.first
                location = "#{place['geometry']['location']['lat']},#{place['geometry']['location']['lng']}"
              end
            end
          end
        end
        @data_detected = true unless location.nil?
        @location = location
      end
    
    end
  end
end
