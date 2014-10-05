class Page < ActiveRecord::Base

  # relationships
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
    
  #scopes
  scope :sorted, lambda { order("pages.position ASC") }    

end
