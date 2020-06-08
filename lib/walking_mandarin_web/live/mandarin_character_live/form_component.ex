defmodule WalkingMandarinWeb.MandarinCharacterLive.FormComponent do
  use WalkingMandarinWeb, :live_component

  alias WalkingMandarin.Languages

  @impl true
  def update(%{mandarin_character: mandarin_character} = assigns, socket) do
    changeset = Languages.change_mandarin_character(mandarin_character)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"mandarin_character" => mandarin_character_params}, socket) do
    changeset =
      socket.assigns.mandarin_character
      |> Languages.change_mandarin_character(mandarin_character_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"mandarin_character" => mandarin_character_params}, socket) do
    save_mandarin_character(socket, socket.assigns.action, mandarin_character_params)
  end

  defp save_mandarin_character(socket, :edit, mandarin_character_params) do
    case Languages.update_mandarin_character(socket.assigns.mandarin_character, mandarin_character_params) do
      {:ok, _mandarin_character} ->
        {:noreply,
         socket
         |> put_flash(:info, "Mandarin character updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_mandarin_character(socket, :new, mandarin_character_params) do
    case Languages.create_mandarin_character(mandarin_character_params) do
      {:ok, _mandarin_character} ->
        {:noreply,
         socket
         |> put_flash(:info, "Mandarin character created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
