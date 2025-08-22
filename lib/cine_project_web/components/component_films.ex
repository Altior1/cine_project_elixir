defmodule CineProjectWeb.ComponentFilms do
  @moduledoc """
  Composant pour afficher les informations d'un film.
  """

  use Phoenix.Component

  attr :movie, :map, required: true

  def film_info(assigns) do
    ~H"""
    <div class="film-info border p-4 mb-4 rounded-lg shadow-lg bg-white">
      <h2>{@movie["title"]}</h2>
      <p>Année : {@movie["year"]}</p>
      <p>Résumé : {@movie["sinopsis"]}</p>
      <img
        src={@movie["poster"]}
        alt={"Affiche de #{@movie["title"]}"}
        class="w-32 h-auto mt-2 rounded"
      />
    </div>
    """
  end
end
