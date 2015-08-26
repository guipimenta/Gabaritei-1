# == Schema Information
#
# Table name: fields
#
#  id          :integer          not null, primary key
#  subject_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)
#  description :text
#
# Indexes
#
#  index_fields_on_subject_id  (subject_id)
#

class Field < ActiveRecord::Base

	belongs_to :subject
	has_many :contents, as: :category
	has_many :courses, as: :category
	has_many :question_categories, as: :category
	has_many :questions, through: :question_categories
	has_many :user_deficit_categories, as: :category
	
end
