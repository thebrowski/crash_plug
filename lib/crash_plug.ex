defmodule CrashPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, options) do
    present? = File.exists?("crashit.txt")
    case present? do
      true -> raise "Crash and burn"
      false -> conn
    end
  end
end
