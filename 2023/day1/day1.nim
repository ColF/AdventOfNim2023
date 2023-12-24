import rdstdin, re, tables

var total: int
var line: string
let firstNum = re(".*?(\\d|one|two|three|four|five|six|seven|eight|nine).*")
let lastNum = re(".*(\\d|one|two|three|four|five|six|seven|eight|nine).*?")
let wordToNum = {"one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "0":0}.toTable
var matches: array[1, string]
var lineCount, matchedCount: int = 0


while true:
  line = readLineFromStdin("")
  if line.len == 0:
    break
  lineCount += 1
  if line.find(firstNum, matches) >= 0:
    matchedCount += 1
    total += (wordToNum[matches[0]] * 10)
    # echo line & ", " & $matches[0]
  if line.find(lastNum, matches) >= 0:
    matchedCount += 1
    total += wordToNum[matches[0]]
    # echo line & ", " & $matches[0]

echo "lineCount: " & $lineCount
echo "matchedCount: " & $matchedCount
echo "total: " & $total
