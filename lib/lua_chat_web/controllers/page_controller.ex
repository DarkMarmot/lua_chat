defmodule LuaChatWeb.PageController do
  use LuaChatWeb, :controller

  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, LuaChatWeb.HomeView, session: %{})
  end

#  def index(conn, _params) do
#    render(conn, "index.html")
#  end
end
