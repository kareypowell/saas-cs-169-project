class MoviesController < ApplicationController
	
	def index
		@movies = Movie.find(:all, order: 'title')
	end

	def show
		id = params[:id]
		@movie = Movie.find_by_id(id)
		if @movie
			render 'show'
		else
			flash[:warning] = "Sorry, no movie with id '#{id}' could be found."
			redirect_to root_path
		end
	end

	def new
		# default: render 'new' template
	end

	def create
		@movie = Movie.create!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movie_path(@movie)
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update_attributes!(params[:movie])
		respond_to do |client_wants|
			client_wants.html { redirect_to movie_path(@movie), notice: 
													"#{@movie.title} was successfully updated."  }
			client_wants.xml 	{ render xml: @movie.to_xml }
		end 
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end

end