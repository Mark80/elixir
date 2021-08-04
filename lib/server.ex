defmodule Server do
  @moduledoc false

  use GenServer

  def main() do
    {:ok, pid} = GenServer.start_link(Server, ["first"])
    GenServer.call(pid, {:update, "second"})
    {:ok, state} = GenServer.call(pid, :get_state)
    IO.puts(state)
  end

  def update_state(value) do
    GenServer.call(__MODULE__, {:update, value})
  end

  def start_link(state, _opts) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def handle_call(:get_state, _from, current_state) do
    {:reply, {:ok, current_state}, current_state}
  end

  def handle_call({:update, value}, _from, current_state) do
    {:reply, :ok, current_state ++ [value]}
  end

  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end
