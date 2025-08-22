defmodule CineProject.Catalog do
  @moduledoc """
  contient les fonctions pour interrogé le back
  """

  @doc """
  interroge le back pour obtenir la liste des films du back
  """
  def list_movies(page, per_page) do
    case HTTPoison.get("http://localhost:3000/movies?_page=#{page}&_per_page=#{per_page}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = Jason.decode!(body)
        data = body["data"]
        {:ok, data}

      _ ->
        {:error, "back can't be reached"}
    end
  end

  def get_movie!(id) do
    case HTTPoison.get("http://localhost:3000/movies/#{id}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode!(body)

      _ ->
        %{}
    end
  end

  @doc """
  interroge le back pour ajouter un film
  """
  def add_movie(movie) do
    case HTTPoison.post("http://localhost:3000/movies", Jason.encode!(movie), [
           {"Content-Type", "application/json"}
         ]) do
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
        {:ok, Jason.decode!(body)}

      _ ->
        {:error, "back can't be reached"}
    end
  end
end
