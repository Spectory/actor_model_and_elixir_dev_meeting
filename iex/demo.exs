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
    IO.puts "Hey! where is my cookie you bastard?!"
  end
  defp eat_cookie({:food, "cookie"}) do
    IO.puts "Om Num Num Num Num!"
  end
  defp eat_cookie({:food, "broccoli"}) do
    IO.puts "I hate broccoli!"
  end
  defp eat_cookie({:food, somthing}) do
    IO.puts "#{somthing}?? WTF is that?!"
  end
end

# run from terminal:
#   iex
#   c "demo.exs"
#   cookie_monster = spawn_link fn -> CookieMonster.read_cookie_monster_mailbox  end
#   send cookie_monster, {:food, "nil"}
#   send cookie_monster, {:food, "cookie"}
#   send cookie_monster, {:food, "broccoli"}
#   send cookie_monster, {:garbge, "all kind of crap"}