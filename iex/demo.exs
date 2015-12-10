defmodule CookieMonster do
  def read_cookie_monster_mailbox do
    receive do
      # wait for incoming msg
      {:food, arg} -> eat_cookie({:food, arg})
      _ -> raise "invalid msg"
    end
    read_cookie_monster_mailbox
  end

  defp eat_cookie({:food, nil}) do
    print_red "Hey! where is my cookie you bastard?!"
  end
  defp eat_cookie({:food, "cookie"}) do
    print_green "Om Num Num Num Num!"
  end
  defp eat_cookie({:food, "broccoli"}) do
    print_red "I hate broccoli!"
  end
  defp eat_cookie({:food, somthing}) do
    print_red "#{somthing}?? WTF is that?!"
  end

  defp print_red(msg) do
     IO.puts IO.ANSI.format([:red, :bright, msg], true)
  end
  defp print_green(msg) do
     IO.puts IO.ANSI.format([:green, :bright, msg], true)
  end
end

defmodule HellOfAlotOfMonsters do
  def release_em_all do
    (1..100)
      |> Enum.map(fn _x-> create_monster() end)
      |> Enum.map(fn monster -> feed_monster monster end)
  end

  def create_monster do
    spawn_link fn -> CookieMonster.read_cookie_monster_mailbox end
  end

  def feed_monster(monster) do
    food = Enum.random ["cookie", "broccoli", nil, "orange", "banana"]
    send monster, {:food, food}
  end
end

# run from terminal:
#   iex
#   c "demo.exs"
#   cookie_monster = spawn_link fn -> CookieMonster.read_cookie_monster_mailbox  end
#   send cookie_monster, {:food, nil}
#   send cookie_monster, {:food, "cookie"}
#   send cookie_monster, {:food, "broccoli"}
#   send cookie_monster, {:garbge, "all kind of crap"}
#   HellOfAlotOfMonsters.release_em_all()