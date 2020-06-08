defmodule WalkingMandarinWeb.MandarinCharacterLive.Show do
  use WalkingMandarinWeb, :live_view

  alias WalkingMandarin.Languages

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:mandarin_character, Languages.get_mandarin_character!(id))}
  end

  defp page_title(:show), do: "Show Mandarin character"
  defp page_title(:edit), do: "Edit Mandarin character"
end
