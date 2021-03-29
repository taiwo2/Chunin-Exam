class WebLink
  module Statistics
    def browser_properties
      joined_visits.group(:browser).count
    end

    def device_properties
      joined_visits.group(:device_type).count
    end

    def created_at_properties
      joined_visits.group_by_day(:started_at).count
    end

    def visit_count
      Ahoy::Event.where(properties: { title: uid }).count
    end

    private

    def joined_visits
      Ahoy::Visit.joins(:events).where(events: { properties: { title: uid } })
    end
  end
end
