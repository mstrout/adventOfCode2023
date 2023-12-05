/*
   day04, color card game

   Here is what the input looks like that needs to be parsed:
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53

   Started at 8:26pm.  Til 8:55 for part a.
*/
use IO;
use Set;

var line : string;
var sum = 0;
//var sumOfPower = 0;

var inputLines = readInput();
for line in inputLines {
  // split between card identifier and the rest
  var mainStrs = line.split(":");

  // parse out the card number
  //var cardNumStrs = mainStrs[0].split(" ");
  //var cardNum = cardNumStrs[1] : int;
  //writeln("cardNum=",cardNum);

  // parse out the winning numbers from the numbers we have on card
  var gameStrs = mainStrs[1].split("|");
  var winningNumsStr = gameStrs[0];
  var cardNumsStr = gameStrs[1];

  //writeln("winningNumsStr=",winningNumsStr);
  //writeln("cardNumsStr=",cardNumsStr);
  
  var winningNums : set(int);
  for str in winningNumsStr.split(" ") {
    if str.size>0 { winningNums.add(str : int); }
  }
  var numWins = 0;
  for str in cardNumsStr.split(" ") {
    if str.size>0 {
      if winningNums.contains(str : int) { numWins += 1; }
    }
  }

  // part a: add up points
  //writeln("adding in ", if numWins>0 then 2 ^ (numWins-1) else 0,
  //        " for card ", cardNum, " due to numWins=", numWins);
  sum += if numWins>0 then 2 ** (numWins-1) else 0;
}
writeln("sum = ", sum);
//writeln("sumOfPower = ", sumOfPower);

iter readInput() {
  for line in stdin.lines() {
    yield line.strip();
  }
}
