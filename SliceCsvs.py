import csv
import os

def load_big_csv(fileName, fileLength):
  print('Loading file')
  print(f"Selected file: {fileName}")
#   fileName = "direccionesCompleta"
  bigFile = open(f"{fileName}.csv", mode="r", encoding="utf-8", buffering=8192)
  csvOpener = csv.reader(bigFile)
  rowCounter = 0
  fileCounter = 0

  next(csvOpener)
  directoryName = f"salidas-{fileName}"
  os.makedirs(directoryName, exist_ok=True)

  for row in csvOpener:

    if rowCounter%(fileLength/50) == 0:
        newPart = open(f"./{directoryName}/{fileName}+{fileCounter+1}+.csv", mode="w", encoding="utf-8", newline="")
        csvWriter = csv.writer(newPart)
        print(f"Current file count: {fileCounter+1}")
        fileCounter+=1
        rowCounter=0

    csvWriter.writerow(row)
    rowCounter+=1
  if newPart:
     newPart.close()


   

if __name__ == '__main__':
  print("Script for splicen big csv files into determined number of files...")

  fileNames =["direccionesCompleta", "establecimientosCompleta"]
  load_big_csv(fileNames[0], 138125)