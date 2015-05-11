defmodule CrashPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, options) do
    present? = File.exists?("crashit.txt")
    case present? do
      true -> halt send_resp conn, 500, ""
      false -> conn
    end 
  end
end
