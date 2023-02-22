class MacVod < ApplicationRecord
  self.table_name = 'mac_vod'
  belongs_to :top_type_vod, class_name: 'MacType', foreign_key: 'type_id_1'
  belongs_to :type_vod, class_name: 'MacType', foreign_key: 'type_id'
  include SmartFilterable

  def self.mac_type_hash
    MacType.top_type.pluck(:type_en, :type_id).to_h
  end

  def self.ransackable_attributes(auth_object = nil)
    ['vod_actor', 'vod_director','vod_name', "top_type_vod", "type_vod", "vod_area"]
  end

  def self.ransackable_associations(auth_object = nil)
  ["top_type_vod", "type_vod"]
  end
end