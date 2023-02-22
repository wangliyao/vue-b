class Api::V1::MacVodsController < ApplicationController
  def show
    @macvod = MacVod.find(params[:id])
  end

  def recommend
    @macvod = MacVod.find(params[:id])
    @macvods = MacVod.where(type_id_1: @macvod.type_id_1).order("RAND()").limit(12)
  end
end
