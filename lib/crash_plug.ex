defmodule CrashPlug do
  def init(options) do
    options
  end

  def call(conn, _options \\ []) do
    present? = File.exists?("crashit.txt")
    if present? do
      raise "Crash and burn"
    else
      conn
    end
  end
end
