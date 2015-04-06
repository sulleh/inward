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
  end

  def index
  	@entries = Entry.all
  end




  		private
  			def entry_params
  				params.require(:entry).permit(:content)
  			end


end
