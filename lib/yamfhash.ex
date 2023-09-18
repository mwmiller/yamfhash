defmodule YAMFhash do
  @moduledoc """
  Yet-Another-Multi-Format - Hash
  Pure Elixir implementation
  """

  @doc """
  Hash data by format id.

  Only id `0` (Blake2b-512) is implemented at this time
  """
  @spec create(binary, non_neg_integer) :: binary | :error
  def create(data, id)
  def create(data, 0) when is_binary(data), do: data |> hash_by_id(0) |> Stlv.encode(0)
  # We only know about the one format today
  def create(_, _), do: :error

  defp hash_by_id(data, 0), do: :crypto.hash(:blake2b, data)

  @doc """
  Verify hash by format id.

  Only id `0` (Blake2b-512) is implemented at this time

  Returns any trailing data on success.
  """
  @spec verify(binary, binary) :: binary | :error
  def verify(yamfhash, data) do
    case Stlv.decode(yamfhash) do
      {0, hash, rest} ->
        case :crypto.hash_equals(hash, hash_by_id(data, 0)) do
          true -> rest
          _ -> :error
        end

      _ ->
        :error
    end
  end
end
