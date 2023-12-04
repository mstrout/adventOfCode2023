/*
   day03b, part numbers

   Now find "gears" (asterisks adjacent to 2 numbers), multiply them 
   to get gear power, and add up all the gear power.

   Input:
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..

*/
use IO;
use Map;
use List;

// Read in schematic as a 1D array of strings
const Schematic = readLines();
iter readLines() {
  for line in stdin.lines() {
    yield line.strip();
  }
}

var numRows = Schematic.size;
var numCols = Schematic[0].size;

// find all the gears and collect a list of numbers adjacent to them
var gearMap : map((int,int),list(int));
for row in 0..#numRows {
  var col = 0;
  while col<numCols {
    if Schematic[row][col].isDigit() {
      // collect up the number if we have one
      var endCol = col;
      while endCol<numCols && Schematic[row][endCol].isDigit() {
        endCol += 1;
      }
      endCol -= 1;
      // get the number
      var numVal = Schematic[row][col..endCol] : int;

      // see if there are any gears near this number
      var checkStart = col;
      var checkEnd = endCol;
      if col>0 {
        checkStart = col-1;
        if Schematic[row][checkStart]=="*" {
          gearMap[(row,checkStart)].pushBack(numVal); 
        }
      }
      if endCol+1<numCols {
        checkEnd = endCol+1;
        if Schematic[row][checkEnd]=="*" {
          gearMap[(row,checkEnd)].pushBack(numVal); 
        }
      }
      for checkCol in checkStart..checkEnd {
        if row>0 && Schematic[row-1][checkCol]=="*" {
          gearMap[(row-1,checkCol)].pushBack(numVal); 
        }
        if row+1<numRows && Schematic[row+1][checkCol]=="*" {
          gearMap[(row+1,checkCol)].pushBack(numVal); 
        }
      } 

      // found a number so what to reset col at endCol+1
      col = endCol+1;

    } // end found a digit
    else { // if didn't find a number need to increment col
      col += 1;
    }
  }
}

// add up gear powers
writeln("gearMap=",gearMap);
var sum = 0;
for coord in gearMap.keys() {
  if gearMap[coord].size == 2 {
    sum += gearMap[coord][0] * gearMap[coord][1];
  }
}
writeln("sum = ", sum);
