module SmartFilterable
  extend ActiveSupport::Concern

  class_methods do
    def smart_filter(params)
      (params || {}).to_h.inject(all) do |results, (key, val)|
        return all if val.nil?
        results.smart_filter_key_val(key, val)
      end
    end

    def smart_filter_key_val(key, val)
      key = key.to_s
      col = columns_hash[key]
      case col.type
      when :string
        all.smart_filter_string(key, val)
      when :datetime
        all.smart_filter_datetime(key, val)
      when :integer
        all.smart_filter_enum(key, val) if key.in? defined_enums
      else
        Rails.logger.warn "Filtering column does not exist or invalid: #{key}"
      end
    end

    def smart_filter_string(key, val)
      if val == "all"
        all
      else
        all.where("#{key} LIKE ?", "%#{val}%")
      end
    end

    def smart_filter_enum(key, val)
      if val == "all"
        all
      else
        all.where(key => defined_enums[key][val])
      end
    end

    def smart_filter_datetime(key, val)
      day = case val
            when 'today', 'yesterday', 'tomorrow'
              Date.public_send(val)
            else
              Date.parse(val)
            end
      all.where(key => day.beginning_of_day..day.end_of_day)
    end
  end
end
