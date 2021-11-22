#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 3
#Zadanie 5

#Import funkcji z zadania 1-3
include("./header.jl")
using .Functions

#Doslowna implementacja funkcji z tresci zadania
function f(x)
	return exp(x)-3x
end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	delta=10^(-4)
	epsilon=10^(-4)
	#println(mbisekcji(f,-2.0,20.0,delta,epsilon))
	println(mbisekcji(f,0.0,1.0,delta,epsilon))
	println(mbisekcji(f,1.0,2.0,delta,epsilon))
	#println(mbisekcji(f,4.0,8.0,delta,epsilon))
end

#Rozruch
main()