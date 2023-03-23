defmodule EffiMeet.DocumentsTest do
  use EffiMeet.DataCase

  alias EffiMeet.Documents

  describe "templates" do
    alias EffiMeet.Documents.Template

    import EffiMeet.DocumentsFixtures

    @invalid_attrs %{content: nil, max_duration_minutes: nil, name: nil}

    test "list_templates/0 returns all templates" do
      template = template_fixture()
      assert Documents.list_templates() == [template]
    end

    test "get_template!/1 returns the template with given id" do
      template = template_fixture()
      assert Documents.get_template!(template.id) == template
    end

    test "create_template/1 with valid data creates a template" do
      valid_attrs = %{content: %{}, max_duration_minutes: 42, name: "some name"}

      assert {:ok, %Template{} = template} = Documents.create_template(valid_attrs)
      assert template.content == %{}
      assert template.max_duration_minutes == 42
      assert template.name == "some name"
    end

    test "create_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_template(@invalid_attrs)
    end

    test "update_template/2 with valid data updates the template" do
      template = template_fixture()
      update_attrs = %{content: %{}, max_duration_minutes: 43, name: "some updated name"}

      assert {:ok, %Template{} = template} = Documents.update_template(template, update_attrs)
      assert template.content == %{}
      assert template.max_duration_minutes == 43
      assert template.name == "some updated name"
    end

    test "update_template/2 with invalid data returns error changeset" do
      template = template_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_template(template, @invalid_attrs)
      assert template == Documents.get_template!(template.id)
    end

    test "delete_template/1 deletes the template" do
      template = template_fixture()
      assert {:ok, %Template{}} = Documents.delete_template(template)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_template!(template.id) end
    end

    test "change_template/1 returns a template changeset" do
      template = template_fixture()
      assert %Ecto.Changeset{} = Documents.change_template(template)
    end
  end

  describe "meetings" do
    alias EffiMeet.Documents.Meeting

    import EffiMeet.DocumentsFixtures

    @invalid_attrs %{content: nil}

    test "list_meetings/0 returns all meetings" do
      meeting = meeting_fixture()
      assert Documents.list_meetings() == [meeting]
    end

    test "get_meeting!/1 returns the meeting with given id" do
      meeting = meeting_fixture()
      assert Documents.get_meeting!(meeting.id) == meeting
    end

    test "create_meeting/1 with valid data creates a meeting" do
      valid_attrs = %{content: %{}}

      assert {:ok, %Meeting{} = meeting} = Documents.create_meeting(valid_attrs)
      assert meeting.content == %{}
    end

    test "create_meeting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_meeting(@invalid_attrs)
    end

    test "update_meeting/2 with valid data updates the meeting" do
      meeting = meeting_fixture()
      update_attrs = %{content: %{}}

      assert {:ok, %Meeting{} = meeting} = Documents.update_meeting(meeting, update_attrs)
      assert meeting.content == %{}
    end

    test "update_meeting/2 with invalid data returns error changeset" do
      meeting = meeting_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_meeting(meeting, @invalid_attrs)
      assert meeting == Documents.get_meeting!(meeting.id)
    end

    test "delete_meeting/1 deletes the meeting" do
      meeting = meeting_fixture()
      assert {:ok, %Meeting{}} = Documents.delete_meeting(meeting)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_meeting!(meeting.id) end
    end

    test "change_meeting/1 returns a meeting changeset" do
      meeting = meeting_fixture()
      assert %Ecto.Changeset{} = Documents.change_meeting(meeting)
    end
  end
end
