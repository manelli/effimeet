defmodule EffiMeet.Documents.Meeting do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "meetings" do
    field :content, :map
    field :user_id, :binary_id
    field :template, :binary_id

    timestamps()
  end

  @doc false
  def changeset(meeting, attrs) do
    meeting
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
