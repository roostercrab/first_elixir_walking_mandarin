defmodule WalkingMandarinWeb.MandarinCharacterLive.Index do
  use WalkingMandarinWeb, :live_view

  alias WalkingMandarin.Languages
  alias WalkingMandarin.Languages.MandarinCharacter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :mandarin_characters, list_mandarin_characters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Mandarin character")
    |> assign(:mandarin_character, Languages.get_mandarin_character!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Mandarin character")
    |> assign(:mandarin_character, %MandarinCharacter{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Mandarin characters")
    |> assign(:mandarin_character, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    mandarin_character = Languages.get_mandarin_character!(id)
    {:ok, _} = Languages.delete_mandarin_character(mandarin_character)

    {:noreply, assign(socket, :mandarin_characters, list_mandarin_characters())}
  end

  defp list_mandarin_characters do
    Languages.list_mandarin_characters()
  end
end
