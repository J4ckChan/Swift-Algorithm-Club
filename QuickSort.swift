import Foundation
func QuickSort<T:Comparable>(_ array: [T]) -> [T]{
	guard array.count > 1 else { return array }
	
	let pivot = array.count>>1
	let pivotValue = array[pivot]
	let smaller = array.filter{ $0 < pivotValue }
	let equal = array.filter{ $0 == pivotValue }
	let bigger = array.filter{ $0 > pivotValue }
	
	return QuickSort(smaller) + equal + QuickSort(bigger)
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
let res = QuickSort(list)
print(res)


//Lomuto's partitioning scheme
func partitionLomuto<T:Comparable>(_ array:inout [T], low:Int, high:Int) -> Int{
	let pivot = array[high]
	
	var i = low
	for j in low..<high {
		if array[j] <= pivot {
			(array[i],array[j]) = (array[j],array[i])
			i += 1
		}
	}
	(array[i],array[high]) = (array[high],array[i])
	return i 
}


var list1 = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
//let res1 = partitionLomuto(&list1, low: 0, high: list1.count-1)
//print(res1)

func quickSortLomuto<T:Comparable>(_ array:inout [T], _ low:Int, _ high:Int){
	guard high > low else { return }
	
	let pivotIndex = partitionLomuto(&array, low: low, high: high)
	quickSortLomuto(&array, low, pivotIndex-1)
	quickSortLomuto(&array, pivotIndex+1, high)	
}

quickSortLomuto(&list1, 0, list1.count-1)
print(list1)



//Hoare's partitioning scheme
func partitionHoare<T:Comparable>(_ array:inout [T], _ low:Int, _ high:Int) -> Int{
	let pivot = array[low]
	var i = low-1
	var j = high+1
	
	while true {
		repeat { i += 1 } while array[i] < pivot
		repeat { j -= 1 } while array[j] > pivot
		
		if j > i { 
			array.swapAt(i, j) 
		}else{ 
			return j
		}
	}
}

func quickSortHoare<T:Comparable>(_ array:inout [T], _ low:Int, _ high:Int){
	guard high > low else { return }
	
	let pivotIndex = partitionHoare(&array, low, high)
	quickSortHoare(&array, low, pivotIndex)
	quickSortHoare(&array, pivotIndex+1, high)
}

var list2 = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
quickSortHoare(&list2, 0, list2.count-1)
print(list2)

var list3 = [Int]()
for _ in 0...99 {
	list3.append(Int(arc4random()%100))
}
print(list3)
quickSortHoare(&list3, 0, list3.count-1)
print(list3)