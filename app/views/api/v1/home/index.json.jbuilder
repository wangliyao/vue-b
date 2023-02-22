json.hot_rank_by_week @hot_rank_by_weeks do |h|
  json.vod_id h.vod_id
  json.vod_name h.vod_name
  json.vod_time h.vod_time
end
json.vod_type_vod @vod_type_vod.each do |key, value|
  json.title key
  json.data value do |v|
    json.type_name v.type_name
    json.vod_id v.vod_id
    json.vod_name v.vod_name
    json.vod_pic v.vod_pic
    json.vod_remarks v.vod_remarks
    json.vod_score v.vod_score
    # json.vod_play_from v&.vod_play_from
  end
end

