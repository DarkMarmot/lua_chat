defmodule LuaChatWeb.HomeView do
  use Phoenix.LiveView

  def render(assigns) do
    LuaChatWeb.PageView.render("home.html", assigns)
  end

  def handle_event("submit_cats", _value, socket) do
    {:noreply, assign(socket, deploy_step: "Cats deploy...")}
  end

  def handle_event("eat_cats", _value, socket) do
    {:noreply, assign(socket, deploy_step: "Cats are yummy...")}
  end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Ready!")}
  end
end