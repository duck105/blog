class Post < ApplicationRecord
	has_many :comments ,dependent: :destroy
	validates :title, presence: true;
	validates :body, presence: true;

	belongs_to :user, foreign_key: :user_id
	
	mount_uploader :image, PostImageUploader

	def editable_by?(cuser)
   	cuser && cuser == user
	end
end
