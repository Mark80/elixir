defmodule Example do
  @moduledoc """
  Documentation for `Elixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixir.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Math do
  @spec square(number) :: number
  def square(n) do
    n * n
  end

  def fn_square do
    fn x -> x * x end
  end

end


defmodule Geometry do
  @moduledoc "Module that provide geometry stuff"

  def square_area(side) do
    side * side
  end
end

defmodule Set do
  def create do
    MapSet.new()
    |> MapSet.put("ciao")
    |> MapSet.put(4)
  end
end

defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(todo_list, entry) do
    # add id to entry
    entry = Map.put(entry, :id, todo_list.auto_id)

    # add entries to a collection
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)

    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, en} -> en.date == date end)
    |> Enum.map(fn {_, en} -> en end)
  end
end

defmodule Misc do

  def sync_fn do
    fn a ->
      Process.sleep 500
      "#{a}"
    end
  end

end

defmodule PlayGround do

  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value)  do
    new_value = receive do

      {:view, pid} ->
        send(pid, {:response, current_value})
        current_value

      {:add, value} ->
        current_value + value

      {:less, value} ->
        current_value - value


    end
    loop(new_value)
  end

  def value(server_id) do
    send(server_id, {:view, self()})
    receive do
      {:response, current_value} -> current_value
    end
  end

  def sum(server_id, value), do: send(server_id, {:add, value})
  def less(server_id, value), do: send(server_id, {:less, value})

end

defmodule Counter do

  def run() do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value) do

    new_value = receive do
      v -> current_value + v
      {:get, pid} -> send(pid, current_value)
    end

    loop(new_value)

  end

end
