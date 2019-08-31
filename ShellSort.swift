func shellSort(_ array:inout [Int]){
	guard array.count > 1 else { return }
	
	var subArrayCount = array.count >> 1
	while subArrayCount > 0 {
		for i in 0..<subArrayCount {
			insertionSort(&array, i, subArrayCount)
		}
		subArrayCount /= 2
	}
}

func insertionSort(_ array:inout [Int],_ start:Int, _ gap:Int){
	for i in stride(from: start, to: array.count, by: gap){
		let temp = array[i]
		var j = i
		while j > start && temp < array[j-gap]  {
			array[j] = array[j-gap]
			j -= gap
		}
		if j != i {
			array[j] = temp
		}
	}
}

var list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
shellSort(&list)
print(list)