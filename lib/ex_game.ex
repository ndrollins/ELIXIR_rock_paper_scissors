defmodule ExGame do
  def guess do
    random_cpu = Enum.random(0..2)
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))
    count = 0
    user = 0
    cpu = 0

    _game(random_cpu, user_guess, count, user, cpu)

  end

  defp _guess_again(count, user, cpu) do
    random_cpu = Enum.random(0..2)
    user_guess = String.downcase(List.to_string(String.split(IO.gets("Enter rock, paper, or scissors: "), "\n", trim: true)))

    _game(random_cpu, user_guess, count, user, cpu)
  end

  defp _game(0, "paper", count, user, cpu) do
    count = count + 1
    user = user + 1
      IO.puts("CPU has called  rock \n USER wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  
  defp _game(0, "scissors", count, user, cpu) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called  rock \n CPU wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(0, "rock", count, user, cpu) do
      IO.puts("Both called  rock \n TIE")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(1, "rock", count, user, cpu) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called  paper \n CPU wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(1, "scissors", count, user, cpu) do
    count = count + 1
    user = user + 1
      IO.puts("CPU has called  rock \n USER wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(1, "paper", count, user, cpu) do
      IO.puts("CPU has called  paper \n TIE")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(2, "rock", count, user, cpu) do
    count = count + 1
    user = user + 1
      IO.puts("CPU has called  scissors \n USER wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(2, "paper", count, user, cpu) do
    count = count + 1
    cpu = cpu + 1
      IO.puts("CPU has called  scissors \n CPU wins.")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(2, "scissors", count, user, cpu) do
      IO.puts("Both has called  Scissors \n TIE")
    case 3 do
      ^count ->
        winner = if (cpu > user), do: "CPU wins the GAME", else: "USER wins the GAME"
        "Game Over #{winner}"
      _ ->
        _guess_again(count, user, cpu)
    end
  end
  defp _game(_, _, count, user, cpu) do
    error = "ERROR"
    IO.puts("#{error}: Enter a valid choice. Rock, paper, or scissors")
    _again(count, user, cpu)
  end

  defp _again(count, user, cpu) do
    _guess_again(count, user, cpu)
  end
end
