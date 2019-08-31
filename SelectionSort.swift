func selectionSort(_ array:[Int]) -> [Int] {
	guard array.count > 1 else { return array }
	
	var a = array
	for i in 0..<a.count-1 {
		var min = i
		for j in (i+1)..<a.count {
			if a[j] < min {
				min = j
			}
		}
		if i != min { a.swapAt(i, min) }
	}
	return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print(selectionSort(list))