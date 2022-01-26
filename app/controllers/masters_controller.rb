class MastersController < ApplicationController

    def index
        render json: Master.all
    end

    def show
        master = find_master
        render json: master
    end
    
    def update
        status = find_status
        status.update(status_params)
        render json: status
    end

    private
    
    def status_params
        params.permit(:health, :wealth, :energy)
    end
    
    def record_not_found
        render json: {error: "Master not found"}, status: 404
    end

    def find_master
        Master.find(params[:id])
    end
end
