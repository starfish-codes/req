defmodule Req.SafeURL do
  @moduledoc """
  Plugin that uses SafeURL
  """

  def attach(request), do: Req.Request.append_request_steps(request, safe_url: &validate/1)

  def validate(%Req.Request{url: url} = request) do
    url = URI.to_string(url)

    case SafeURL.validate(url) do
      :ok ->
        request

      {:error, :restricted} ->
        Req.Request.halt(request, %Req.RestrictedUrlError{url: url})
    end
  end
end
