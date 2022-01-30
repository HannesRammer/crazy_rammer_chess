export class RubikField {
    x;
    y;
    special;
    color;

    constructor(x, y, special) {
        this.x = x;
        this.y = y;
        this.special = special;
    }

    toString() {
        return `xy:${this.x}${this.y} special:${this.special}`;
    }
}
