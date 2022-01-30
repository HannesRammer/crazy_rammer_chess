export class ChessField {

    x;
    y;
    xyPosition;
    chessPosition;
    color;
    figure;
    rubikField;
    marker;

    constructor(x, y, xyPosition, chessPosition, color, figure, rubikField, marker) {
        this.id = `c_${x}${y}`;
        this.x = x;
        this.y = y;
        this.xyPosition = xyPosition;
        this.chessPosition = chessPosition;
        this.color = color;
        this.figure = figure;
        this.rubikField = rubikField;
        this.marker = marker;
    }

    toString() {
        return `xy:${this.xyPosition} color:${this.color} marker:${this.marker} 
                 |----figure:${this.rubikField} 
                 |----rubikField:${this.rubikField.toString()} `;
    }
}
