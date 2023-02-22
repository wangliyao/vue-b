json.data do
  json.array! @macvods do |vod|
    json.vod_id vod.vod_id
    json.vod_remarks vod.vod_remarks
    json.vod_area vod.vod_area
    json.vod_year vod.vod_year
    json.vod_name vod.vod_name
    json.vod_score vod.vod_score
    json.vod_pic vod.vod_pic
  end
end