defmodule YAMFhashTest do
  use ExUnit.Case
  doctest YAMFhash

  test "create looks rightish" do
    assert <<0, 64, _::binary>> = YAMFhash.create("hello", 0)
    assert YAMFhash.create("hello", 1) == :error
  end

  test "verify seems ok" do
    val = YAMFhash.create("test data", 0)
    assert YAMFhash.verify(val, "test data") == ""
    assert YAMFhash.verify(val <> "otherstuff", "test data") == "otherstuff"
    assert YAMFhash.verify("otherstuff", "test data") == :error
  end
end
