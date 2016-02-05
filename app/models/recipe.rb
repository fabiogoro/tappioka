class Recipe < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :type
  belongs_to :preference
end
