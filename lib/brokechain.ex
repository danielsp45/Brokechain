defmodule Brokechain do
  @moduledoc """
  Documentation for `Brokechain`.
  """

  @doc "Create a new Blockchain with a zero block"
  def new do
    [ Crypto.put_hash(Block.zero) ]
  end

  @doc "Insert given data as a new block in the blockchain"
  def insert(blockchain, data) when is_list(blockchain) do
    %Block{hash: prev} = hd(blockchain)

    block = 
      data 
      |> Block.new(prev)
      |> Crypto.put_hash

    [ block | blockchain]
  end
end
