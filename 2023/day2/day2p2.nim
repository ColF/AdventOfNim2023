# Day 2 part 2
import rdstdin, strutils, re, tables

let getCubeCount = re("(\\d+) (green|red|blue)")
let getGameNum = re("Game (\\d+):")
var matches: array[2, string]
var line, gameNum: string
var total, power: int = 0

while true:
  line = readLineFromStdin("")
  if line.len == 0:
    break
  if line.find(getGameNum, matches) >= 0:
    gameNum = matches[0]

  # var gtMax: bool = false
  var minCubes = {"red":0, "green":0, "blue":0}.toTable
  for cubes in line.findAll(getCubeCount):
    if cubes.find(getCubeCount, matches) >= 0:
      # echo cubes & " : " & matches[0]
      if parseInt(matches[0]) > minCubes[matches[1]]:
        minCubes[matches[1]] = parseInt(matches[0])

  power = minCubes["red"] * minCubes["green"] * minCubes["blue"]
  total += power

echo "total: " & $total



