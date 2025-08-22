defmodule CineProjectWeb.CineTracking.MovieList do
  @moduledoc """
  contient le module pour afficher la liste des films
  """
  use Phoenix.LiveView
  alias CineProjectWeb.ComponentFilms

  alias CineProject.Catalog

  def render(assigns) do
    ~H"""
    <h1>Movie List</h1>
    <a href="/add_film">Ajouter un film</a>
    <ul>
      <%= for movie <- @movies do %>
        <ComponentFilms.film_info movie={movie} />
      <% end %>
    </ul>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, movies} = Catalog.list_movies()
    {:ok, assign(socket, movies: movies)}
  end
end
