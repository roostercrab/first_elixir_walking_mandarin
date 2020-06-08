defmodule WalkingMandarin.Repo.Migrations.CreateMandarinToEnglishWords do
  use Ecto.Migration

  def change do
    create table(:mandarin_to_english_words) do
      add :hanzi_standard, :string
      add :hanzi_traditional, :string
      add :pinyin, :string
      add :meaning, :text
      add :pronounciation_helper, :string
      add :mnemonic, :text
      add :part_of_speech, :string
      add :radical, :string
      add :initial, :string
      add :final, :string
      add :tone, :string
      add :etymology, :text
      add :image, :binary
      add :sound, :binary
      add :stroke_order_simplified, :binary
      add :stroke_order_traditional, :binary
      add :vote_value, :integer

      timestamps()
    end

  end
end
