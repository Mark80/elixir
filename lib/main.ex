defmodule Main do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Main.Supervisor.start_link()
  end

  def stuff do

    number = IO.gets("Insert a number:") |> String.trim |> String.to_integer

    cond do
      number > 10 -> IO.puts("Greater than 10")
      number > 5 -> IO.puts("Greater than 5")
      number > 0 -> IO.puts("Greater than 0")
      true -> IO.puts("Default")

    end

  end
end