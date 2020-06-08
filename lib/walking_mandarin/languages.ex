defmodule WalkingMandarin.Languages do
  @moduledoc """
  The Languages context.
  """

  import Ecto.Query, warn: false
  alias WalkingMandarin.Repo

  alias WalkingMandarin.Languages.MandarinToEnglishWord

  @doc """
  Returns the list of mandarin_to_english_words.

  ## Examples

      iex> list_mandarin_to_english_words()
      [%MandarinToEnglishWord{}, ...]

  """
  def list_mandarin_to_english_words do
    Repo.all(MandarinToEnglishWord)
  end

  @doc """
  Gets a single mandarin_to_english_word.

  Raises `Ecto.NoResultsError` if the Mandarin to English Word does not exist.

  ## Examples

      iex> get_mandarin_to_english_word!(123)
      %MandarinToEnglishWord{}

      iex> get_mandarin_to_english_word!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mandarin_to_english_word!(id), do: Repo.get!(MandarinToEnglishWord, id)

  @doc """
  Creates a mandarin_to_english_word.

  ## Examples

      iex> create_mandarin_to_english_word(%{field: value})
      {:ok, %MandarinToEnglishWord{}}

      iex> create_mandarin_to_english_word(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mandarin_to_english_word(attrs \\ %{}) do
    %MandarinToEnglishWord{}
    |> MandarinToEnglishWord.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mandarin_to_english_word.

  ## Examples

      iex> update_mandarin_to_english_word(mandarin_to_english_word, %{field: new_value})
      {:ok, %MandarinToEnglishWord{}}

      iex> update_mandarin_to_english_word(mandarin_to_english_word, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mandarin_to_english_word(%MandarinToEnglishWord{} = mandarin_to_english_word, attrs) do
    mandarin_to_english_word
    |> MandarinToEnglishWord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mandarin_to_english_word.

  ## Examples

      iex> delete_mandarin_to_english_word(mandarin_to_english_word)
      {:ok, %MandarinToEnglishWord{}}

      iex> delete_mandarin_to_english_word(mandarin_to_english_word)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mandarin_to_english_word(%MandarinToEnglishWord{} = mandarin_to_english_word) do
    Repo.delete(mandarin_to_english_word)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mandarin_to_english_word changes.

  ## Examples

      iex> change_mandarin_to_english_word(mandarin_to_english_word)
      %Ecto.Changeset{data: %MandarinToEnglishWord{}}

  """
  def change_mandarin_to_english_word(%MandarinToEnglishWord{} = mandarin_to_english_word, attrs \\ %{}) do
    MandarinToEnglishWord.changeset(mandarin_to_english_word, attrs)
  end
end
