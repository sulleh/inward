class EntriesController < ApplicationController
  def new
  	@entry = Entry.new
  end


  def create
  	@entry = Entry.new(entry_params)
  		if @entry.save
  			flash.now[:success] = "Entry Saved!"
  			redirect_to entries_path
  		else
  			render 'new'
  		end
  end

  def show
    @entry = Entry.find(params[:id])
    @entry_analysis = WordsCounted.count(@entry.content, exclude:EXCLUDED_WORDS )
    @popular_word_hash = Hash[@entry_analysis.most_occurring_words.map { |key,value| [key, value]}]
    @happy_score = 0
    @entry_analysis.sorted_word_occurrences.each do | word, count | 
        if HAPPY_WORDS[word]
          @happy_score += HAPPY_WORDS[word] * count 
        end
    end
  end

  def index
  	@entry = Entry.new
    @entries = Entry.all
  end




  		private
  			def entry_params
  				params.require(:entry).permit(:content)
  			end


end
