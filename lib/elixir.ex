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
