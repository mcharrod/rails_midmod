class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:name])
    movie_actor = MovieActor.create!(movie: movie, actor: actor)

    redirect_to("/movies/#{movie.id}")
  end
end
