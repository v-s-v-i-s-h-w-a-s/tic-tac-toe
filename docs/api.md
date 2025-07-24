# API Documentation

This document provides detailed information about the Tic-Tac-Toe package API.

## Table of Contents
- [Board Class](#board-class)
- [AIPlayer Class](#aiplayer-class)
- [Utility Functions](#utility-functions)

## Board Class

The `Board` class represents the Tic-Tac-Toe game board and provides methods for game state management.

### Constructor

```python
def __init__(self, size: int = 3)
```

Creates a new game board with the specified size (default 3x3).

**Parameters:**
- `size` (int, optional): The size of the board (default is 3).

**Returns:**
- A new Board instance.

### Methods

#### `make_move`

```python
def make_move(self, row: int, col: int, player: str) -> bool
```

Places a player's symbol at the specified position on the board.

**Parameters:**
- `row` (int): The row index (0-2).
- `col` (int): The column index (0-2).
- `player` (str): The player symbol ('X' or 'O').

**Returns:**
- `bool`: True if the move was successful, False if the position was already taken.

#### `check_winner`

```python
def check_winner(self) -> Optional[str]
```

Checks if there is a winner on the board.

**Returns:**
- `str` or `None`: The symbol of the winning player ('X' or 'O'), or None if there is no winner.

#### `is_full`

```python
def is_full(self) -> bool
```

Checks if the board is full.

**Returns:**
- `bool`: True if the board is full, False otherwise.

#### `get_available_moves`

```python
def get_available_moves(self) -> List[Tuple[int, int]]
```

Gets a list of available positions on the board.

**Returns:**
- `List[Tuple[int, int]]`: A list of tuples representing the available positions.

#### `reset`

```python
def reset(self) -> None
```

Resets the board to its initial state.

**Returns:**
- `None`

## AIPlayer Class

The `AIPlayer` class implements the AI opponent using the minimax algorithm.

### Constructor

```python
def __init__(self, difficulty: str = "hard")
```

Creates a new AI player.

**Parameters:**
- `difficulty` (str, optional): The difficulty level ("easy", "medium", or "hard"). Default is "hard".

**Returns:**
- A new AIPlayer instance.

### Methods

#### `get_best_move`

```python
def get_best_move(self, board: Board, player: str = "O") -> Tuple[int, int]
```

Calculates the best move for the AI player.

**Parameters:**
- `board` (Board): The current game board.
- `player` (str, optional): The AI's symbol ('X' or 'O'). Default is 'O'.

**Returns:**
- `Tuple[int, int]`: The row and column for the best move.

#### `minimax`

```python
def minimax(self, board: Board, depth: int, is_maximizing: bool, 
           alpha: float = float('-inf'), beta: float = float('inf')) -> int
```

Implements the minimax algorithm with alpha-beta pruning.

**Parameters:**
- `board` (Board): The current game board.
- `depth` (int): The current depth in the game tree.
- `is_maximizing` (bool): Whether the current player is maximizing.
- `alpha` (float, optional): The alpha value for alpha-beta pruning.
- `beta` (float, optional): The beta value for alpha-beta pruning.

**Returns:**
- `int`: The score of the board position.

## Utility Functions

### `print_board`

```python
def print_board(board: Board) -> None
```

Prints the current state of the board to the console.

**Parameters:**
- `board` (Board): The game board to print.

**Returns:**
- `None`

### `position_to_coordinates`

```python
def position_to_coordinates(position: int) -> Tuple[int, int]
```

Converts a position number (1-9) to board coordinates.

**Parameters:**
- `position` (int): The position number (1-9).

**Returns:**
- `Tuple[int, int]`: The row and column indices.
