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
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
			flash[:notice] = "#{@movie.title} was successfully created."
			redirect_to movie_path(@movie)
		else
			render 'new'
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update_attributes(params[:movie])
			respond_to do |client_wants|
				client_wants.html { redirect_to movie_path(@movie), notice: 
														"#{@movie.title} was successfully updated."  }
				client_wants.xml 	{ render xml: @movie.to_xml }
			end
		else
			render 'edit'
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end

	def movies_with_filters
		@movies = Movie.with_good_reviews(params[:threshold])
		%w(for_kids with_many_fans recently_reviewed).each do |filter|
			@movies = @movies.send(filter) if params[:filter]
		end
	end

end