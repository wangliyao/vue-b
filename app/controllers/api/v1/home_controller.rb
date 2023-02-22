class Api::V1::HomeController < ApplicationController
  def index
    # type_id_1 = MacVod.mac_type_hash.fetch(params[:type_name] || 'movie')
    @hot_rank_by_weeks = MacVod.select(:vod_name, :vod_id, :vod_time).order(vod_hits_week: :desc).limit(15)
    @vod_type_vod = MacVod.joins(:top_type_vod)
                          .select("mac_vod.vod_name, mac_vod.vod_pic, mac_vod.vod_id, mac_vod.vod_remarks, mac_vod.vod_score, mac_type.type_name as type_name")
                          .group_by{|t| t.type_name}
                          .transform_values{|v| v.take(8)}
  end

  def list
    type_id_1 = MacVod.mac_type_hash.fetch(params[:type_name] || 'movie')
    @list_rank_by_weeks = MacVod.select(:vod_name, :vod_id, :vod_time).order(vod_hits_week: :desc).where(type_id_1: type_id_1).limit(15)
    @list_vod_type_vods = MacVod.joins(:type_vod).where(type_id_1: type_id_1)
                           .select("mac_vod.vod_name, mac_vod.vod_pic, mac_vod.vod_id, mac_vod.vod_remarks, mac_vod.vod_score, mac_type.type_name as type_name")
                           .group_by{|t| t.type_name}.transform_values{|v| v.take(8)}
  end
end
