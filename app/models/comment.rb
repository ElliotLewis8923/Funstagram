class Comment < ActiveRecord::Base

	belongs_to :post
	belongs_to :user

	validates :text, presence: true
	validates :text, length: { maximum: 200,
    too_long: "Your comment must contain at most %{count} characters" }

  def username
  	user.username
  end
end
