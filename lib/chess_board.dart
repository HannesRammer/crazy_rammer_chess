import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chess_field.dart';
import 'chess_figure.dart';
import 'theme_provider.dart';
import 'rammer_moves.dart';
import 'chess_game.dart';

class ChessBoard extends StatefulWidget {
  final List<ChessField> chessFields;
  final void Function()? onNextColors;
  const ChessBoard({Key? key, required this.chessFields, this.onNextColors}) : super(key: key);

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  int? selectedIndex;
  List<int> possibleMoves = [];
  Color currentTurn = Colors.white;
  List<String> moveHistory = [];
  List<ChessFigure> capturedWhite = [];
  List<ChessFigure> capturedBlack = [];
  bool showMoveHistory = false; // NEW

  Duration whiteTime = const Duration(minutes: 10);
  Duration blackTime = const Duration(minutes: 10);
  Timer? timer;

  // Ensure the default theme is reset when a new game starts
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.resetToDefaultTheme();
    });
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (currentTurn == Colors.white) {
          whiteTime -= const Duration(seconds: 1);
        } else {
          blackTime -= const Duration(seconds: 1);
        }
      });
    });
  }

  void _promotePawn(ChessField field, String newType) {
    setState(() {
      field.figure = ChessFigure(
        key: UniqueKey(),
        type: newType,
        color: field.figure!.color,
        onTap: field.figure!.onTap,
      );
    });
  }

  void _checkForPawnPromotion(ChessField field) {
    if (field.figure != null && field.figure!.type == 'pawn') {
      if ((field.figure!.color == Colors.white && field.y == 0) ||
          (field.figure!.color == Colors.black && field.y == 7)) {
        // Show promotion dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Promote Pawn'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['queen', 'rook', 'bishop', 'knight'].map((type) {
                  return ListTile(
                    title: Text(type[0].toUpperCase() + type.substring(1)),
                    onTap: () {
                      Navigator.of(context).pop();
                      _promotePawn(field, type);
                    },
                  );
                }).toList(),
              ),
            );
          },
        );
      }
    }
  }

  void _onFieldTap(int index) {
    final field = widget.chessFields[index];
    final figure = field.figure;
    if (selectedIndex == null) {
      // Select a piece if it exists
      if (figure != null && figure.color == currentTurn) {
        setState(() {
          selectedIndex = index;
          possibleMoves = _getPossibleMoveIndices(figure, field.x, field.y);
        });
      }
    } else {
      // If tapping a highlighted move, move the piece
      if (possibleMoves.contains(index)) {
        setState(() {
          final fromField = widget.chessFields[selectedIndex!];
          final toField = widget.chessFields[index];
          // Move the piece
          toField.figure = fromField.figure;
          fromField.figure = null;
          moveHistory.add("${fromField.x},${fromField.y} -> ${toField.x},${toField.y}");
          selectedIndex = null;
          possibleMoves = [];
          currentTurn = currentTurn == Colors.white ? Colors.black : Colors.white;
        });
        // Check for pawn promotion
        _checkForPawnPromotion(widget.chessFields[index]);

        // After moving, check for rammer field and trigger rammer move if present
        final toField = widget.chessFields[index];
        final rammer = toField.rammerField;
        if (rammer != null && rammer.special != null) {
          final rammerMoves = RammerMoves();
          final x = toField.x;
          final y = toField.y;
          switch (rammer.special) {
            case 'clockwise':
              rammerMoves.moveClockwise(x, y, widget.chessFields, setState);
              break;
            case 'anticlockwise':
              rammerMoves.moveAntiClockwise(x, y, widget.chessFields, setState);
              break;
            case 'up':
              rammerMoves.moveUp(x, widget.chessFields, setState);
              break;
            case 'down':
              rammerMoves.moveDown(x, widget.chessFields, setState);
              break;
            case 'left':
              rammerMoves.moveLeft(y, widget.chessFields, setState);
              break;
            case 'right':
              rammerMoves.moveRight(y, widget.chessFields, setState);
              break;
          }
        }
      } else {
        // Deselect
        setState(() {
          selectedIndex = null;
          possibleMoves = [];
        });
      }
    }
    // Check for game over conditions
    _checkGameOver();
  }

  List<int> _getPossibleMoveIndices(ChessFigure figure, int x, int y) {
    final moves = figure.getPossibleMoves(x, y, widget.chessFields);
    return moves.expand((list) => list).map((f) => widget.chessFields.indexOf(f)).toList();
  }

  void _checkGameOver() {
    final game = Provider.of<ChessGame>(context, listen: false);
    if (game.isCheckmate(currentTurn)) {
      _showGameOverOverlay('${currentTurn == Colors.white ? 'Black' : 'White'} wins by checkmate!');
    } else if (game.isStalemate(currentTurn)) {
      _showGameOverOverlay('The game is a draw by stalemate!');
    } else if (game.isKingInCheck(currentTurn)) {
      _showGameOverOverlay(
          '${currentTurn == Colors.white ? 'Black' : 'White'} wins! The ${currentTurn == Colors.white ? 'White' : 'Black'} king was captured.');
      return;
    }
  }

  void _showGameOverOverlay(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _restartGame();
                        },
                        child: const Text('Restart Game'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      final game = Provider.of<ChessGame>(context, listen: false);
      game.resetMarkers();
      game.board.clear();
      game.board.addAll(ChessGame.newGame().board);
      currentTurn = Colors.white;
      selectedIndex = null;
      possibleMoves = [];
      moveHistory.clear();
      capturedWhite.clear();
      capturedBlack.clear();
      whiteTime = const Duration(minutes: 10);
      blackTime = const Duration(minutes: 10);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to ThemeProvider for theme changes
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final rammerColors = themeProvider.currentRammerColors;

    return Column(
      children: [
        // a sleek but stylish game info bar with all the needed infos for a chess game
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Current turn with colored dot
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: currentTurn,
                    radius: 8,
                  ),
                  const SizedBox(width: 8),
                  Text('Turn: ${currentTurn == Colors.white ? 'White' : 'Black'}'),
                ],
              ),
              // Move history expandable
              GestureDetector(
                onTap: () => setState(() => showMoveHistory = !showMoveHistory),
                child: Row(
                  children: [
                    Text('Moves: ${moveHistory.length}'),
                    Icon(showMoveHistory ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
              ),
              // Captured pieces stacked
              Row(
                children: [
                  ...capturedWhite.map((f) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Image.asset(
                          'images/${f.type}white.png',
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                      )),
                  const SizedBox(width: 4),
                  ...capturedBlack.map((f) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Image.asset(
                          'images/${f.type}black.png',
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                      )),
                ],
              ),
              // Timer display
              Row(
                children: [
                  Text(
                    '${whiteTime.inMinutes}:${(whiteTime.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${blackTime.inMinutes}:${(blackTime.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Move history panel
        if (showMoveHistory)
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            child: ListView.builder(
              itemCount: moveHistory.length,
              itemBuilder: (context, i) => Text(moveHistory[i]),
            ),
          ),

        // Chessboard
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                ),
                itemCount: widget.chessFields.length,
                itemBuilder: (context, index) {
                  final field = widget.chessFields[index];
                  final isSelected = selectedIndex == index;
                  final isMove = possibleMoves.contains(index);
                  return GestureDetector(
                    onTap: () => _onFieldTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 4200), // Slower animation for rammer moves
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.withOpacity(0.5)
                            : isMove
                                ? Colors.green.withOpacity(0.3)
                                : field.color ?? Colors.grey[300],
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue
                              : isMove
                                  ? Colors.green
                                  : Colors.black26,
                          width: 1.5,
                        ),
                        boxShadow: [
                          if (isSelected || isMove)
                            BoxShadow(
                              color: isSelected ? Colors.blue.withOpacity(0.6) : Colors.green.withOpacity(0.6),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Inner glow effect for isSelected, isMove, and attackable fields
                          if (isSelected ||
                              isMove ||
                              (possibleMoves.contains(index) && widget.chessFields[index].figure != null))
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    if (isSelected)
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.9),
                                        blurRadius: 2,
                                        spreadRadius: -2,
                                        offset: Offset(0, 0),
                                      ),
                                    if (isMove)
                                      BoxShadow(
                                        color: Colors.greenAccent.withOpacity(0.9),
                                        blurRadius: 12,
                                        spreadRadius: -2,
                                        offset: Offset(0, 0),
                                      ),
                                    if (possibleMoves.contains(index) && widget.chessFields[index].figure != null)
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.9),
                                        blurRadius: 12,
                                        spreadRadius: -2,
                                        offset: Offset(0, 0),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          // Rammer color with paintbrush stroke effect
                          if (field.rammerField != null && field.rammerField!.special != null)
                            Positioned.fill(
                              child: Stack(
                                children: [
                                  // Apply Rammer color tint
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      rammerColors[field.rammerField!.special]!,
                                      BlendMode.modulate,
                                    ),
                                    child: Image.asset(
                                      _getBrushTexture(field.rammerField!.special!),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // Add light glow effect
                                  Positioned.fill(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          center: Alignment.center,
                                          radius: 1.5,
                                          colors: [
                                            rammerColors[field.rammerField!.special]!.withOpacity(0.5),
                                            Colors.transparent,
                                          ],
                                          stops: [0.0, 1.0],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          // Chess piece image
                          if (field.figure != null)
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 4200), // Slower animation for rammer moves
                              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                              child: Image.asset(
                                'images/${field.figure!.type}${field.figure!.color == Colors.white ? 'white' : 'black'}.png',
                                // Add a unique key that changes on every move, e.g.:
                                key: ValueKey('${field.figure!.type}_${field.figure!.color}_${moveHistory.length}'),
                                width: 36,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String _getBrushTexture(String special) {
  return 'images/strokes/brush_$special.png';
}
