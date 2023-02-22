class Api::V1::CategoriesController < ApplicationController
  def index
    @mac_type = MacType.top_type.find_by(type_en: params[:typename] || 'movie')
  end

  def list
    type_id_1 = MacVod.mac_type_hash.fetch(params[:typename] || 'movie')
    @mac_vods = if params[:order_by] == 'score'
      MacVod.order(vod_score: :desc)
    elsif params[:order_by] == 'hot'
      MacVod.order(vod_hits: :desc)
    else
      MacVod.order(vod_time: :asc)
    end
    @mac_vods = @mac_vods.where(type_id_1: type_id_1).smart_filter(params.permit(:vod_class, :vod_area, :vod_year)).paginate(page: params[:page] || 1, per_page: 24)
  end

  def search
    @mac_vods =  MacVod.ransack(vod_actor_or_vod_director_or_vod_name_or_vod_area_cont:params[:q]).result(distinct: true).paginate(page: params[:page] || 1, per_page: 24)
    render :list
  end
end
