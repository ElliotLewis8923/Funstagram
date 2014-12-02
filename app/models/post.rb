class Post < ActiveRecord::Base

	has_many :likes
	has_many :comments
	belongs_to :user

	has_attached_file :image, :storage => :s3,
                      :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                      :styles => { :medium => "500x500#", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :image

	def s3_credentials
		{:bucket => Rails.application.bucket, :access_key_id => Rails.application.access_key_id, :secret_access_key => Rails.application.secret_access_key}
	end

end
