defmodule CrashPlugTest do
  use ExUnit.Case
  use Plug.Test

  test "doesn't do anything if there is no file" do
    conn = conn(:get, "/")
    conn = put_status(conn, 200)
    conn = CrashPlug.call(conn, [])
    assert conn.status == 200
  end

  test "returns 500 when file is present" do
    File.touch("crashit.txt")
    conn = conn(:get, "/")
    conn = CrashPlug.call(conn, [])
    assert conn.status == 500
    File.rm("crashit.txt")
  end
end
