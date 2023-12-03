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

// Read in schematic as a 2D array of characters by
// converting a 1D array of strings into that 2D array.
const Lines = readLines();
const numRows = Lines.size,
      numCols = Lines[0].size,
      SchematicDomain = {0..<numRows, 0..<numCols};

var Schematic = [(r,c) in SchematicDomain] Lines[r][c];

iter readLines() {
  for line in stdin.lines() {
    yield line.strip();
  }
}

writeln("Schematic = ", Schematic);

// add numbers with symbols next to them
var sum = 0;
for row in 0..#numRows {
  var col = 0;
  while col<numCols {
    if Schematic[row,col].isDigit() {
      // collect up the number if we have one
      var endCol = col;
      while Schematic[row,endCol].isDigit() && endCol<numCols+1 do endCol += 1;
      endCol -= 1;

      // see if there are symbols around this number
      var found = false;
      var checkStart = col;
      var checkEnd = endCol;
      if col>0 {
        checkStart = col-1;
        if isSymbol(Schematic[row,checkStart]) then found = true;
      }
      if endCol+1<numCols {
        checkEnd = endCol+1;
        if isSymbol(Schematic[row,checkEnd]) then found = true;
      }
      for checkCol in checkStart..checkEnd {
        if row>0 {
          if isSymbol(Schematic[row-1,checkCol]) then found = true;
        }
        if row+1<numRows {
          if isSymbol(Schematic[row+1,checkCol]) then found = true;
        }
      } 

      // add in the number of there was a symbol found
      if found {
        // var numValStr : string = Schematic[row,col..endCol];
        // day03.chpl:70: error: Racy promotion of scalar method receiver
        // FIXME: didn't know what this one meant at all

        //var numValStr = Schematic[row,col..endCol];
        //sum += numValStr : int;
        // day03.chpl:75: error: Cannot assign to int(64) from iterator
        // FIXME: hmmm

        var numValStr = Schematic[row,col..endCol];
        writeln("numValStr =", numValStr);
        //var str = numValStr : string;
        // day03.chpl:79: warning: casting arrays to string is deprecated; please use 'try! "%?".format()' from IO.FormattedIO instead
        // FIXME: this isn't enough info
        writeln("str =", str);
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
