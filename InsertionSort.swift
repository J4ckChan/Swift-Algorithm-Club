func insertionSort(_ array:[Int]) -> [Int] {
	guard !array.isEmpty else { return array }
	var a = array
	for i in 0..<a.count {
		let temp = a[i]
		var j = i
		while j > 0 && temp < a[j-1] {
			a[j] = a[j-1]
			j -= 1
		}
		a[j] = temp 
	}
	return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
let res = insertionSort(list)
print(res)