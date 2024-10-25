class Activity < ApplicationRecord

    belongs_to :project

    validates :name, :start_date, :end_date, presence: {message: "não pode estar em branco"}
    validates :end_date, comparison: { greater_than_or_equal_to: :start_date, message: "deve ser maior que a data de início" }
    validates :start_date, comparison: { greater_than_or_equal_to: Proc.new { |a| a.project.start_date }, message: "deve ser maior que a data de início do projeto" }

end