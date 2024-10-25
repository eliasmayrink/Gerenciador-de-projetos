class Project < ApplicationRecord

    has_many :activities, dependent: :destroy

    validates :name, :start_date, :end_date, presence: {message: "não pode estar em branco"}
    validates :end_date, comparison: { greater_than_or_equal_to: :start_date, message: "deve ser maior que a data de início" }

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