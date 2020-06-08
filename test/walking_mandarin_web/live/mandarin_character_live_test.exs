defmodule WalkingMandarinWeb.MandarinCharacterLiveTest do
  use WalkingMandarinWeb.ConnCase

  import Phoenix.LiveViewTest

  alias WalkingMandarin.Languages

  @create_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", translated_to: "some translated_to", vote_value: 42}
  @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", translated_to: "some updated translated_to", vote_value: 43}
  @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, translated_to: nil, vote_value: nil}

  defp fixture(:mandarin_character) do
    {:ok, mandarin_character} = Languages.create_mandarin_character(@create_attrs)
    mandarin_character
  end

  defp create_mandarin_character(_) do
    mandarin_character = fixture(:mandarin_character)
    %{mandarin_character: mandarin_character}
  end

  describe "Index" do
    setup [:create_mandarin_character]

    test "lists all mandarin_characters", %{conn: conn, mandarin_character: mandarin_character} do
      {:ok, _index_live, html} = live(conn, Routes.mandarin_character_index_path(conn, :index))

      assert html =~ "Listing Mandarin characters"
      assert html =~ mandarin_character.etymology
    end

    test "saves new mandarin_character", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_character_index_path(conn, :index))

      assert index_live |> element("a", "New Mandarin character") |> render_click() =~
               "New Mandarin character"

      assert_patch(index_live, Routes.mandarin_character_index_path(conn, :new))

      assert index_live
             |> form("#mandarin_character-form", mandarin_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#mandarin_character-form", mandarin_character: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_character_index_path(conn, :index))

      assert html =~ "Mandarin character created successfully"
      assert html =~ "some etymology"
    end

    test "updates mandarin_character in listing", %{conn: conn, mandarin_character: mandarin_character} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_character_index_path(conn, :index))

      assert index_live |> element("#mandarin_character-#{mandarin_character.id} a", "Edit") |> render_click() =~
               "Edit Mandarin character"

      assert_patch(index_live, Routes.mandarin_character_index_path(conn, :edit, mandarin_character))

      assert index_live
             |> form("#mandarin_character-form", mandarin_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#mandarin_character-form", mandarin_character: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_character_index_path(conn, :index))

      assert html =~ "Mandarin character updated successfully"
      assert html =~ "some updated etymology"
    end

    test "deletes mandarin_character in listing", %{conn: conn, mandarin_character: mandarin_character} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_character_index_path(conn, :index))

      assert index_live |> element("#mandarin_character-#{mandarin_character.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#mandarin_character-#{mandarin_character.id}")
    end
  end

  describe "Show" do
    setup [:create_mandarin_character]

    test "displays mandarin_character", %{conn: conn, mandarin_character: mandarin_character} do
      {:ok, _show_live, html} = live(conn, Routes.mandarin_character_show_path(conn, :show, mandarin_character))

      assert html =~ "Show Mandarin character"
      assert html =~ mandarin_character.etymology
    end

    test "updates mandarin_character within modal", %{conn: conn, mandarin_character: mandarin_character} do
      {:ok, show_live, _html} = live(conn, Routes.mandarin_character_show_path(conn, :show, mandarin_character))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Mandarin character"

      assert_patch(show_live, Routes.mandarin_character_show_path(conn, :edit, mandarin_character))

      assert show_live
             |> form("#mandarin_character-form", mandarin_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#mandarin_character-form", mandarin_character: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_character_show_path(conn, :show, mandarin_character))

      assert html =~ "Mandarin character updated successfully"
      assert html =~ "some updated etymology"
    end
  end
end
