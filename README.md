# elixir-sso-example

An example application demonstrating how SSO works with WorkOS and Elixir.

## Clone and Install

Clone this repo and install dependencies:

```sh
git clone https://github.com/workos-inc/elixir-sso-example.git && cd elixir-sso-example && mix deps.get
```

## Configure your environment

1. Grab your [API Key](https://dashboard.workos.com/api-keys).
2. Create an [SSO Connection](https://dashboard.workos.com/sso/connections).
3. Configure a [Redirect URI](https://dashboard.workos.com/sso/configuration) to `http://localhost:4000`.
4. Get your [Project ID](https://dashboard.workos.com/sso/configuration).
5. Update `config/config.exs`:

```typescript
config :elixir_sso_example,
  redirect_uri: "http://localhost:4000",
  domain: "$YOUR_DOMAIN"

config :workos,
  client_id: "$YOUR_CLIENT_ID",
  api_key: "$YOUR_API_KEY"

```

## Run the server and log in using SSO

```sh
mix phx.server
# OR
iex -S mix phx.server
```

Head to [`http://localhost:4000/`](http://localhost:4000) and click log in.

For more information, see the [WorkOS Elixir SDK](https://github.com/workos-inc/workos-elixir).
