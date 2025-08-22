defmodule CineProjectWeb.CineTracking.MovieList do
  @moduledoc """
  contient le module pour afficher la liste des films
  """
  use Phoenix.LiveView
  alias CineProjectWeb.ComponentFilms

  alias CineProject.Catalog

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Movie List</h1>
    <a href="/add_film">Ajouter un film</a>
    <ul>
      <%= for movie <- @movies do %>
        <% IO.inspect(movie) %>
        <a href={"/movie/#{movie["id"]}"}>
          <li>
            <ComponentFilms.film_info movie={movie} />
          </li>
        </a>
      <% end %>
    </ul>
    <div>
      <button phx-click="precedent">Précédent</button>
      <button phx-click="suivant">Suivant</button>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, movies} = Catalog.list_movies(1, 10)
    {:ok, assign(socket, movies: movies)}
  end

  @impl true
  def handle_params(_params, _uri, socket) do
    {:noreply, socket |> assign(:page, 1)}
  end

  @impl true
  @spec handle_event(<<_::56, _::_*16>>, any(), any()) :: {:noreply, map()}
  def handle_event("suivant", _unsigned_params, socket) do
    {:ok, movies} = Catalog.list_movies(socket.assigns.page + 1, 10)
    {:noreply, assign(socket, movies: movies) |> assign(:page, socket.assigns.page + 1)}
  end

  def handle_event("precedent", _unsigned_params, socket) do
    {:ok, movies} = Catalog.list_movies(socket.assigns.page - 1, 10)
    {:noreply, assign(socket, movies: movies) |> assign(:page, socket.assigns.page - 1)}
  end
end
