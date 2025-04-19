export class ChessBoard {
    chessFields = [];
    colorToMove = "white";

    constructor(chessFields) {
        this.chessFields = chessFields;
    }

    getPossibleMoves() {
        let possibleMoves = [];
        let pMap = {};
        for (let x = 0; x < 8; x++) {
            for (let y = 0; y < 8; y++) {
                let pos = ChessBoard.calcPos(x, y);
                let figure = this.chessFields[pos].figure;
                if (figure !== undefined) {
                    possibleMoves = figure.getPossibleMoves(x, y);
                    pMap[`${x}_${y}`] = possibleMoves;
                }
            }
        }
        //return possibleMoves;
        return pMap;
    }

    removeMoves() {
        this.chessFields.forEach(chessField => {
            chessField.marker = null;
        })
    }

    getChessField(pos) {
        return this.chessFields[pos];
    }

    static calcPos(x, y) {
        return (y * 8) + (x + 1) - 1;
    }


    evaluateBoard () {
        let totalEvaluation = 0;
        let figCount = 0;
        for (let x = 0; x < 8; x++) {
            for (let y = 0; y < 8; y++) {
                let pos = ChessBoard.calcPos(x, y);
                let figure = this.chessFields[pos].figure;

                if (figure !== undefined && figure !== null) {
                    figCount++;
                    let value = figure.value;
                    totalEvaluation = totalEvaluation + value;
                }

            }
        }
        console.log(`totalEvaluation ${totalEvaluation} figCount ${figCount}`);
        return totalEvaluation;
    }

}
