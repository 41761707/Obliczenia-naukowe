#Radoslaw Wojtczak nr indeksu 254607
#Obliczenia naukowe lista 2
#Zadanie 6

#Dosłowna implementacja funkcji rekurencyjnej podanej w tresci zadania
function recursive(iter,c,x0)

	results=[x0]
	for i in 1:iter
		append!(results,results[i]^2+c)
	end
	return results
end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	#Tablice uwzgledniaja x0!
	part1=recursive(40,-2*one(Float64),1*one(Float64))
	part2=recursive(40,-2*one(Float64),2*one(Float64))
	part3=recursive(40,-2*one(Float64),Float64(1.99999999999999))
	part4=recursive(40,-1*one(Float64),1*one(Float64))
	part5=recursive(40,-1*one(Float64),-1*one(Float64))
	part6=recursive(40,-1*one(Float64), Float64(0.75))
	part7=recursive(40,-1*one(Float64),Float64(0.25))
	println(part1)
	println(part2)
	println(part3)
	println(part4)
	println(part5)
	println(part6)
	println(part7)
end

#rozruch
main()