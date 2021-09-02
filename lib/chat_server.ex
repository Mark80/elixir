defmodule Chat.Supervisor do

  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Chat.Server, [])
    ]

    supervise(children, strategy: :one_for)

  end

end


defmodule Chat.Server do
  @moduledoc false

  use GenServer

  #client side
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end

  def get_msg(pid) do
    GenServer.call(pid, :get_msgs)
  end

  def add_msg(pid, msg) do
    GenServer.cast(pid, {:add_msg, msg})
  end


  #server side
  def init(msg) do
    IO.puts("function init... ")
    {:ok, msg}
  end

  def handle_call(:get_msgs, _form, msgs) do
    {:reply, msgs, msgs}
  end

  def handle_cast({:add_msg, msg}, msgs) do
    {:noreply, [msg | msgs]}

  end




end