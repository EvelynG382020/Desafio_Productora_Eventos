class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[ show edit update destroy ]

  # GET /concerts 
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1 
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
    @groups = Group.all
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts 
  def create
    @concert = Concert.new(concert_params)
    @groups = Group.all

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: "Concert was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1 
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: "Concert was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1 
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:public, :duration, :concert_date, :group_id)
    end
end
