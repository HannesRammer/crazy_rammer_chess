import 'package:flutter/material.dart';
import 'chess_field.dart';
import 'chess_figure.dart';
import 'theme_provider.dart';

class ChessBoard extends StatefulWidget {
  final List<ChessField> chessFields;
  const ChessBoard({Key? key, required this.chessFields}) : super(key: key);

  static int calcPos(int x, int y) {
    return y * 8 + x;
  }

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
  int currentColorIndex = 0; // Track the current color combination

  void _nextColorCombination() {
    setState(() {
      currentColorIndex = (currentColorIndex + 1) % ThemeProvider.rammerColorCombinations.length;
    });
  }

  Map<String, Color> get currentRammerColors => ThemeProvider.rammerColorCombinations[currentColorIndex];

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
          final captured = widget.chessFields[index].figure;
          if (captured != null) {
            if (captured.color == Colors.white) {
              capturedWhite.add(captured);
            } else {
              capturedBlack.add(captured);
            }
          }
          widget.chessFields[index].figure = widget.chessFields[selectedIndex!].figure;
          widget.chessFields[selectedIndex!].figure = null;
          moveHistory.add(
              "${widget.chessFields[selectedIndex!].x},${widget.chessFields[selectedIndex!].y} -> ${field.x},${field.y}");
          selectedIndex = null;
          possibleMoves = [];
          currentTurn = currentTurn == Colors.white ? Colors.black : Colors.white;
        });
      } else {
        // Deselect
        setState(() {
          selectedIndex = null;
          possibleMoves = [];
        });
      }
    }
  }

  List<int> _getPossibleMoveIndices(ChessFigure figure, int x, int y) {
    final moves = figure.getPossibleMoves(x, y, widget.chessFields);
    return moves.expand((list) => list).map((f) => widget.chessFields.indexOf(f)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Navigation Bar with Next Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Rammer Chess",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: _nextColorCombination,
                child: const Text("Next Colors"),
              ),
            ],
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
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: field.color ?? Colors.grey[300],
                        border: Border.all(color: Colors.black26, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                            offset: Offset(2, 2),
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
                                        blurRadius: 16,
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
                                      currentRammerColors[field.rammerField!.special]!,
                                      BlendMode.modulate,
                                    ),
                                    child: Image.asset(
                                      _getBrushTexture(field.rammerField!.special!),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // Add light glow effect
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          center: Alignment.center,
                                          radius: 1.5,
                                          colors: [
                                            currentRammerColors[field.rammerField!.special]!.withOpacity(0.5),
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
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                              child: Image.asset(
                                'images/${field.figure!.type}${field.figure!.color == Colors.white ? 'white' : 'black'}.png',
                                key: ValueKey('${field.figure!.type}_${field.figure!.color}'),
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
