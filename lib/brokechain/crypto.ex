defmodule Crypto do 
  # Specify which fields to hash in the block
  @hash_fields [:data, :timestamp, :prev_hash]
  
  defp sha256(binary) do
    :crypto.hash(:sha256, binary)
    |> Base.encode16()
    |> String.downcase()
  end

  @doc "Calculate hash of block"
  def hash(%{} = block) do
    block
    |> Map.take(@hash_fields)
    |> Poison.encode!
    |> sha256
  end

  @doc "Calculate and put the hash in the block"
  def put_hash(%{} = block) do
    %{block | hash: hash(block)}
  end
end
