defmodule WalkingMandarin.LanguagesTest do
  use WalkingMandarin.DataCase

  alias WalkingMandarin.Languages

  describe "mandarin_to_english_words" do
    alias WalkingMandarin.Languages.MandarinToEnglishWord

    @valid_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", vote_value: 42}
    @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", vote_value: 43}
    @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, vote_value: nil}

    def mandarin_to_english_word_fixture(attrs \\ %{}) do
      {:ok, mandarin_to_english_word} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Languages.create_mandarin_to_english_word()

      mandarin_to_english_word
    end

    test "list_mandarin_to_english_words/0 returns all mandarin_to_english_words" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert Languages.list_mandarin_to_english_words() == [mandarin_to_english_word]
    end

    test "get_mandarin_to_english_word!/1 returns the mandarin_to_english_word with given id" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert Languages.get_mandarin_to_english_word!(mandarin_to_english_word.id) == mandarin_to_english_word
    end

    test "create_mandarin_to_english_word/1 with valid data creates a mandarin_to_english_word" do
      assert {:ok, %MandarinToEnglishWord{} = mandarin_to_english_word} = Languages.create_mandarin_to_english_word(@valid_attrs)
      assert mandarin_to_english_word.etymology == "some etymology"
      assert mandarin_to_english_word.final == "some final"
      assert mandarin_to_english_word.hanzi_standard == "some hanzi_standard"
      assert mandarin_to_english_word.hanzi_traditional == "some hanzi_traditional"
      assert mandarin_to_english_word.image == "some image"
      assert mandarin_to_english_word.initial == "some initial"
      assert mandarin_to_english_word.meaning == "some meaning"
      assert mandarin_to_english_word.mnemonic == "some mnemonic"
      assert mandarin_to_english_word.part_of_speech == "some part_of_speech"
      assert mandarin_to_english_word.pinyin == "some pinyin"
      assert mandarin_to_english_word.pronounciation_helper == "some pronounciation_helper"
      assert mandarin_to_english_word.radical == "some radical"
      assert mandarin_to_english_word.sound == "some sound"
      assert mandarin_to_english_word.stroke_order_simplified == "some stroke_order_simplified"
      assert mandarin_to_english_word.stroke_order_traditional == "some stroke_order_traditional"
      assert mandarin_to_english_word.tone == "some tone"
      assert mandarin_to_english_word.vote_value == 42
    end

    test "create_mandarin_to_english_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_mandarin_to_english_word(@invalid_attrs)
    end

    test "update_mandarin_to_english_word/2 with valid data updates the mandarin_to_english_word" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert {:ok, %MandarinToEnglishWord{} = mandarin_to_english_word} = Languages.update_mandarin_to_english_word(mandarin_to_english_word, @update_attrs)
      assert mandarin_to_english_word.etymology == "some updated etymology"
      assert mandarin_to_english_word.final == "some updated final"
      assert mandarin_to_english_word.hanzi_standard == "some updated hanzi_standard"
      assert mandarin_to_english_word.hanzi_traditional == "some updated hanzi_traditional"
      assert mandarin_to_english_word.image == "some updated image"
      assert mandarin_to_english_word.initial == "some updated initial"
      assert mandarin_to_english_word.meaning == "some updated meaning"
      assert mandarin_to_english_word.mnemonic == "some updated mnemonic"
      assert mandarin_to_english_word.part_of_speech == "some updated part_of_speech"
      assert mandarin_to_english_word.pinyin == "some updated pinyin"
      assert mandarin_to_english_word.pronounciation_helper == "some updated pronounciation_helper"
      assert mandarin_to_english_word.radical == "some updated radical"
      assert mandarin_to_english_word.sound == "some updated sound"
      assert mandarin_to_english_word.stroke_order_simplified == "some updated stroke_order_simplified"
      assert mandarin_to_english_word.stroke_order_traditional == "some updated stroke_order_traditional"
      assert mandarin_to_english_word.tone == "some updated tone"
      assert mandarin_to_english_word.vote_value == 43
    end

    test "update_mandarin_to_english_word/2 with invalid data returns error changeset" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_mandarin_to_english_word(mandarin_to_english_word, @invalid_attrs)
      assert mandarin_to_english_word == Languages.get_mandarin_to_english_word!(mandarin_to_english_word.id)
    end

    test "delete_mandarin_to_english_word/1 deletes the mandarin_to_english_word" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert {:ok, %MandarinToEnglishWord{}} = Languages.delete_mandarin_to_english_word(mandarin_to_english_word)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_mandarin_to_english_word!(mandarin_to_english_word.id) end
    end

    test "change_mandarin_to_english_word/1 returns a mandarin_to_english_word changeset" do
      mandarin_to_english_word = mandarin_to_english_word_fixture()
      assert %Ecto.Changeset{} = Languages.change_mandarin_to_english_word(mandarin_to_english_word)
    end
  end
end
