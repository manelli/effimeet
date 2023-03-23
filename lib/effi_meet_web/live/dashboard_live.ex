defmodule EffiMeetWeb.DashboardLive do
  use EffiMeetWeb, :live_view

  def render(assigns) do
    ~H"""
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("event_name", _params, socket) do
    {:noreply, socket}
  end
end
