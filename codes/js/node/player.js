//npm install player

var player = require("player");

var songs = ["/Users/James/Downloads/七秒钟的记忆.mp3", "/Users/James/Downloads/Angel.mp3", "/Users/James/Downloads/兄弟抱一下.mp3"];

player.play(songs, function(){
  console.log('done!')
});