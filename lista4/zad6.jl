#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 4
#Zadanie 6
include("./header.jl")
using .Functions

#Implementacja funkcji z tresci zadania
function c(x)
	return abs(x)
end

function d(x)
	return 1/(1+x^2)
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	values=[5,10,15]
	for item in values
		rysujNnfx(c,-1.0,1.0,item)
		rysujNnfx(d,-5.0,5.0,item)
	end


end

#Rozruch
main()