export class Idol {
    constructor(name: string = null, reason: string = null) {
        this._name = name;
        this._reason = reason;
    }

    public retire() {
        if (this._retired) {
            console.log("이미 아이돌을 그만뒀습니다.");
        }
        else {
            this._retired = true;
            let retireMessages = ["아이돌 그만둘래!"];

            if (this._name === null) {
                retireMessages.unshift("나");
            }
            else {
                retireMessages.unshift(`${this._name},`);
            }

            if (this._reason !== null) {
                retireMessages.unshift(this._reason);
            }

            console.log(retireMessages.join(" "));
        }
    }

    public set reason(reason: string) {
        reason = reason.trim();
        let last_char = reason.charAt(reason.length - 1);
        switch (last_char) {
        case '.':
        case '!':
        case ',':
            break;
        default:
            reason += '!';
        }
        this._reason = reason;
    }

    public get reason(): string {
        return this._reason;
    }

    public isRetired(): boolean {
        return this._retired;
    }

    public get retired(): boolean {
        return this._retired
    }

    public set name(newName: string) {
        if (newName === null) {
            throw "name must not be null";
        }
        this._name = newName.trim();
    }

    public get name(): string {
        return this._name;
    }

    private _retired: boolean = false;
    private _name: string;
    private _reason: string;
}
