import Foundation

func mergeSort(_ array:[Int]) -> [Int]{
	guard array.count > 1 else { return array }
	
	let mid = array.count >> 1
	let left = mergeSort(Array(array[0..<mid]))
	let right = mergeSort(Array(array[mid..<array.count]))
	
	return merge(left,right)
}

func merge(_ leftPile:[Int], _ rightPile:[Int]) -> [Int] {
	var orderedPile = [Int]()
	orderedPile.reserveCapacity(leftPile.count + rightPile.count)
	
	var left = 0
	var right = 0
	
	while left < leftPile.count && right < rightPile.count {
		if leftPile[left] <= rightPile[right] {
			orderedPile.append(leftPile[left])
			left += 1
		}else{
			orderedPile.append(rightPile[right])
			right += 1
		}
	}
	
	while left < leftPile.count {
		orderedPile.append(leftPile[left])
		left += 1
	}
	
	while right < rightPile.count {
		orderedPile.append(rightPile[right])
		right += 1
	}

	return orderedPile
}



var array = [Int]()
for _ in 0...99 {
	array.append(Int(arc4random_uniform(100)))
}

print(array)
let res = mergeSort(array)
print(res)