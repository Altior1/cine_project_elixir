defmodule CineProjectWeb.PageController do
  use CineProjectWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
