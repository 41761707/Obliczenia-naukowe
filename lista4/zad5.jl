#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 4
#Zadanie 5
include("./header.jl")
using .Functions

#Implementacja funkcji z tresci zadania
function a(x)
	return exp(x)
end

function b(x)
	return x^2*sin(x)
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	values=[5,10,15]
	range=[-1.0,0.0,1.0]
	for item in values
		rysujNnfx(a,0.0,1.0,item)
		rysujNnfx(b,-1.0,1.0,item)
	end


end

#Rozruch
main()