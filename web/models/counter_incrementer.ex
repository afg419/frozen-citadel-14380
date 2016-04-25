defmodule WordScram.CounterIncrementer do
  alias WordScram.Repo
  alias WordScram.Counter

  def start_link do
    pid = spawn_link __MODULE__, :loop, []

    if Enum.count(Repo.all(Counter)) == 0 do
      counter = %Counter{}
      |> Counter.changeset(%{active_game: false, letters: "abcdefghi", game_end_time: 30, lobby_end_time: 15, main: 0})
      |> Repo.insert!
    end

    {:ok, pid}
  end

  def loop do
    {:ok, counter} = Repo.get!(Counter, 1)
      |> Counter.update

    WordScram.Endpoint.broadcast! "the_counter", "timer", Counter.to_json(counter)

    IO.puts counter.main

    :timer.sleep(1000)
    loop
  end
end
