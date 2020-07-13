class Api::V1::PlacesController < ApplicationController

def index
    places = Place.all
    render json: places
end

def show
    place = Place.find_by(id: params[:id])
    render json: place
end

def new
    place = Place.new
end

def create
    place = Place.create(place_params)
    current_user.places << place
    render json: place
end

def edit
    place = Place.find(params[:id])
end

def update
    places = Place.all
    savePlace = ''

    for place in places do
        if place.place_ref === params[:place][:place_ref]
            binding.pry
            savePlace = place
            place.favorited = params[:favorite]
            break;
        end
    end
    


    savePlace.update(place_params)
    if savePlace.save
        render json: savePlace
    else
        render :new
    end
end

def destroy
    places = Place.all

    for place in places do
        if place.place_ref === params[:place][:place_ref]
            place.destroy()
            break;
        end
    end
end


private
def place_params
    params.require(:place).permit(:place_ref, :favorited)
end

end