defmodule WalkingMandarinWeb.MandarinToEnglishWordLive.FormComponent do
  use WalkingMandarinWeb, :live_component

  alias WalkingMandarin.Languages

  @impl true
  def update(%{mandarin_to_english_word: mandarin_to_english_word} = assigns, socket) do
    changeset = Languages.change_mandarin_to_english_word(mandarin_to_english_word)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"mandarin_to_english_word" => mandarin_to_english_word_params}, socket) do
    changeset =
      socket.assigns.mandarin_to_english_word
      |> Languages.change_mandarin_to_english_word(mandarin_to_english_word_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"mandarin_to_english_word" => mandarin_to_english_word_params}, socket) do
    save_mandarin_to_english_word(socket, socket.assigns.action, mandarin_to_english_word_params)
  end

  defp save_mandarin_to_english_word(socket, :edit, mandarin_to_english_word_params) do
    case Languages.update_mandarin_to_english_word(socket.assigns.mandarin_to_english_word, mandarin_to_english_word_params) do
      {:ok, _mandarin_to_english_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Mandarin to English Word updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_mandarin_to_english_word(socket, :new, mandarin_to_english_word_params) do
    case Languages.create_mandarin_to_english_word(mandarin_to_english_word_params) do
      {:ok, _mandarin_to_english_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Mandarin to English Word created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
