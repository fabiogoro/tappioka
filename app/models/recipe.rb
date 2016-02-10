class Recipe < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :cuisine
  belongs_to :type
  belongs_to :preference
  belongs_to :user
  has_and_belongs_to_many :fans, class_name: :User, join_table: :recipes_users
  validates :name, presence: true

  def self.order_by_favourites(order = nil)
    if order == :asc
      self.all.sort_by{|recipe| recipe.fans.size}
    else
      self.all.sort_by{|recipe| -recipe.fans.size}
    end
  end
end
