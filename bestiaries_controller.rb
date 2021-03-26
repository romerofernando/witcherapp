class BestiariesController < ApplicationController
  
    def index
        bestiaries = Bestiary.all
        render json: bestiaries
    end
    def show
        bestiary = Bestiary.find(params[:id])
        render json: bestiary.as_json(include: :kills)
    end
    def create
        bestiary = Bestiary.create(bestiary_params)
        if bestiary.valid?
            render json: bestiary
        else
            render json: bestiary.errors
        end
    end
    def destroy
        bestiary = Bestiary.find(params[:id])
        if bestiary.destroy
            render json: bestiary
        else
            render json: bestiary.errors
        end
    end
    def update
        bestiary = Bestiary.find(params[:id])
        bestiary.update(bestiary_params)
        if bestiary.valid?
            render json: bestiary
        else
            render json: bestiary.errors
        end
    end

    private
    def bestiary_params
        params.require(:bestiary).permit(:name, :weakness, :location, :kingdom)
    end
end
 