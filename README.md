# adventOfCode2023

## Parsing input in Chapel

### Day 1
Just using `readLine`.
```
7jlncfksix7rjgrpglmn9
```

### Day 2
Uses lots of `split` calls on strings.
Also using an iterator to read into a 1D array of strings.
```
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
```

### Day 3
Reading in a 1D array of strings.
```
const Schematic = readLines();
iter readLines() {
  for line in stdin.lines() {
    yield line.strip();
  }
}
```

### Will use later
Reading in a 1D array of strings that can treat like a 2D array.
```
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
```

Sample input
```
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
```

## Things that were difficult to find or understand

* An example of how to create map values.
```
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
```

* slices documentation at 
https://chapel-lang.org/docs/primers/slices.html#primers-slices is confusing
