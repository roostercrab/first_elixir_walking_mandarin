defmodule WalkingMandarin.Languages do
  @moduledoc """
  The Languages context.
  """

  import Ecto.Query, warn: false
  alias WalkingMandarin.Repo

  alias WalkingMandarin.Languages.MandarinCharacter

  @doc """
  Returns the list of mandarin_characters.

  ## Examples

      iex> list_mandarin_characters()
      [%MandarinCharacter{}, ...]

  """
  def list_mandarin_characters do
    Repo.all(MandarinCharacter)
  end

  @doc """
  Gets a single mandarin_character.

  Raises `Ecto.NoResultsError` if the Mandarin character does not exist.

  ## Examples

      iex> get_mandarin_character!(123)
      %MandarinCharacter{}

      iex> get_mandarin_character!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mandarin_character!(id), do: Repo.get!(MandarinCharacter, id)

  @doc """
  Creates a mandarin_character.

  ## Examples

      iex> create_mandarin_character(%{field: value})
      {:ok, %MandarinCharacter{}}

      iex> create_mandarin_character(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mandarin_character(attrs \\ %{}) do
    %MandarinCharacter{}
    |> MandarinCharacter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mandarin_character.

  ## Examples

      iex> update_mandarin_character(mandarin_character, %{field: new_value})
      {:ok, %MandarinCharacter{}}

      iex> update_mandarin_character(mandarin_character, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mandarin_character(%MandarinCharacter{} = mandarin_character, attrs) do
    mandarin_character
    |> MandarinCharacter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mandarin_character.

  ## Examples

      iex> delete_mandarin_character(mandarin_character)
      {:ok, %MandarinCharacter{}}

      iex> delete_mandarin_character(mandarin_character)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mandarin_character(%MandarinCharacter{} = mandarin_character) do
    Repo.delete(mandarin_character)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mandarin_character changes.

  ## Examples

      iex> change_mandarin_character(mandarin_character)
      %Ecto.Changeset{data: %MandarinCharacter{}}

  """
  def change_mandarin_character(%MandarinCharacter{} = mandarin_character, attrs \\ %{}) do
    MandarinCharacter.changeset(mandarin_character, attrs)
  end
end
