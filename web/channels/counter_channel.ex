require IEx

defmodule WordScram.CounterChannel do
  use Phoenix.Channel
  alias WordScram.Counter
  alias WordScram.Repo
  alias WordScram.User

  def join("the_counter", _message, socket) do
    {:ok, socket}
  end

  # def handle_in("timer", _params, socket) do
  #   counter = Repo.get!(Counter, 1)
  #   new_value = counter.main + 1
  #
  #   changeset = Counter.changeset(counter, %{main: new_value})
  #
  #   case Repo.update(changeset) do
  #   {:error, changeset} ->
  #     broadcast! socket, "timer", %{body: false}
  #   changeset ->
  #     broadcast! socket, "timer", %{body: new_value}
  #   end
  #
  #   {:noreply, socket}
  # end

  # def handle_out("count_up", payload, socket) do
  #   push socket, "new_msg", payload
  #   {:noreply, socket}
  # end
end
