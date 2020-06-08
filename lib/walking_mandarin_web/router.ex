defmodule WalkingMandarinWeb.Router do
  use WalkingMandarinWeb, :router

  import WalkingMandarinWeb.UsersAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {WalkingMandarinWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_users
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WalkingMandarinWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/mandarin_to_english_words", MandarinToEnglishWordLive.Index, :index
    live "/mandarin_to_english_words/new", MandarinToEnglishWordLive.Index, :new
    live "/mandarin_to_english_words/:id/edit", MandarinToEnglishWordLive.Index, :edit
    live "/mandarin_to_english_words/:id", MandarinToEnglishWordLive.Show, :show
    live "/mandarin_to_english_words/:id/show/edit", MandarinToEnglishWordLive.Show, :edit

  end

  # Other scopes may use custom stacks.
  # scope "/api", WalkingMandarinWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: WalkingMandarinWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", WalkingMandarinWeb do
    pipe_through [:browser, :redirect_if_users_is_authenticated]

    get "/user/register", UsersRegistrationController, :new
    post "/user/register", UsersRegistrationController, :create
    get "/user/login", UsersSessionController, :new
    post "/user/login", UsersSessionController, :create
    get "/user/reset_password", UsersResetPasswordController, :new
    post "/user/reset_password", UsersResetPasswordController, :create
    get "/user/reset_password/:token", UsersResetPasswordController, :edit
    put "/user/reset_password/:token", UsersResetPasswordController, :update
  end

  scope "/", WalkingMandarinWeb do
    pipe_through [:browser, :require_authenticated_users]

    get "/user/settings", UsersSettingsController, :edit
    put "/user/settings/update_password", UsersSettingsController, :update_password
    put "/user/settings/update_email", UsersSettingsController, :update_email
    get "/user/settings/confirm_email/:token", UsersSettingsController, :confirm_email
  end

  scope "/", WalkingMandarinWeb do
    pipe_through [:browser]

    delete "/user/logout", UsersSessionController, :delete
    get "/user/confirm", UsersConfirmationController, :new
    post "/user/confirm", UsersConfirmationController, :create
    get "/user/confirm/:token", UsersConfirmationController, :confirm
  end
end
