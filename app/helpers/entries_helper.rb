module EntriesHelper
	def highlight_words(text)
		text.gsub(/\b(#{HAPPY_WORDS.keys.join("|")})\b/i, '<span class="happy-word">\1</span>').html_safe 
	end
end
