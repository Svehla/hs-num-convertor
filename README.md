# hs-num-convertor


## public api ##

3 different functions ( different api for numbers)
3 params... for setting config
system1 system2 value


Markup : * convertNum
           * `convertNum system1 system2 "DF48"`
           * `convertNum 16 8 "DF48"`
           * max length of system is 35 --> `(length ['a'..'b'] + length [1..9]) == 35`
        * convertNumByArrays
           * `convertNumByArrays system1 system2 [1,2,3,4]`
           * `convertNumByArrays 10 16 [1,2,3,4] `
         * convertNumBySpaces
           * `convertNumBySpaces system1 system2 "15 10 2 5"`
           * `convertNumBySpaces 16 3 "15 10 2 5"`
