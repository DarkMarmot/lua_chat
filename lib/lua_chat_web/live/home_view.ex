defmodule LuaChatWeb.HomeView do
  use Phoenix.LiveView

  def render(assigns) do
    LuaChatWeb.PageView.render("home.html", assigns)
  end

  def handle_event("submit_code", value, socket) do
#    IO.puts("moo")
#    IO.inspect(value)

    code_content = Map.get(value, "code_content")
    Warzone.BattleServer.submit_code(code_content)
    IO.inspect("got stuff: #{inspect(value)}")
    {:noreply, assign(socket, code_content: code_content, deploy_step: "Code...")}
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
    IO.inspect("message was: #{inspect(value)}")
    msg = get_in(value, ["message", "content"])
    {:noreply, update(socket, :messages, fn messages -> [msg | Enum.reverse(messages)] |> Enum.take(10) |> Enum.reverse() end)}
  end

  def handle_info({:ship_status, ship}, socket) do
    v = inspect(ship.velocity)
    status = inspect(ship.ai_error)
    {:noreply, assign(socket, ship_status: v, code_status: status)}
  end
  def mount(_session, socket) do

    if connected?(socket), do: Warzone.BattleServer.join()

#    data = %{code_content: "hello", code_error: "cat man"}
#    types = %{code_content: :string, code_error: :string}
#    cs = Ecto.Changeset.cast({data, types}, %{code_content: "world", code_error: "hello"}, [:code_content, :code_error])

    {:ok, assign(socket, yum: "", code_content: "", ship_status: "", code_status: "", message: nil, deploy_step: "Ready!", messages: ["dog", "bunny"])}
  end

end