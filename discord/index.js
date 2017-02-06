const Eris = require("eris");
var config = require("config.json");
var bot = new Eris(config.token);

bot.on("ready", () => {
	//Discord Ready Message
	console.log('Bot Ready');
	//Discord Bot Status Set
	bot.editStatus('online', {name: '아이돌 그만두기'});
});
//Discord Message Created
bot.on("messageCreate", (msg) => {
	//Check Command
	if(msg.cleanContent == '!idol') {
		//Say
		bot.createMessage(msg.channel.id, '나 아이돌 그만둘래!');
}
bot.connect();
