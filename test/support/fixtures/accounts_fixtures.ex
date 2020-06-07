defmodule WalkingMandarin.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WalkingMandarin.Accounts` context.
  """

  def unique_users_email, do: "users#{System.unique_integer()}@example.com"
  def valid_users_password, do: "hello world!"

  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: unique_users_email(),
        password: valid_users_password()
      })
      |> WalkingMandarin.Accounts.register_users()

    users
  end

  def extract_users_token(fun) do
    {:ok, captured} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token, _] = String.split(captured.body, "[TOKEN]")
    token
  end
end
