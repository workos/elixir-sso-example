defmodule ElixirSSOExampleWeb.PageController do
  use ElixirSSOExampleWeb, :controller

  def index(conn, %{"code" => code}) do
    case WorkOS.SSO.get_profile(code) do
      {:ok, %{"profile" => profile}} ->
        render(conn, "index.html", profile: profile)
      {:error, %{"error_description" => error}} ->
        render(conn, "index.html", error: error)
      _ ->
        render(conn, "index.html")
    end
  end
  def index(conn, _params),do: render(conn, "index.html")

  def login(conn, _params) do
    {:ok, redirect_url} = WorkOS.SSO.get_authorization_url(%{
      domain: Application.get_env(:elixir_sso_example, :domain),
      redirect_uri: Application.get_env(:elixir_sso_example, :redirect_uri)
    })
    redirect(conn, external: redirect_url)
  end
end
