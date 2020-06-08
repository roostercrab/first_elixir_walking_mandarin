defmodule WalkingMandarin.LanguagesTest do
  use WalkingMandarin.DataCase

  alias WalkingMandarin.Languages

  describe "mandarin_characters" do
    alias WalkingMandarin.Languages.MandarinCharacter

    @valid_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", translated_to: "some translated_to", vote_value: 42}
    @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", translated_to: "some updated translated_to", vote_value: 43}
    @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, translated_to: nil, vote_value: nil}

    def mandarin_character_fixture(attrs \\ %{}) do
      {:ok, mandarin_character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Languages.create_mandarin_character()

      mandarin_character
    end

    test "list_mandarin_characters/0 returns all mandarin_characters" do
      mandarin_character = mandarin_character_fixture()
      assert Languages.list_mandarin_characters() == [mandarin_character]
    end

    test "get_mandarin_character!/1 returns the mandarin_character with given id" do
      mandarin_character = mandarin_character_fixture()
      assert Languages.get_mandarin_character!(mandarin_character.id) == mandarin_character
    end

    test "create_mandarin_character/1 with valid data creates a mandarin_character" do
      assert {:ok, %MandarinCharacter{} = mandarin_character} = Languages.create_mandarin_character(@valid_attrs)
      assert mandarin_character.etymology == "some etymology"
      assert mandarin_character.final == "some final"
      assert mandarin_character.hanzi_standard == "some hanzi_standard"
      assert mandarin_character.hanzi_traditional == "some hanzi_traditional"
      assert mandarin_character.image == "some image"
      assert mandarin_character.initial == "some initial"
      assert mandarin_character.meaning == "some meaning"
      assert mandarin_character.mnemonic == "some mnemonic"
      assert mandarin_character.part_of_speech == "some part_of_speech"
      assert mandarin_character.pinyin == "some pinyin"
      assert mandarin_character.pronounciation_helper == "some pronounciation_helper"
      assert mandarin_character.radical == "some radical"
      assert mandarin_character.sound == "some sound"
      assert mandarin_character.stroke_order_simplified == "some stroke_order_simplified"
      assert mandarin_character.stroke_order_traditional == "some stroke_order_traditional"
      assert mandarin_character.tone == "some tone"
      assert mandarin_character.translated_to == "some translated_to"
      assert mandarin_character.vote_value == 42
    end

    test "create_mandarin_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_mandarin_character(@invalid_attrs)
    end

    test "update_mandarin_character/2 with valid data updates the mandarin_character" do
      mandarin_character = mandarin_character_fixture()
      assert {:ok, %MandarinCharacter{} = mandarin_character} = Languages.update_mandarin_character(mandarin_character, @update_attrs)
      assert mandarin_character.etymology == "some updated etymology"
      assert mandarin_character.final == "some updated final"
      assert mandarin_character.hanzi_standard == "some updated hanzi_standard"
      assert mandarin_character.hanzi_traditional == "some updated hanzi_traditional"
      assert mandarin_character.image == "some updated image"
      assert mandarin_character.initial == "some updated initial"
      assert mandarin_character.meaning == "some updated meaning"
      assert mandarin_character.mnemonic == "some updated mnemonic"
      assert mandarin_character.part_of_speech == "some updated part_of_speech"
      assert mandarin_character.pinyin == "some updated pinyin"
      assert mandarin_character.pronounciation_helper == "some updated pronounciation_helper"
      assert mandarin_character.radical == "some updated radical"
      assert mandarin_character.sound == "some updated sound"
      assert mandarin_character.stroke_order_simplified == "some updated stroke_order_simplified"
      assert mandarin_character.stroke_order_traditional == "some updated stroke_order_traditional"
      assert mandarin_character.tone == "some updated tone"
      assert mandarin_character.translated_to == "some updated translated_to"
      assert mandarin_character.vote_value == 43
    end

    test "update_mandarin_character/2 with invalid data returns error changeset" do
      mandarin_character = mandarin_character_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_mandarin_character(mandarin_character, @invalid_attrs)
      assert mandarin_character == Languages.get_mandarin_character!(mandarin_character.id)
    end

    test "delete_mandarin_character/1 deletes the mandarin_character" do
      mandarin_character = mandarin_character_fixture()
      assert {:ok, %MandarinCharacter{}} = Languages.delete_mandarin_character(mandarin_character)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_mandarin_character!(mandarin_character.id) end
    end

    test "change_mandarin_character/1 returns a mandarin_character changeset" do
      mandarin_character = mandarin_character_fixture()
      assert %Ecto.Changeset{} = Languages.change_mandarin_character(mandarin_character)
    end
  end
end
