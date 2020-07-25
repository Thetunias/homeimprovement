defmodule HomeImprovement.Schema do
  @moduledoc """
  Define commonly used imports for all `Ecto.Schema`s here.

  ## Example

      defmodule HomeImprovement.Context.Model do
        use HomeImprovement.Schema
      end
  """

  @doc false
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      @timestamps_opts [
        inserted_at: :date_inserted,
        updated_at: :date_updated
      ]

      import Ecto.Changeset, warn: false
      import HomeImprovement.Schema, warn: false
    end
  end

  # Define any functions you want to be available in all your Ecto.Schemas here
end
