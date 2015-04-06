class Entry < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
end
