defmodule Req.RestrictedUrlError do
  @moduledoc """
  Represents restricted URL error. The error is raised for SSRF prevention sake.
  """

  defexception [:url]

  @impl true
  def message(%{url: url}), do: "URL #{url} is restricted"
end
