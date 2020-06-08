defmodule WalkingMandarinWeb.MandarinToEnglishWordLive.Show do
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
     |> assign(:mandarin_to_english_word, Languages.get_mandarin_to_english_word!(id))}
  end

  defp page_title(:show), do: "Show Mandarin to English Word"
  defp page_title(:edit), do: "Edit Mandarin to English Word"
end
