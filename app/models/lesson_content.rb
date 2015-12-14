# This is an auxiliary model of a join table between {Lesson} and {Content}. It establishes the "many-to-many" relationship between these models.
# @see Lesson#contents
# @see Content#lessons
#
# == Schema Information
#
# Table name: lesson_contents
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  content_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lesson_contents_on_content_id  (content_id)
#  index_lesson_contents_on_lesson_id   (lesson_id)
#

class LessonContent < ActiveRecord::Base

	belongs_to :lesson
	belongs_to :content

end
