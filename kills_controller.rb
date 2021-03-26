class KillsController < ApplicationController
  
    def index
        kills = Kill.where(date: params[:start_date]..params[:end_date])
        render json: kills
    end
    def show
        kill = Kill.find(params[:id])
        render json: kill
    end
    def create
        kill = Kill.create(kill_params)
        if kill.valid?
            render json: kill
        else
            render json: kill.errors
        end
    end
    def destroy
        kill = Kill.find(params[:id])
        if kill.destroy
            render json: kill
        else
            render json: kill.errors
        end
    end
    def update
        kill = Kill.find(params[:id])
        kill.update(kill_params)
        if kill.valid?
            render json: kill
        else
            render json: kill.errors
        end
    end

    private
    def kill_params
        params.require(:kill).permit(:date, :latitude, :longitude, :start_date, :end_date)
    end
end

