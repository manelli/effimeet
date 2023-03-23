defmodule EffiMeet.Repo do
  use Ecto.Repo,
    otp_app: :effi_meet,
    adapter: Ecto.Adapters.Postgres
end
