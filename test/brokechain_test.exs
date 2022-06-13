defmodule BrokechainTest do
  use ExUnit.Case
  doctest Brokechain

  test "greets the world" do
    assert Brokechain.hello() == :world
  end
end
