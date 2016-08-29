import {Idol} from './idol';

console.log("===CASE 0===");

let noname_idol = new Idol();
noname_idol.retire();

console.log("===CASE 1===");

let mio = new Idol("미오");
console.log(`안녕하세요! 신인 아이돌 ${mio.name}입니다!`);
mio.reason = "손님 엄청 적잖아";
mio.retire();
