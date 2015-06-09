class Project < ActiveRecord::Base
  scope :filter_title_or_description, ->(word) { where('title like ? or description like ?', "%#{word}%", "%#{word}%") }
end
