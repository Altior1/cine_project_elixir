defmodule CineProjectWeb.CineTracking.MovieList do
  @moduledoc """
  contient le module pour afficher la liste des films
  """
  use Phoenix.LiveView

  alias CineProject.Catalog

  def render(assigns) do
    ~H"""
    <h1>Movie List</h1>
    <ul>
      <%= for movie <- @movies do %>
        <li>{movie.title} ({movie.year})</li>
      <% end %>
    </ul>
    """
  end

  def mount(_params, _session, socket) do
    movies = Catalog.list_movies()
    {:ok, assign(socket, movies: movies)}
  end
end
