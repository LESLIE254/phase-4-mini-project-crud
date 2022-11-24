class SpicesController < ApplicationController
    #GET /spice
    def index
        spices = Spice.all 
        render json: spices, status: :ok 
    end

    #GET /spice/:id
    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     render json: spice
    # end
    #POST /spice
    def create
        spice =Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spice/:id
    def update
        spice = Spice.find_by(id: params[:id]) 
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    #DELETE /spice/:id
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description,:notes, :rating)
    end
end
