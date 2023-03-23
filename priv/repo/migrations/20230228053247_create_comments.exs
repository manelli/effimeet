defmodule EffiMeet.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :meeting, references(:meetings, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:comments, [:user_id])
    create index(:comments, [:meeting])
  end
end
