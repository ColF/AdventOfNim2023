# Day 2 part 1
import rdstdin, strutils, re, tables

let getCubeCount = re("(\\d+) (green|red|blue)")
let getGameNum = re("Game (\\d+):")
var matches: array[2, string]
var line, gameNum: string
var total: int = 0
let cubeColourCount = {"red":12, "green":13, "blue":14}.toTable

while true:
  line = readLineFromStdin("")
  if line.len == 0:
    break
  if line.find(getGameNum, matches) >= 0:
    gameNum = matches[0]

  var gtMax: bool = false
  for cubes in line.findAll(getCubeCount):
    if cubes.find(getCubeCount, matches) >= 0:
      # echo cubes & " : " & matches[0]
      if parseInt(matches[0]) > cubeColourCount[matches[1]]:
        gtMax = true
        break

  if not gtMax:
    total += parseInt(gameNum)

echo "total: " & $total



