class Interview < ApplicationRecord
  belongs_to :user
  enum judgement: { pend: 0, approval: 1, rejection: 2 }
  validates :interview_datetime, uniqueness: { scope: :user_id}
end
