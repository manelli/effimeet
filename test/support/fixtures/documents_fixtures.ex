defmodule EffiMeet.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EffiMeet.Documents` context.
  """

  @doc """
  Generate a template.
  """
  def template_fixture(attrs \\ %{}) do
    {:ok, template} =
      attrs
      |> Enum.into(%{
        content: %{},
        max_duration_minutes: 42,
        name: "some name"
      })
      |> EffiMeet.Documents.create_template()

    template
  end

  @doc """
  Generate a meeting.
  """
  def meeting_fixture(attrs \\ %{}) do
    {:ok, meeting} =
      attrs
      |> Enum.into(%{
        content: %{}
      })
      |> EffiMeet.Documents.create_meeting()

    meeting
  end
end
