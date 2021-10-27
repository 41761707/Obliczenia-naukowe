#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 6


#implementacja funckja f zadanej w tresci zadania
function f(x)
	#Zmienna przechowująca wynnik zaimplementowanego działania
	result=sqrt(x^2+one(Float64))-one(Float64)
	print("f(x): ",result)
end

#implementacja funckja g zadanej w tresci zadania
function g(x)
	#Zmienna przechowująca wynnik zaimplementowanego działania
	result=(x^2)/(sqrt(x^2+one(Float64))+one(Float64))
	println(", g(x): ",result)
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	#Wypisywanie wartości w pętli
	for i in 1:100
		numberOne=one(Float64)
		println("x: ",i)
		f((8*numberOne)^(-i))
		g((8*numberOne)^(-i))
	end

end

#rozruch
main()