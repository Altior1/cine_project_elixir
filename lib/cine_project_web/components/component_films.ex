defmodule CineProjectWeb.ComponentFilms do
  @moduledoc """
  Composant pour afficher les informations d'un film.
  """

  use Phoenix.Component

  attr :movie, :map, required: true

  def film_info(assigns) do
    ~H"""
    <div class="film-info">
      <h2>{@movie["title"]}</h2>
      <p>Année : {@movie["year"]}</p>
      <p>Résumé : {@movie["sinopsis"]}</p>
    </div>
    """
  end
end
