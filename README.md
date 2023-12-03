# adventOfCode2023

## Parsing input in Chapel

### Day 1
Just using `readLine`.
```
7jlncfksix7rjgrpglmn9
```

### Day 2
Uses lots of `split` calls on strings.
```
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
```

## Things that were difficult to find

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
