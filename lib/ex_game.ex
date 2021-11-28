defmodule ExGame do
  def guess do
    random_cpu = Enum.random(0..2)
    #random_cpu = 0
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))
    count = 0
    user = 1
    cpu = 1
    ties = 1

    _game(random_cpu, user_guess, count, user, cpu, ties)

  end

  defp _guess_again(count, user, cpu, ties) do
    random_cpu = Enum.random(0..2)
    #random_cpu = 0
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))

    _game(random_cpu, user_guess, count, user, cpu, ties)
  end

  defp _cpu_retryR(count, user, cpu, ties) do
    random_cpu = 0
    user_guess = "scissors"

    _game(random_cpu, user_guess, count, user, cpu, ties)
  end

  defp _cpu_retryP(count, user, cpu, ties) do
    random_cpu = 1
    user_guess = "rock"

    _game(random_cpu, user_guess, count, user, cpu, ties)
  end

  defp _cpu_retryS(count, user, cpu, ties) do
    random_cpu = 2
    user_guess = "paper"
    
    _game(random_cpu, user_guess, count, user, cpu, ties)
  end

  defp _game(0, "paper", count, user, cpu, ties) do
    count = count + 1
    user = user + 1
      IO.puts("CPU has called  rock \n USER wins.")
    case 3 do
      ^user ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties)
    end
  end
  
  defp _game(0, "scissors", count, user, cpu, ties) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called  rock \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties)
    end
  end

  defp _game(0, "rock", count, user, cpu, ties) do
    ties = ties + 1
    case 3 do
      ^ties ->
        #IO.puts("TIE switch")
        _cpu_retryP(count, user, cpu, ties)
        
      _ ->
      IO.puts("Both has called rock \n TIE")
      _guess_again(count, user, cpu, ties)
    end
  end

  defp _game(1, "rock", count, user, cpu, ties) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called paper \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties)
    end
  end
  
  defp _game(1, "scissors", count, user, cpu, ties) do
    count = count + 1
    user = user + 1
      IO.puts("CPU has called paper \n USER wins.")
    case 3 do
      ^user ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties)
    end
  end
  
  defp _game(1, "paper", count, user, cpu, ties) do
    ties = ties + 1
    case 3 do
      ^ties ->
        #IO.puts("TIE switch")
        _cpu_retryS(count, user, cpu, ties)
        
      _ ->
      IO.puts("Both has called paper \n TIE")
      _guess_again(count, user, cpu, ties)
    end
  end
  
  defp _game(2, "rock", count, user, cpu, ties) do
    count = count + 1

    #case 2 do
      #^count ->
        #_cpu_wins(count, user, cpu)
    #end
    user = user + 1
    case 3 do
      ^user ->
        IO.puts("CPU has called  scissors \n USER wins.")
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        user = user - 1
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        IO.puts("CPU has called  paper \n CPU wins.")
        "Game Over #{winner}"
      _ ->
        IO.puts("CPU has called  scissors \n USER wins.")
        _guess_again(count, user, cpu, ties)
    end
  end

  defp _game(2, "paper", count, user, cpu, ties) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called  scissors \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties)
    end
  end

  defp _game(2, "scissors", count, user, cpu, ties) do
    ties = ties + 1
    case 3 do
      ^ties ->
        #IO.puts("TIE switch")
        _cpu_retryR(count, user, cpu, ties)
      _ ->
        IO.puts("Both has called  Scissors \n TIE")
        _guess_again(count, user, cpu, ties)
    end
  end

  defp _game(_, _, count, user, cpu, ties) do
    error = "ERROR"
    IO.puts("#{error}: Enter a valid choice. Rock, paper, or scissors")
    _again(count, user, cpu, ties)
  end

  defp _again(count, user, cpu, ties) do
    _guess_again(count, user, cpu, ties)
  end

  defp _cpu_win(count, user, cpu, ties) do
    "CPU is a CHEATER!"
  end
end
