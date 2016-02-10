class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  has_and_belongs_to_many :favourites, class_name: :Recipe, join_table: :recipes_users
  has_and_belongs_to_many :cuisines
  validates :name, :city, presence: true
end
