defmodule EffiMeetWeb.MeetingLive.Index do
  use EffiMeetWeb, :live_view

  alias EffiMeet.Documents
  alias EffiMeet.Documents.Meeting

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :meetings, Documents.list_meetings())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Meeting")
    |> assign(:meeting, Documents.get_meeting!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Meeting")
    |> assign(:meeting, %Meeting{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Meetings")
    |> assign(:meeting, nil)
  end

  @impl true
  def handle_info({EffiMeetWeb.MeetingLive.FormComponent, {:saved, meeting}}, socket) do
    {:noreply, stream_insert(socket, :meetings, meeting)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    meeting = Documents.get_meeting!(id)
    {:ok, _} = Documents.delete_meeting(meeting)

    {:noreply, stream_delete(socket, :meetings, meeting)}
  end
end
