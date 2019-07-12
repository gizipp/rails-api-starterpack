class PrayersController < ApplicationController
  before_action :set_prayer, only: [:show, :update, :destroy]

  # GET /prayers
  def index
    @prayers = current_user.prayers
    json_response(@prayers)
  end

  # POST /prayers
  def create
    @prayer = current_user.prayers.create!(prayer_params)
    json_response(@prayer, :created)
  end

  # GET /prayers/:id
  def show
    json_response(@prayer)
  end

  # PUT /prayers/:id
  def update
    @prayer.update(prayer_params)
    head :no_content
  end

  # DELETE /prayers/:id
  def destroy
    @prayer.destroy
    head :no_content
  end

  private

  def prayer_params
    # whitelist params
    params.permit(:title)
  end

  def set_prayer
    @prayer = Prayer.find(params[:id])
  end
end
