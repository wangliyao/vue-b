json.data do
  json.array! @mac_vods do |vod|
    json.vod_id vod.vod_id
    json.vod_remarks vod.vod_remarks
    json.vod_area vod.vod_area
    json.vod_year vod.vod_year
    json.vod_name vod.vod_name
    json.vod_score vod.vod_score
    json.vod_pic vod.vod_pic
  end
end
json.pages do
  json.total_pages @mac_vods.total_pages
  json.next_page @mac_vods.next_page
  json.current_page @mac_vods.current_page
  json.total_count @mac_vods.count
  json.page_size 24
end