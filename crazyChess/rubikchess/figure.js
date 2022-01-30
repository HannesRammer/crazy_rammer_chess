export class Figure {
    className;
    type;
    color;
    value = 0;
    calculated = false;
    hasMoved = false;

    constructor(type, color) {
        this.className = `${type}_${color}`;
        this.type = type;
        this.color = color;
        let multi = 1;
        if (color === "black") {
            multi = multi * -1;
        }
        if (type === "rook") {
            this.value = multi * 50;
        } else if (type === "knight") {
            this.value = multi * 30;
        } else if (type === "bishop") {
            this.value = multi * 30;
        } else if (type === "queen") {
            this.value = multi * 90;
        } else if (type === "king") {
            this.value = multi * 900;
        } else if (type === "pawn") {
            this.value = multi * 10;
        }
    }

    getPossibleMoves(x, y) {
        let possibleMoves = [];
        if (this.type === "rook") {
            possibleMoves = Figure.getRookMoves(this, x, y);
        } else if (this.type === "knight") {
            possibleMoves = Figure.getKnightMoves(this, x, y);
        } else if (this.type === "bishop") {
            possibleMoves = Figure.getBishopMoves(this, x, y);
        } else if (this.type === "queen") {
            possibleMoves = Figure.getQueenMoves(this, x, y);
        } else if (this.type === "king") {
            possibleMoves = Figure.getKingMoves(this, x, y);
        } else if (this.type === "pawn") {
            possibleMoves = Figure.getPawnMoves(this, x, y);
        }
        return possibleMoves;
    }

    static getRookMoves(rook, x, y, chessBoard) {
        let possibleMoves = [];
        let possibleAttacks = [];

        for (let i = y + 1; i < 8; i++) {//below rook

            let chessField = chessBoard.getChessField(chessBoard.calcPos(x, i));
            let chessFieldFigure = chessField.figure;

            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== rook.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }
        for (let i = y - 1; i >= 0; i--) {//above rook

            let chessField = chessBoard.getChessField(chessBoard.calcPos(x, i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== rook.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        for (let i = x - 1; i >= 0; i--) {//left of rook

            let chessField = chessBoard.getChessField(chessBoard.calcPos(i, y));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== rook.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        for (let i = x + 1; i < 8; i++) {//left of rook

            let chessField = chessBoard.getChessField(chessBoard.calcPos(i, y));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== rook.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }
        return [possibleMoves, possibleAttacks];

    }

    static getBishopMoves(bishop, x, y, chessBoard) {
        let possibleMoves = [];
        let possibleAttacks = [];

        let distance = 0;
        let top = y;
        let bottom = 7 - y;
        let left = x;
        let right = 7 - x;

        //below right bishop
        if (right <= bottom) {
            distance = right;
        } else {
            distance = bottom;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x + i, y + i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== bishop.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        //below left bishop
        if (left <= bottom) {
            distance = left;
        } else {
            distance = bottom;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x - i, y + i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== bishop.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }


        //top left bishop
        if (left <= top) {
            distance = left;
        } else {
            distance = top;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x - i, y - i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== bishop.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        //top right bishop
        if (right <= top) {
            distance = right;
        } else {
            distance = top;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x + i, y - i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== bishop.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }


        return [possibleMoves, possibleAttacks];

    }


    static getQueenMoves(queen, x, y, chessBoard) {
        let possibleMoves = [];
        let possibleAttacks = [];

        //bishop
        let distance = 0;
        let top = y;
        let bottom = 7 - y;
        let left = x;
        let right = 7 - x;

        //below right queen
        if (right <= bottom) {
            distance = right;
        } else {
            distance = bottom;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x + i, y + i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        //below left queen
        if (left <= bottom) {
            distance = left;
        } else {
            distance = bottom;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x - i, y + i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }


        //top left queen
        if (left <= top) {
            distance = left;
        } else {
            distance = top;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x - i, y - i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        //top right queen
        if (right <= top) {
            distance = right;
        } else {
            distance = top;
        }

        for (let i = 1; i <= distance; i++) {
            let chessField = chessBoard.getChessField(chessBoard.calcPos(x + i, y - i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

//ROCK
        for (let i = y + 1; i < 8; i++) {//below queen

            let chessField = chessBoard.getChessField(chessBoard.calcPos(x, i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }
        for (let i = y - 1; i >= 0; i--) {//above queen

            let chessField = chessBoard.getChessField(chessBoard.calcPos(x, i));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        for (let i = x - 1; i >= 0; i--) {//left of queen

            let chessField = chessBoard.getChessField(chessBoard.calcPos(i, y));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }

        for (let i = x + 1; i < 8; i++) {//left of queen

            let chessField = chessBoard.getChessField(chessBoard.calcPos(i, y));
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;

            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }

            if (isEmpty) {
                possibleMoves.push(chessField);
            } else {
                let isEnemy = chessFieldFigure.color !== queen.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
                break;
            }
        }
        return [possibleMoves, possibleAttacks];

    }

    static getKingMoves(king, x, y, chessBoard) {
        // y = switchY(y);
        let possibleMoves = [];
        let possibleAttacks = [];
        let kingMoves = [[x, y - 1], [x + 1, y - 1], [x + 1, y], [x + 1, y + 1], [x, y + 1], [x - 1, y + 1], [x - 1, y], [x - 1, y - 1]];
// debugger;

        kingMoves.forEach((position) => {
            if ((position[0] >= 0 && position[0] < 8) && (position[1] >= 0 && position[1] < 8)) {

                let chessField = chessBoard.getChessField(chessBoard.calcPos(position[0], position[1]));
                let chessFieldFigure = chessField.figure;
                let isEmpty = false;

                if (chessFieldFigure === undefined || chessFieldFigure === null) {
                    isEmpty = true;
                }

                if (isEmpty) {
                    possibleMoves.push(chessField);
                } else {
                    let isEnemy = chessFieldFigure.color !== king.color;
                    if (isEnemy) {
                        possibleAttacks.push(chessField);
                    }
                }
            }
        });
        return [possibleMoves, possibleAttacks];

    }

    static getKnightMoves(knight, x, y, chessBoard) {
        // y = switchY(y);
        let possibleMoves = [];
        let possibleAttacks = [];
        let knightMoves = [[x - 1, y - 2], [x - 2, y - 1], [x - 2, y + 1], [x - 1, y + 2], [x + 1, y + 2], [x + 2, y + 1], [x + 2, y - 1], [x + 1, y - 2]];
// debugger;

        knightMoves.forEach((position) => {
            if ((position[0] >= 0 && position[0] < 8) && (position[1] >= 0 && position[1] < 8)) {
                let chessField = chessBoard.getChessField(chessBoard.calcPos(position[0], position[1]));
                let chessFieldFigure = chessField.figure;
                let isEmpty = false;

                if (chessFieldFigure === undefined || chessFieldFigure === null) {
                    isEmpty = true;
                }

                if (isEmpty) {
                    possibleMoves.push(chessField);
                } else {
                    let isEnemy = chessFieldFigure.color !== knight.color;
                    if (isEnemy) {
                        possibleAttacks.push(chessField);
                    }
                }
            }

        });
        return [possibleMoves, possibleAttacks];

    }


    static getPawnMoves(pawn, x, y, chessBoard) {
        let possibleMoves = [];
        let possibleAttacks = [];
//move one field
        let chessField;
        if (pawn.color === "white") {
            chessField = chessBoard.getChessField(chessBoard.calcPos(x, y - 1));
        } else {
            chessField = chessBoard.getChessField(chessBoard.calcPos(x, y + 1));
        }
        if (chessField !== undefined) {//no field for move one found;
            let chessFieldFigure = chessField.figure;
            let isEmpty = false;
            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            } else {
                isEmpty = false;
            }
            if (isEmpty) {
                possibleMoves.push(chessField);
            }
//move two field
            if (!pawn.hasMoved) {
                let chessField1;
                let chessField2;
                if (pawn.color === "white") {
                    chessField1 = chessBoard.getChessField(chessBoard.calcPos(x, y - 1));
                    chessField2 = chessBoard.getChessField(chessBoard.calcPos(x, y - 2));
                } else {
                    chessField1 = chessBoard.getChessField(chessBoard.calcPos(x, y + 1));
                    chessField2 = chessBoard.getChessField(chessBoard.calcPos(x, y + 2));
                }
                let chessFieldFigure1 = chessField1.figure;
                let chessFieldFigure2 = chessField2.figure;
                let isEmpty1 = chessFieldFigure1 === undefined;
                let isEmpty2 = chessFieldFigure2 === undefined;
                if (isEmpty1 && isEmpty2) {
                    possibleMoves.push(chessField2);
                }
            }
//attack right
            if (pawn.color === "white") {
                chessField = chessBoard.getChessField(chessBoard.calcPos(x + 1, y - 1));
            } else {
                chessField = chessBoard.getChessField(chessBoard.calcPos(x + 1, y + 1));
            }
            chessFieldFigure = chessField.figure;
            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            } else {
                isEmpty = false;
            }
            if (!isEmpty) {
                let isEnemy = chessFieldFigure.color !== pawn.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
            }
//attack left
            isEmpty = false;
            if (pawn.color === "white") {
                chessField = chessBoard.getChessField(chessBoard.calcPos(x - 1, y - 1));
            } else {
                chessField = chessBoard.getChessField(chessBoard.calcPos(x - 1, y + 1));
            }
            chessFieldFigure = chessField.figure;
            if (chessFieldFigure === undefined || chessFieldFigure === null) {
                isEmpty = true;
            }
            if (!isEmpty) {
                let isEnemy = chessFieldFigure.color !== pawn.color;
                if (isEnemy) {
                    possibleAttacks.push(chessField);
                }
            }
        }
        return [possibleMoves, possibleAttacks];
    }


    toString() {
        return `type:${this.type} color:${this.color}`;
    }
}
