class Api::V1::FetchesController < ApplicationController

    def get_places
        query = params['query']
        api_key = 'AIzaSyDMCCVA29GlHrumgPFFfKZ55fw-Z-PSFqE'
        austin_coordinates = '30.2671921,-97.743236'
        radius = '1500'

        rough_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{austin_coordinates}&radius=#{radius}&keyword=#{query}&key=#{api_key}"

        escaped_url = URI.escape(rough_url)

        response = RestClient.get(escaped_url)

        render json: response
    end

    def get_user_places
        userPlace = params['userPlace']['place_ref']
        api_key = 'AIzaSyDMCCVA29GlHrumgPFFfKZ55fw-Z-PSFqE'

        rough_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{userPlace}&key=#{api_key}"

        escaped_url = URI.escape(rough_url)

        response = RestClient.get(escaped_url)

        render json: response
    end
end