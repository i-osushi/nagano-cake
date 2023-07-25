class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # created_at の値を 降順 で並び替えてくれる
  scope :latest, -> { order(created_at: :desc) }
  
  
end
