defmodule WalkingMandarinWeb.MandarinToEnglishWordLiveTest do
  use WalkingMandarinWeb.ConnCase

  import Phoenix.LiveViewTest

  alias WalkingMandarin.Languages

  @create_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", vote_value: 42}
  @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", vote_value: 43}
  @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, vote_value: nil}

  defp fixture(:mandarin_to_english_word) do
    {:ok, mandarin_to_english_word} = Languages.create_mandarin_to_english_word(@create_attrs)
    mandarin_to_english_word
  end

  defp create_mandarin_to_english_word(_) do
    mandarin_to_english_word = fixture(:mandarin_to_english_word)
    %{mandarin_to_english_word: mandarin_to_english_word}
  end

  describe "Index" do
    setup [:create_mandarin_to_english_word]

    test "lists all mandarin_to_english_words", %{conn: conn, mandarin_to_english_word: mandarin_to_english_word} do
      {:ok, _index_live, html} = live(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert html =~ "Listing Mandarin to English Words"
      assert html =~ mandarin_to_english_word.etymology
    end

    test "saves new mandarin_to_english_word", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert index_live |> element("a", "New Mandarin to English Word") |> render_click() =~
               "New Mandarin to English Word"

      assert_patch(index_live, Routes.mandarin_to_english_word_index_path(conn, :new))

      assert index_live
             |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert html =~ "Mandarin to English Word created successfully"
      assert html =~ "some etymology"
    end

    test "updates mandarin_to_english_word in listing", %{conn: conn, mandarin_to_english_word: mandarin_to_english_word} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert index_live |> element("#mandarin_to_english_word-#{mandarin_to_english_word.id} a", "Edit") |> render_click() =~
               "Edit Mandarin to English Word"

      assert_patch(index_live, Routes.mandarin_to_english_word_index_path(conn, :edit, mandarin_to_english_word))

      assert index_live
             |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert html =~ "Mandarin to English Word updated successfully"
      assert html =~ "some updated etymology"
    end

    test "deletes mandarin_to_english_word in listing", %{conn: conn, mandarin_to_english_word: mandarin_to_english_word} do
      {:ok, index_live, _html} = live(conn, Routes.mandarin_to_english_word_index_path(conn, :index))

      assert index_live |> element("#mandarin_to_english_word-#{mandarin_to_english_word.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#mandarin_to_english_word-#{mandarin_to_english_word.id}")
    end
  end

  describe "Show" do
    setup [:create_mandarin_to_english_word]

    test "displays mandarin_to_english_word", %{conn: conn, mandarin_to_english_word: mandarin_to_english_word} do
      {:ok, _show_live, html} = live(conn, Routes.mandarin_to_english_word_show_path(conn, :show, mandarin_to_english_word))

      assert html =~ "Show Mandarin to English Word"
      assert html =~ mandarin_to_english_word.etymology
    end

    test "updates mandarin_to_english_word within modal", %{conn: conn, mandarin_to_english_word: mandarin_to_english_word} do
      {:ok, show_live, _html} = live(conn, Routes.mandarin_to_english_word_show_path(conn, :show, mandarin_to_english_word))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Mandarin to English Word"

      assert_patch(show_live, Routes.mandarin_to_english_word_show_path(conn, :edit, mandarin_to_english_word))

      assert show_live
             |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#mandarin_to_english_word-form", mandarin_to_english_word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.mandarin_to_english_word_show_path(conn, :show, mandarin_to_english_word))

      assert html =~ "Mandarin to English Word updated successfully"
      assert html =~ "some updated etymology"
    end
  end
end
