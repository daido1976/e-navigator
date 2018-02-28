class Interview < ApplicationRecord
  belongs_to :user
  enum judgement: { pend: 0, approval: 1, rejection: 2 }
  validates :interview_datetime, uniqueness: { scope: :user_id}
  after_update :judgement_others, if: :judgement_changed?

  def judgement_others
    self.user.interviews.where.not(id: self.id).update_all(judgement: "rejection")
  end
end
