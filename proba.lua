local unpack = table.unpack or unpack

function gaussian (mean, variance)
	return  math.sqrt(-2 * variance * math.log(math.random())) *
	math.cos(2 * math.pi * math.random()) + mean
end

function mean (t)
	local sum = 0
	for k, v in pairs(t) do
		sum = sum + v
	end
	return sum / #t
end

function std (t)
	local squares, avg = 0, mean(t)
	for k, v in pairs(t) do
		squares = squares + ((avg - v) ^ 2)
	end
	local variance = squares / #t
	return math.sqrt(variance)
end
