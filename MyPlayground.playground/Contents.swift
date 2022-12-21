import UIKit

var greeting = "Hello, playground"
var x = "qsafasfa"
var y = "qwasdar"

var sortedX = x.sorted()
var sortedY = y.sorted()
var result: Character = "a"

if x.sorted() != y.sorted() {
    if x.count > y.count {
        for i in 0...y.count {
            if sortedX[i] != sortedY[i] {
                result = sortedX[i]
            } else {
                result = sortedX.last ?? "0"
            }
        }
    }
}

print(result)
