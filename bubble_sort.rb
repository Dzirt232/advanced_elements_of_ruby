def bubble_sort(array)
	for i in 0..(array.length-1)
		for j in 0..(array.length-i-2)
			array[j], array[j+1] = array[j+1], array[j] if array[j]>array[j+1]
		end
	end
	puts array.inspect 
end

def bubble_sort_by(array)
	for i in 0..(array.length-1)
		for j in 0..(array.length-i-2)
			array[j], array[j+1] = array[j+1], array[j] if yield(array[j],array[j+1]) > 0 
		end
	end
	puts array.inspect 
end

bubble_sort([1,41,32,5,6,2,7])
bubble_sort([1,41,32,5,6,2,5,34,7])

bubble_sort_by(["hi","hello","hey"]) do |right,left|
	right.length - left.length
end

bubble_sort_by([[1,41,214],[124,125,135,135],[0]]) do |right,left|
	right.length - left.length
end