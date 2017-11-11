module Enumerable
	def my_each
		for i in 0..self.length-1
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		for i in 0..self.length-1
			yield(self[i],i)
		end
		self
	end

	def my_select
		selected = []
		self.my_each do |x|
			selected.push(x) if yield(x)
		end
		selected
	end

	def my_all?
		if block_given?
			self.my_each do |x|
				return false until yield(x)
			end
		else
			self.my_each do |x|
				return false if x.nil? || x == false
			end
		end
		true
	end

	def my_any?
		if block_given?
			self.my_each do |x|
				return true if yield(x)
			end
		else
			self.my_each do |x|
				return true until x.nil? || x == false
			end
		end
		false
	end

	def my_none?
		if block_given?
			self.my_each do |x|
				return false if yield(x)
			end
		else
			self.my_each do |x|
				return false if x
			end
		end
		true
	end

	def my_count
		count = 0
		self.my_each do |x|
				count += 1
		end
		count
	end

	def my_map(some_proc)
		new_arr = []
		if block_given?
			self.my_each do |x|
				new_arr.push(some_proc.call(yield(x)))
			end
		else
			self.my_each do |x|
				new_arr.push(some_proc.call(x))
			end
		end
		new_arr
	end

	def my_inject(s=self[0])
		if block_given?
			self.my_each do |x|
				s=yield(s,x)
			end
		else
			self.my_each do |x|
				s.call
			end
		end
		s
	end
end

def multiply_els(array)
	array.my_inject(1) { |p,x|
		p*x
	}
end

my_proc = Proc.new {|x| x**2 }

p [12,4,123,2,0,3].my_map(my_proc)

p [12,4,123,2,0,3].my_map(my_proc) { |x|
	x+1
}
