defmodule WalkingMandarin.Languages.MandarinCharacter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mandarin_characters" do
    field :etymology, :string
    field :final, :string
    field :hanzi_standard, :string
    field :hanzi_traditional, :string
    field :image, :binary
    field :initial, :string
    field :meaning, :string
    field :mnemonic, :string
    field :part_of_speech, :string
    field :pinyin, :string
    field :pronounciation_helper, :string
    field :radical, :string
    field :sound, :binary
    field :stroke_order_simplified, :binary
    field :stroke_order_traditional, :binary
    field :tone, :string
    field :translated_to, :string
    field :vote_value, :integer

    timestamps()
  end

  @doc false
  def changeset(mandarin_character, attrs) do
    mandarin_character
    |> cast(attrs, [:hanzi_standard, :hanzi_traditional, :pinyin, :meaning, :pronounciation_helper, :mnemonic, :part_of_speech, :radical, :initial, :final, :tone, :etymology, :image, :sound, :stroke_order_simplified, :stroke_order_traditional, :translated_to, :vote_value])
    |> validate_required([:hanzi_standard])
  end
end
