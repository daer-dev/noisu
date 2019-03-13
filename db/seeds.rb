# frozen_string_literal: true

# Creates the demo board.
Board.find_or_create_by(
  name:        "Demo",
  description: "Demo board for testing purposes."
)
