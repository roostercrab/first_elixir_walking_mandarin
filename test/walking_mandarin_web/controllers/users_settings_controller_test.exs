defmodule WalkingMandarinWeb.UsersSettingsControllerTest do
  use WalkingMandarinWeb.ConnCase, async: true

  alias WalkingMandarin.Accounts
  import WalkingMandarin.AccountsFixtures

  setup :register_and_login_users

  describe "GET /user/settings" do
    test "renders settings page", %{conn: conn} do
      conn = get(conn, Routes.users_settings_path(conn, :edit))
      response = html_response(conn, 200)
      assert response =~ "<h1>Settings</h1>"
    end

    test "redirects if users is not logged in" do
      conn = build_conn()
      conn = get(conn, Routes.users_settings_path(conn, :edit))
      assert redirected_to(conn) == "/user/login"
    end
  end

  describe "PUT /user/settings/update_password" do
    test "updates the users password and resets tokens", %{conn: conn, users: users} do
      new_password_conn =
        put(conn, Routes.users_settings_path(conn, :update_password), %{
          "current_password" => valid_users_password(),
          "users" => %{
            "password" => "new valid password",
            "password_confirmation" => "new valid password"
          }
        })

      assert redirected_to(new_password_conn) == "/user/settings"
      assert get_session(new_password_conn, :users_token) != get_session(conn, :users_token)
      assert get_flash(new_password_conn, :info) =~ "Password updated successfully"
      assert Accounts.get_users_by_email_and_password(users.email, "new valid password")
    end

    test "does not update password on invalid data", %{conn: conn} do
      old_password_conn =
        put(conn, Routes.users_settings_path(conn, :update_password), %{
          "current_password" => "invalid",
          "users" => %{
            "password" => "too short",
            "password_confirmation" => "does not match"
          }
        })

      response = html_response(old_password_conn, 200)
      assert response =~ "<h1>Settings</h1>"
      assert response =~ "should be at least 12 character(s)"
      assert response =~ "does not match password"
      assert response =~ "is not valid"

      assert get_session(old_password_conn, :users_token) == get_session(conn, :users_token)
    end
  end

  describe "PUT /user/settings/update_email" do
    @tag :capture_log
    test "updates the users email", %{conn: conn, users: users} do
      conn =
        put(conn, Routes.users_settings_path(conn, :update_email), %{
          "current_password" => valid_users_password(),
          "users" => %{"email" => unique_users_email()}
        })

      assert redirected_to(conn) == "/user/settings"
      assert get_flash(conn, :info) =~ "A link to confirm your e-mail"
      assert Accounts.get_users_by_email(users.email)
    end

    test "does not update email on invalid data", %{conn: conn} do
      conn =
        put(conn, Routes.users_settings_path(conn, :update_email), %{
          "current_password" => "invalid",
          "users" => %{"email" => "with spaces"}
        })

      response = html_response(conn, 200)
      assert response =~ "<h1>Settings</h1>"
      assert response =~ "must have the @ sign and no spaces"
      assert response =~ "is not valid"
    end
  end

  describe "GET /user/settings/confirm_email/:token" do
    setup %{users: users} do
      email = unique_users_email()

      token =
        extract_users_token(fn url ->
          Accounts.deliver_update_email_instructions(%{users | email: email}, users.email, url)
        end)

      %{token: token, email: email}
    end

    test "updates the users email once", %{conn: conn, users: users, token: token, email: email} do
      conn = get(conn, Routes.users_settings_path(conn, :confirm_email, token))
      assert redirected_to(conn) == "/user/settings"
      assert get_flash(conn, :info) =~ "E-mail changed successfully"
      refute Accounts.get_users_by_email(users.email)
      assert Accounts.get_users_by_email(email)

      conn = get(conn, Routes.users_settings_path(conn, :confirm_email, token))
      assert redirected_to(conn) == "/user/settings"
      assert get_flash(conn, :error) =~ "Email change link is invalid or it has expired"
    end

    test "does not update email with invalid token", %{conn: conn, users: users} do
      conn = get(conn, Routes.users_settings_path(conn, :confirm_email, "oops"))
      assert redirected_to(conn) == "/user/settings"
      assert get_flash(conn, :error) =~ "Email change link is invalid or it has expired"
      assert Accounts.get_users_by_email(users.email)
    end

    test "redirects if users is not logged in", %{token: token} do
      conn = build_conn()
      conn = get(conn, Routes.users_settings_path(conn, :confirm_email, token))
      assert redirected_to(conn) == "/user/login"
    end
  end
end
