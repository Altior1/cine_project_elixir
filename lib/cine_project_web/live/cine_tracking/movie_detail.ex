defmodule CineProjectWeb.CineTracking.MovieDetail do
  @moduledoc """
  vue simple des élements détaillé d'un film
  """
  use Phoenix.LiveView

  @impl true
  def render(assigns) do
    ~H"""
    <h1>{@movie["title"]}</h1>
    <p>Année: {@movie["year"]}</p>
    <p>Résumé: {@movie["synopsis"]}</p>
    <img src={@movie["poster"]} alt={@movie["poster"]} />
    """
  end

  @impl true
  def mount(%{"id" => movie_id}, _session, socket) do
    {:ok, assign(socket, movie: Catalog.get_movie!(movie_id))}
  end
end
