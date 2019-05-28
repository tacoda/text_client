defmodule TextClient.Interact do

  # Moved out to state.ex
  # defstruct(
  #   game_service: nil,
  #   tally:        nil,
  #   guessed:      ""
  # )

  @hangman_server :hangman@CMMC02XT001JG5L

  # alias TextClient.State
  alias TextClient.{Player, State}

  def start() do
    new_game()
    |> setup_state()
    # |> IO.inspect
    |> Player.play()
  end

  defp setup_state(game_service) do
    %State{
      game_service: game_service,
      tally:        Hangman.tally(game_service),
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)
    :rpc.call(@hangman_server,
      Hangman,
      :new_game,
      [])
  end
end
