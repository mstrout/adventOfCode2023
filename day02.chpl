/*
   day02, cube game

   Here is what the input looks like that needs to be parsed:
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

*/
use IO;
use Map;

var maxColor : map(string,int);
maxColor["red"] = 12;
maxColor["green"] = 13;
maxColor["blue"] = 14;

var line : string;
var sum = 0;
var sumOfPower = 0;

var inputLines = readInput();
for line in inputLines {
  var minNeeded : map(string,int);
  minNeeded["red"] = 0;
  minNeeded["green"] = 0;
  minNeeded["blue"] = 0;

  var validGame = true;
  var mainStrs = line.split(":");

  // parse out the game number
  var gameNumStrs = mainStrs[0].split(" ");
  var gameNum = gameNumStrs[1] : int;

  // parse out the games
  var gameStrs = mainStrs[1].split(";");
  for gameStr in gameStrs {
    var cubeCountPairStrs = gameStr.split(",");
    for cubeCountPairStr in cubeCountPairStrs {
      var cubeCountStrs = cubeCountPairStr.strip().split(" ");
      var (cubeCountStr,cubeColorStr) = (cubeCountStrs[0],cubeCountStrs[1]);

      // part a: are any of the cube counts that would be invalid?
      if (cubeCountStr:int) > maxColor[cubeColorStr] then
        validGame = false;

      // part b: what would the minimal count needed be
      if cubeCountStr:int > minNeeded[cubeColorStr] then
        minNeeded[cubeColorStr] = cubeCountStr:int;
    }
  }
  // part a: is it a valid game
  if validGame {
    sum += gameNum;
  }
  // part b: what "power" would make it a valid game
  var power = 1;
  for color in minNeeded.keys() {
    power *= minNeeded[color];
  }
  sumOfPower += power;
}
writeln("sum = ", sum);
writeln("sumOfPower = ", sumOfPower);

iter readInput() {
  for line in stdin.lines() {
    yield line.strip();
  }
}
