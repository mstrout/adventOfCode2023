/*
   day01, calibration values

   Read in each line of text, find the first and last digit to make a 2-digit
   number, and then add all of those.

   Edited for part b to recognize digit strings "one" through "nine".
*/
use IO;

var line : string;
var sum = 0;

while readLine(line) {
  var twoDigitStr : string;

  // at each index in the input string
  for i in 0..#line.size {
    var c = line[i];
    var digit = getDigitStr(line,i);
    if c.isDigit() {
      twoDigitStr += c;

    } else if digit > 0 {
      twoDigitStr += digit : string;
    }
  }
  //writeln("line = ", line.strip());
  //writeln("twoDigitStr = ", twoDigitStr);
  //writeln();

  // grab the first and last
  twoDigitStr = twoDigitStr[0] + twoDigitStr[twoDigitStr.size-1];
  sum += twoDigitStr:int;
}
writeln("sum = ", sum);

// Returns integer for the digit string (1..9) that starts at str[idx]
// or returns -1 if that substring isn't a digit string.
proc getDigitStr(str,idx) {
  use Map;
  var digitVals : map(string,int);
  digitVals["one"] = 1;
  digitVals["two"] = 2;
  digitVals["three"] = 3;
  digitVals["four"] = 4;
  digitVals["five"] = 5;
  digitVals["six"] = 6;
  digitVals["seven"] = 7;
  digitVals["eight"] = 8;
  digitVals["nine"] = 9;

  for digitStr in digitVals.keys() {
    var lastIdx = min(idx+digitStr.size-1, str.size-1);
    if str[idx..lastIdx] == digitStr {
      return digitVals[digitStr];
    }
  }
  return -1;
}
