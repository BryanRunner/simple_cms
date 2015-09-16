class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits
end
#subject = Subject.create(:name=> "Second Subject", :position => 2)
#subject.update_attributes(:name => "Next Subject", :visible => true)
