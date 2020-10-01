class BagsController < ApplicationController

    def index
        @bags = Bag.all
    end

    def show
        @bag = Bag.find_by(id: params[:id])
    end

    def new
        @bag = Bag.new
    end

    def edit
        @bag = Bag.find_by(id: params[:id])
    end

    def create
        @bag = Bag.new(bag_params)
        @bag.user = @current_user
        @bag.save
        # byebug
        if @bag.save
            @cymbal = Cymbal.new
            redirect_to new_cymbal_path(@current_user)
        else
            render 'new'
        end
    end

    def update

    end

    def destroy
        #make sure belongs to user
        @bag = Bag.find_by(id: params[:id])
        @bag.destroy
        redirect_to user_path
    end

    private

    def bag_params
        params.require(:bag).permit(:name, :bag_id, :user_id, :cymbal_id, :id)
    end

end