class Review < ApplicationRecord
  belongs_to :product

  belongs_to :user
   belongs_to :course

  validates :rating, presence:true
  validates :comment, presence: true

  def review_status
     def rating - 5
      case diff
    when 0
      "Excellent"
    when -1, -2
      "Good"
    else
      "Better"
    end
  end
end

