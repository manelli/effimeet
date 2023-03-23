defmodule EffiMeet.Documents.Template do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "templates" do
    field :content, :map
    field :max_duration_minutes, :integer
    field :name, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name, :max_duration_minutes, :content])
    |> validate_required([:name, :max_duration_minutes, :content])
  end
end
