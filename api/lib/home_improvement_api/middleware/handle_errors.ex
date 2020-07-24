defmodule HomeImprovementApi.Middleware.HandleErrors do
  @moduledoc """
  `Absinthe.Middleware` which handles error tuples from resolver functions.

  This allows resolver functions to be much simpler, because they do not
  have to handle their own errors. This is very similar to `action_fallback`
  in Phoenix.

  ## Example

      # Resolver function
      def get(%{id: id}, _context) do
        Domain.get_item(id)
      end
  """

  @behaviour Absinthe.Middleware

  defp handle_error(error) do
    {:error, error}
  end

  @impl Absinthe.Middleware
  def call(%{errors: errors} = resolution, _opts) do
    results =
      errors
      |> Enum.map(&handle_error/1)
      |> Enum.group_by(&elem(&1, 0))

    errors = Enum.map(results[:error] || [], &unwrap!/1)
    resolution = Map.put(resolution, :errors, errors)

    Enum.reduce(results[:ok] || [], resolution, fn result, resolution ->
      Absinthe.Resolution.put_result(resolution, result)
    end)
  end

  defp unwrap!({_, value}), do: value
end
