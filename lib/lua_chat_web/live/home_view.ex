defmodule LuaChatWeb.HomeView do
  use Phoenix.LiveView

  def render(assigns) do
    LuaChatWeb.PageView.render("home.html", assigns)
  end

  def handle_event("submit_code", value, socket) do
    IO.puts("moo")
    IO.inspect(value)
    {:noreply, assign(socket, lua_code: value, deploy_step: "Code...")}
  end

  def handle_event("apply_code", _value, socket) do
    IO.puts("code going in")
    {:noreply, assign(socket, deploy_step: "Load...")}
  end


  def handle_event("submit_cats", _value, socket) do
    {:noreply, assign(socket, deploy_step: "Cats deploy...")}
  end

  def handle_event("eat_cats", _value, socket) do
    {:noreply, assign(socket, deploy_step: "Cats are yummy...")}
  end

  def handle_event("submit_message", value, socket) do
    msg = get_in(value, ["message", "content"])
    {:noreply, update(socket, :messages, fn messages -> [msg | Enum.reverse(messages)] |> Enum.take(10) |> Enum.reverse() end)}
  end

  def mount(_session, socket) do
    {:ok, assign(socket, message: nil, deploy_step: "Ready!", lua_code: "moo", messages: ["dog", "bunny"])}
  end

end