defmodule CineProject.Catalog do
  @moduledoc """
  contient les fonctions pour interrogé le back
  """

  @doc """
  interroge le back pour obtenir la liste des films du back
  """
  def list_movies do
    case HTTPoison.get("http://localhost:3000/movies") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      _ ->
        {:error, "back can't be reached"}
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
