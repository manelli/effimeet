defmodule EffiMeet.Repo.Migrations.CreateMeetings do
  use Ecto.Migration

  def change do
    create table(:meetings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :map
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :template, references(:templates, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:meetings, [:user_id])
    create index(:meetings, [:template])
  end
end
