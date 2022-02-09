defmodule ExGame do
  def guess do
    random_cpu = Enum.random(0..2)
    #random_cpu = 1
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))
    count = 0
    user = 1
    cpu = 1
    ties = 1
    #lack_of_luck = if ( rem(Enum.random(1..9), 3) == 0), do: ties = 3, else: ties = ties
    c_score = 0
    u_score = 0

    _game(random_cpu, user_guess, count, user, cpu, ties, c_score, u_score)

  end

  defp _guess_again(count, user, cpu, ties, c_score, u_score) do
    random_cpu = Enum.random(0..2)
    #random_cpu = 1
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))

    _game(random_cpu, user_guess, count, user, cpu, ties, c_score, u_score)
  end

  defp _cpu_retryR(count, user, cpu, ties, c_score, u_score) do
    random_cpu = 0
    user_guess = "scissors"

    _game(random_cpu, user_guess, count, user, cpu, ties, c_score, u_score)
  end

  defp _cpu_retryP(count, user, cpu, ties, c_score, u_score) do
    random_cpu = 1
    user_guess = "rock"

    _game(random_cpu, user_guess, count, user, cpu, ties, c_score, u_score)
  end

  defp _cpu_retryS(count, user, cpu, ties, c_score, u_score) do
    random_cpu = 2
    user_guess = "paper"
    
    _game(random_cpu, user_guess, count, user, cpu, ties, c_score, u_score)
  end

  defp _game(0, "paper", count, user, cpu, ties, c_score, u_score) do
    count = count + 1
    user = user + 1
    u_score = u_score + 1
      IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  rock \n USER wins.")
    case 3 do
      ^user ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end
  
  defp _game(0, "scissors", count, user, cpu, ties, c_score, u_score) do
    count = count + 1
    cpu = cpu + 1
    c_score = c_score + 1
      IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  rock \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end

  defp _game(0, "rock", count, user, cpu, ties, c_score, u_score) do
    ties = ties + 1
    case ties do
      3 ->
        #IO.puts("TIE switch")
        _cpu_retryP(count, user, cpu, ties, c_score, u_score)
        
      5 ->
        #IO.puts("TIE switch")
        _cpu_retryP(count, user, cpu, ties, c_score, u_score)
        
      _ ->
      IO.puts("Both has called rock \n TIE")
      _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end

  defp _game(1, "rock", count, user, cpu, ties, c_score, u_score) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called paper \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end
  
  defp _game(1, "scissors", count, user, cpu, ties, c_score, u_score) do
    count = count + 1
    {{_, _, _}, {_, _, seconds}} = :calendar.universal_time()
    seconds = :crypto.hash(:sha256, to_string(seconds))
    <<secs, _tail::binary>> = seconds
    #secs = 3
    if rem(secs, 2) == 1 do
      cpu = cpu + 1
      c_score = c_score + 1
      IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called rock \n CPU wins.")
      case 3 do
        ^cpu -> 
          winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
          "Game Over #{winner}" 
        ^count ->
          winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
          "Game Over #{winner}" 
        _ ->
          _guess_again(count, user, cpu, ties, c_score, u_score)
      end
    else
      user = user + 1
      u_score = u_score + 1
        IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called paper \n USER wins.")
      case 3 do
        ^user ->
          winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
          "Game Over #{winner}"
        ^count ->
          winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
          "Game Over #{winner}"
        _ ->
          _guess_again(count, user, cpu, ties, c_score, u_score)
      end
    end
  end
  
  defp _game(1, "paper", count, user, cpu, ties, c_score, u_score) do
    ties = ties + 1
    case ties do
      #3 ->
        #IO.puts("TIE switch")
        #_cpu_retryS(count, user, cpu, ties, lack_of_luck)

      4 ->
        #IO.puts("TIE switch")
        _cpu_retryS(count, user, cpu, ties, c_score, u_score)
        
      _ ->
      IO.puts("Both has called paper \n TIE")
      _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end
  
  defp _game(2, "rock", count, user, cpu, ties, c_score, u_score) do
    count = count + 1

    #case 2 do
      #^count ->
        #_cpu_wins(count, user, cpu)
    #end
    user = user + 1
    u_score = u_score + 1
    case 3 do
      ^user ->
        IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  scissors \n USER wins.")
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        user = user - 1
        u_score = u_score + 1
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  paper \n CPU wins.")
        "Game Over #{winner}"
      _ ->
        IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  scissors \n USER wins.")
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end

  defp _game(2, "paper", count, user, cpu, ties, c_score, u_score) do
    count = count + 1
    cpu = cpu + 1
    c_score = c_score + 1
      IO.puts("USER: #{u_score} \n CPU: #{c_score} \n CPU has called  scissors \n CPU wins.")
    case 3 do
      ^cpu ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end

  defp _game(2, "scissors", count, user, cpu, ties, c_score, u_score) do
    ties = ties + 1
    case ties do
      2 ->
        #IO.puts("TIE switch")
        _cpu_retryR(count, user, cpu, ties, c_score, u_score)
      5 ->
        #IO.puts("TIE switch")
        _cpu_retryR(count, user, cpu, ties, c_score, u_score)
      6 ->
        #IO.puts("TIE switch")
        _cpu_retryR(count, user, cpu, ties, c_score, u_score)
      _ ->
        IO.puts("Both has called  Scissors \n TIE")
        _guess_again(count, user, cpu, ties, c_score, u_score)
    end
  end

  defp _game(_, _, count, user, cpu, ties, c_score, u_score) do
    error = "ERROR"
    IO.puts("#{error}: Enter a valid choice. Rock, paper, or scissors")
    _again(count, user, cpu, ties, c_score, u_score)
  end

  defp _again(count, user, cpu, ties, c_score, u_score) do
    _guess_again(count, user, cpu, ties, c_score, u_score)
  end
end
