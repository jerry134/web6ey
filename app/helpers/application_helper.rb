#encoding:utf-8
module ApplicationHelper

	def render_status question
		if question.answers.blank?
			raw (link_to question.owner_username)+"于#{(Time.now-question.created_at.localtime).to_i/60}分钟前发布"
		else
			raw (link_to question.answers.last.owner_username)+"于#{(Time.now-question.answers.last.created_at.localtime).to_i/60}分钟前回复"
		end
	end
end
