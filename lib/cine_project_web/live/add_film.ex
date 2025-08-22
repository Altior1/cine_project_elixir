defmodule CineProjectWeb.AddFilm do
  @moduledoc """
  Composant pour ajouter un film.
  """
  use CineProjectWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h2>Ajouter un film</h2>
      <form phx-submit="save">
        <div>
          <label>Titre</label>
          <input type="text" name="title" required />
        </div>
        <div>
          <label>Année</label>
          <input type="number" name="year" required />
        </div>
        <div>
          <label>Résumé</label>
          <textarea name="sinopsis" required></textarea>
        </div>
        <div>
          <label>Affiche</label>
          <input type="text" name="poster" required />
        </div>
        <button type="submit">Ajouter</button>
      </form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event(
        "save",
        %{"title" => title, "year" => year, "synopsis" => synopsis, "poster" => poster},
        socket
      ) do
    movie = %{
      "title" => title,
      "year" => year,
      "synopsis" => synopsis,
      "poster" => poster
    }

    case CineProject.Catalog.add_movie(movie) do
      {:ok, _movie} ->
        {:noreply,
         socket |> put_flash(:info, "Film ajouté avec succès") |> push_navigate(to: "/")}

      {:error, reason} ->
        {:noreply, socket |> put_flash(:error, reason)}
    end
  end
end
