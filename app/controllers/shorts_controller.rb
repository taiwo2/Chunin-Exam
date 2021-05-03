class ShortsController < ApplicationController
 before_action :set_short, only: [:show]

 
  def show
  end

  def new
    @short = Short.new
  end

  def create
    @short = Short.new(short_params)
    respond_to do |format|
      if @short.save
        format.html { redirect_to root_path, notice: 'Short was successfully created.' }
        format.json { render :new, status: :created, location: @short }
      else
        format.html { render :new }
        format.json { render json: @short.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  
    def set_short
      @short = Short.find(params[:id])
    end

    def short_params
      params.require(:short).permit(:url)
    end

end
