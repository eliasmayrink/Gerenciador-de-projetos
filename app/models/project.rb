class Project < ApplicationRecord

    has_many :activities, dependent: :destroy

    def expected_delay?
        activities.where('end_date > ?', end_date).any?
    end

    def finished_percentage
        return 0 unless activities.any?
        _finished_activities = activities.where(finished: true).size
        _percentage = _finished_activities.to_f / activities.size.to_f * 100
        _percentage.to_i
    end

end