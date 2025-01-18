# RammerChess - A Unique Chess Experience

## Overview

RammerChess is an innovative chess game that incorporates elements inspired by the famous games "The Crazy Labyrinth" and "Rubik's Cube." The game adds a twist to the traditional chess mechanics, allowing players to move fields and pieces in unique directions, which significantly increases the strategic depth and complexity of the game.

This documentation serves as both a technical explanation of the game's logic and a guide for users on how to play RammerChess. The game has been developed using Flutter with Riverpod for state management, ensuring a responsive and maintainable codebase.

## Installation Instructions

To install and run RammerChess, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone [repository URL]
   ```

2. **Navigate into the project directory**:

   ```bash
   cd crazy_rammer_chess
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```
   Make sure you have an emulator or a connected device available.

## Game Overview and Rules

RammerChess follows the classic rules of chess with additional mechanics involving field manipulation. Here are some key features:

- **Classic Chess Mechanics**: The game follows the standard rules of chess, including movement for rooks, bishops, knights, pawns, the king, and the queen.
- **Rammer Fields**: In addition to classic movement, certain rows and columns are designated as "Rammer Fields." Players can manipulate these fields to either rotate or slide the chessboard elements, adding a new layer of strategy.
- **Unique Field Movements**: Players may be able to move rows or columns in different directions inspired by the mechanics of a Rubik's Cube or the Crazy Labyrinth.

## Gameplay Instructions

### Game States

The game has two main states for a player's turn:

1. **Selecting Start (GameState.SelectingStart)**: In this state, players choose the piece they want to move. If the piece belongs to the current player (based on color), possible moves are highlighted.

2. **Selecting Destination (GameState.SelectingDestination)**: After selecting a piece, players must choose the target destination, which is indicated by green (valid moves) and red (possible captures).

### Moving Pieces

- **Selecting a Piece**: Tap on a piece to select it. Only pieces that belong to the player whose turn it is can be selected.
- **Selecting a Target**: Tap on one of the highlighted target cells to move the selected piece there.
- **Rammer Fields**: If a piece lands on a Rammer Field, additional moves may be initiated to shift rows or rotate sections of the board. These rammer actions can influence the entire board layout.

## Code Explanation

The codebase leverages Flutter with the Riverpod state management system to create a modular and scalable architecture.

### State Management

- **Riverpod Providers**: The game state is managed using Riverpod providers, ensuring that the application is reactive and easily testable. The key providers used are:
  - `gameStateProvider`: Tracks the current state of the game (Selecting Start or Selecting Destination).
  - `colorToMoveProvider`: Manages which player's turn it is (black or white).
  - `fromChessFieldPositionProvider`: Stores the position of the piece selected to be moved.
  - `chessBoardProvider`: Holds the current state of the chessboard.

### Class Overview

- **ChessBoardNotifier**: This is the main class responsible for managing the board state. It includes methods for initializing the board, making moves, and resetting markers.

  - **initBoard()**: Initializes the chessboard with all figures in their starting positions.
  - **makeMove(fromPos, toPos, playerType)**: Handles piece movement from one position to another and updates the state accordingly.
  - **resetMarkers()**: Clears any move markers from the board.

- **Board Widget**: This is the primary visual representation of the chessboard. It is a consumer widget that listens to the Riverpod providers and rebuilds when state changes.
  - **handleFieldTap()**: Handles the logic when a player taps on a chess field, either selecting a piece or moving it.

### Rammer Field Mechanics

- **Rammer Directions and Colors**: Certain fields have special attributes that allow players to rotate or shift rows and columns.

  - Directions such as `up`, `right`, `down`, `left`, `clockwise`, and `anticlockwise` are applied to rammer fields, affecting how they manipulate the board.
  - The `rammerColors` map assigns unique colors to each of these directions for easy identification.

- **RammerField Widget**: This widget is used to visually represent rammer fields on the board and execute their special behaviors during gameplay.

## Future Improvements

1. **AI Player**: Implement an AI player to allow for single-player mode.
2. **Additional Game Modes**: Introduce different modes where the rules for Rammer Fields can be modified.
3. **Animations**: Add animations when Rammer Fields are moved to improve user experience.

## Troubleshooting

- **Issue**: The game doesn't start after tapping on "Run."
  - **Solution**: Make sure all dependencies are installed correctly with `flutter pub get`.
- **Issue**: Piece selection is not working.
  - **Solution**: Ensure you are selecting pieces that match the color of the current player (`colorToMoveProvider` state).

## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
