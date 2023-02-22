class MacType < ApplicationRecord
  self.table_name = 'mac_type'
  scope :top_type, -> { where(type_pid: 0)}

  def children
    MacType.where(type_pid: id)
  end

  def vods
    MacVod.where(vod_class: type_name)
  end
end