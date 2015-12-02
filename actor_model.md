The Actor Model
===============

Lets Have a look at a simple bank account, say in OOP (but it doesn't really matter to us for this debate).

```ruby
  class BankAccount

    def add(num)
      @avilable_funds =+ num
    end
    
    def withdraw(sum)
      add(-sum) if can_withdrow
    end

    private

    def can_withdrow(sum)
      # check accounts limits & stuff
    end
  end
```

Its easy to see that if we have 2 threads performing a withdraw, the bank account state is in danger.

Mutex (Mutual exclusion)
------------------------
A mutex is a program object that allows multiple program threads to share the same resource but not simultaneously. Mutex are available at hardware level.

for example, we want only one thread to have access to
 - a file (OS level)
 - an object (software level)
 - register / HD / network port (Hardware level)

Programing with low level mutex objects is hard. There are higher level objects such as locks, semaphores and such, but its still can be pretty complex to deal with.

The Actor model is a design pattern that help us simplify such issues. Actors are very similar to objects at OO (Everything is an actor), but differs in that OO software is typically executed sequentially (by using getters / setters), while the Actor model is inherently concurrent.

 - Actors are interact via message passing
 - An actor can act at any time, you can send him a request, but the actual action time is not guaranteed.
 - Sometimes actors are referred as 'live objects' - an object that has its own thread.

What is Message passing?
------------------------
Message passing is based on the idea that objects *share nothing* - Each object encapsulate it own data.

Each objects has a mail box - a queue that receive messages from the world.

So, if our back-account from earlier is an actor, running on its own thread, there is no way for 2 withdraws to occur simultaneously 

Erlang - Takes it up to 11!
----------------------------
Erlang takes the the Actor model to the extreme. Basically Erlang is saying "If we Actors share nothing, why should they share the same machine?".

 - Processes are light weight threads.
 - Processes can run on different systems - called Nodes.
 - Processes interact via message passing
 - A single machine Can manage many processes(current recored is 20M).
 - Very mature & stable language (first appeared at 1986)

Elixir
------
 - Runs under Erlang VM (compiles to byte-code)
 - Easier syntax.
 - Can mix with Erlang code.
 - Pattern matching.
 - Very young (2012).

example: 
```elixir
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
```

Phoenix:
--------
A web framework that designed for speed and maintainability, based on Elixir.

Vox Load Test
-------------
The core concept - Simulate multiple users (30M), the using Vox system:
 - Each user connects Vox system via API
 - Once connected, all users interact with the system in bulk actions.
 - for each user, calculate the system response time, error & other stats.

Well this fits Elixir like a glove. So nice we can create an app with Phoenix to wrap it all.

System flow:
 - System main process is called 'master'.
 - Master spawns a 'manager' process at each connected VM (Node).
 - Each Node spawn its own processes, each on represents a user, 50K in total
 - Master send a message to all mangers, telling them to preform a bulk action
 - Each manager sends actions messages to all his 'user' processes
 - Users do the action & sends master a message when done.
 - Master process each user report & store it in db.

All we need in order to scale up is to add more Node VM's.




