/*
   day03, part numbers

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

// Read in schematic as a 1D array of strings
const Schematic = readLines();
iter readLines() {
  for line in stdin.lines() {
    yield line.strip();
  }
}

var numRows = Schematic.size;
var numCols = Schematic[0].size;

// add numbers with symbols next to them
var sum = 0;
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

      // see if there are any gears near this number
      var found = false;
      for (r,c) in idxAround(row,col,endCol) {
        if isSymbol(Schematic[r][c]) { found = true; }
      }

      // add in the number of there was a symbol found
      if found {
        var numValStr = Schematic[row][col..endCol];
        sum += numValStr : int;
      }
      // found a number so what to reset col at endCol+1
      col = endCol+1;

    } // end found a digit
    else { // if didn't find a number need to increment col
      col += 1;
    }
  }
}
writeln("sum = ", sum);

proc isSymbol(c) {
  return c!="." && !c.isDigit();
}

// collect all of the indices around the number
proc idxAround(row,col,endCol) {
  use Set;
  var checkStart = col;
  var checkEnd = endCol;
  var idxSet : set((int,int));
  if col>0 {
    checkStart = col-1;
    idxSet.add((row,checkStart));
  }
  if endCol+1<numCols {
    checkEnd = endCol+1;
    idxSet.add((row,checkEnd));
  }
  for checkCol in checkStart..checkEnd {
    if row>0 { idxSet.add((row-1,checkCol)); }
    if row+1<numRows { idxSet.add((row+1,checkCol)); }
  } 
  return idxSet;
}

