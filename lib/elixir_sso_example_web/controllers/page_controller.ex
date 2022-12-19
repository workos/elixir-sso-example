defmodule ElixirSSOExampleWeb.PageController do
  use ElixirSSOExampleWeb, :controller

  def index(conn, _params) do
    isLoggedIn = get_session(conn, :isLoggedIn)
    profile = get_session(conn, :profile)
    isLoggedIn && render(conn, "login_successful.html", profile: profile)

    render(conn, "index.html")
  end

  def login(conn, _params) do
    {:ok, redirect_url} = WorkOS.SSO.get_authorization_url(%{

      connection: Application.get_env(:elixir_sso_example, :connection),
      redirect_uri: Application.get_env(:elixir_sso_example, :redirect_uri)
    })
    redirect(conn, external: redirect_url)
  end

  def callback(conn, %{"code" => code}) do
    case WorkOS.SSO.get_profile(code) do
      {:ok, %{"profile" => profile}} ->
        conn = put_session(conn, :isLoggedIn, true)
        conn = put_session(conn, :profile, profile)
        redirect(conn, to: "/")
      {:error, %{"error_description" => error}} ->
        render(conn, "index.html", error: error)
      _ ->
        render(conn, "index.html")
    end
  end

  def logout(conn, _params) do
    conn = put_session(conn, :isLoggedIn, false)
    conn = put_session(conn, :profile, nil)
    redirect(conn, to: "/")
  end
end
