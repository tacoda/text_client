defmodule TextClient.Interact do

  # Moved out to state.ex
  # defstruct(
  #   game_service: nil,
  #   tally:        nil,
  #   guessed:      ""
  # )

  # alias TextClient.State
  alias TextClient.{Player, State}

  def start() do
    Hangman.new_game()
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
end
