# hs-num-convertor

Haskell implementation of number convertor

num-convertor enable convert number from M to N system
e.g.:
	- 2 -> 16  -- bin to hex <br/>
	- 16 -> 8  -- hex to oct <br/>
	- 60 -> 10 -- sixty to dec ( for example from clock to min ) <br/>
	- M -> N   -- you can choose your favourite system in interval [1..] <br/>
	...


becouse higher system must have special chars so there are many posibilities of inputs
in hex system we use 'A' 'B' 'C' 'D' 'E' 'F' <br />
so you can work with 35 system -> ` [0..9]++['A'..'Z'] ` -- all is case inssensitive 'A' == 'a'

we can use max 35 system ( `length ([0..9]++['A'..'Z'])` ) for imputs with abbrevations <br />
if we want work with higher systems, we must use array of Int digits e.q.: <br />
` 101 (10) == [1,0,1] (10) ` <br />
` ABC (16) == [10, 11, 12] (16) ` <br />
` G (20) == [17] (20) ` <br />
` 2 30 (60) == [2, 30] (20) ` <br />
` 0000 (1) == [0, 0, 0, 0] ` <br />

hs-num-convertor also support UNARY NUMERAL SYSTEM :)
[wiki link](https://en.wikipedia.org/wiki/Unary_numeral_system)



## validate inputs ##
all functions return `Maybe` type, becouse we need validate inputs
we can for example use:
```
case convertNum 2 16 "1010" of
  Nothing -> putStrLn "Invalid inputs"
  Just q  -> putStrLn $ show $ q == "A"
```


## examples ##
public functions
- convertNum
- convertNumByArrays
- convertNumBySpaces


bin to hex   => `convertNum 2 16 "1010"` -> `Just "A"` <br />
unary to bin => `convertNum 1 2 "0000000000"` -> `Just '1010'` <br />
dec to oct   => `convertNum 10 8 "14"` -> `Nothing` becouse its invalid <br />
sixty to dec => `convertNumBySpaces 10 8 "14"` -> `Nothing` becouse its invalid <br />
sixty to dec => `convertNumBySpaces 60 10 "1 20"` -> `Just "8 0"`<br />
sixty to dec => `convertNumByArrays 60 10 [1, 20]` -> `Just [8, 0]"` <br />



## public api in Detail ##

hs-num-convertor enable us use 3 different functions


first argument <br />
`system from `


second argument <br />
`system to`

third argument <br />
	- ` velue (in same system as first argument) `

 - convertNum
   - `convertNum system1 system2 "DF48"`
   - `convertNum 16 8 "DF48"`
   - max length of system is 35 => `(length ['a'..'b'] ++ [1..9]) == 35`
 - convertNumByArrays
   - `convertNumByArrays system1 system2 [1,2,3,4]`
   - `convertNumByArrays 10 16 [1,2,3,4] `
 - convertNumBySpaces
   - `convertNumBySpaces system1 system2 "15 10 2 5"`
   - `convertNumBySpaces 16 3 "15 10 2 5"`
