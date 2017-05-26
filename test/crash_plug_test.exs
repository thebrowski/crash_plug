defmodule CrashPlugTest do
  use ExUnit.Case
  use Plug.Test

  test "doesn't do anything if there is no file" do
    conn =
      conn(:get, "/")
      |> put_status(200)
      |> CrashPlug.call

    assert conn.status == 200
  end

  test "returns 500 when file is present" do
    File.touch("crashit.txt")
    assert_raise RuntimeError, "Crash and burn", fn ->
      conn(:get, "/")
      |> CrashPlug.call
    end
    File.rm("crashit.txt")
  end
end
