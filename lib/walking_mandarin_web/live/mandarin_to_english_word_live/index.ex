defmodule WalkingMandarinWeb.MandarinToEnglishWordLive.Index do
  use WalkingMandarinWeb, :live_view

  alias WalkingMandarin.Languages
  alias WalkingMandarin.Languages.MandarinToEnglishWord

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :mandarin_to_english_words, list_mandarin_to_english_words())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Mandarin to English Word")
    |> assign(:mandarin_to_english_word, Languages.get_mandarin_to_english_word!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Mandarin to English Word")
    |> assign(:mandarin_to_english_word, %MandarinToEnglishWord{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Mandarin to English Words")
    |> assign(:mandarin_to_english_word, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    mandarin_to_english_word = Languages.get_mandarin_to_english_word!(id)
    {:ok, _} = Languages.delete_mandarin_to_english_word(mandarin_to_english_word)

    {:noreply, assign(socket, :mandarin_to_english_words, list_mandarin_to_english_words())}
  end

  defp list_mandarin_to_english_words do
    Languages.list_mandarin_to_english_words()
  end
end
