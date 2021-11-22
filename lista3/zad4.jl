#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 3
#Zadanie 4

#Import funkcji z zadania 1-3
include("./header.jl")

using .Functions

#Doslowna implementacja funkcji z tresci zadania
function f(x)
	return sin(x)-(1/2)^2*x^2
	
end

#Funkcja obliczajaca pochodna
function pf(x)
	return cos(x)-(1/2)x
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	delta=Float64(1/2)*10^(-5)
	epsilon=Float64(1/2)*10^(-5)
	println("Metoda bisekcji:")
	println(mbisekcji(f,1.5,2.0,delta,epsilon))
	println("Metoda stycznych:")
	println(mstycznych(f,pf,1.5,delta,epsilon,100))
	println("Metoda siecznych:")
	println(msiecznych(f,1.0,2.0,delta,epsilon,100))
end

#Rozruch
main()