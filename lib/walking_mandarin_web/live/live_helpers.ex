defmodule WalkingMandarinWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `WalkingMandarinWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, WalkingMandarinWeb.MandarinToEnglishWordLive.FormComponent,
        id: @mandarin_to_english_word.id || :new,
        action: @live_action,
        mandarin_to_english_word: @mandarin_to_english_word,
        return_to: Routes.mandarin_to_english_word_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, WalkingMandarinWeb.ModalComponent, modal_opts)
  end
end
