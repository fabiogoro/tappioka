class Recipe < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :cuisine
  belongs_to :type
  belongs_to :preference
end
