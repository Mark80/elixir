defmodule Actor do
  @moduledoc false

  def execute_query do
    fn query_def ->
      Process.sleep(1000)
      "#{query_def} result"
    end
  end



  def main do
    Enum.map(1..5, &execute_query.("query #{&1}"))
  end

end
