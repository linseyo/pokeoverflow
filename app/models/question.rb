class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :voteable

  def points
    votes.length
  end
end
