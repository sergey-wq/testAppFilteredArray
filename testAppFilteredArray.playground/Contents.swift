import UIKit

func getFilteredArray<T: Hashable>(_ firstArray: [T], _ secondArray: [T]) -> [T] {

    var set: Set<T> = []

    // counting the number of duplicate elements
    let firstArrayDuplicate = firstArray.reduce(into: [:]) { partialResult, count in
        partialResult[count, default: 0] += 1
    }

    let secondArrayDuplicate = secondArray.reduce(into: [:]) { partialResult, count in
        partialResult[count, default: 0] += 1
    }

    // check if element can added in set, we can added it in array
    let filteredArray = secondArray.filter {
        firstArrayDuplicate[$0] != secondArrayDuplicate[$0] ? set.insert($0).inserted : false
    }

    return filteredArray
}

let filteredArrayInt = getFilteredArray([1, 2, 3, 4, 5, 8, 8], [1, 2, 3, 6, 7, 8])
print(filteredArrayInt)

let filteredArrayString = getFilteredArray(
    ["a", "b", "b", "v", "m", "r", "i"],
    ["a", "q", "s", "v", "m", "r", "i"]
)
print(filteredArrayString)
