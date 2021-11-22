#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 3
#Zadanie 6

#Import funkcji z zadania 1-3
include("./header.jl")
using .Functions

#Implementacje funkcji oraz ich pochodnych z polecenia

function f1(x)
	return exp(1-x)-1
end

function pf1(x)
	return -exp(1-x)
end

function f2(x)
	return x*exp(-x)
end

function pf2(x)
	return -exp(-x)*(x-1)

end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	delta=10^(-5)
	epsilon=10^(-5)

	println("Metoda bisekcji:")
	println("f1:")
	println(mbisekcji(f1,-1.0,2.0,delta,epsilon))
	println(mbisekcji(f1,0.0,2.0,delta,epsilon))
	println(mbisekcji(f1,-100.0,100.0,delta,epsilon))
	println("f2:")
	println(mbisekcji(f2,-1.0,1.0,delta,epsilon))
	println(mbisekcji(f2,0.0,2.0,delta,epsilon))
	println(mbisekcji(f2,-100.0,100.0,delta,epsilon))
	println("Metoda stycznych:")
	println("f1:")
	println(mstycznych(f1,pf1,0.5,delta,epsilon,20))
	println(mstycznych(f1,pf1,1.0,delta,epsilon,20))
	println("f2:")
	println(mstycznych(f2,pf2,-0.5,delta,epsilon,20))
	println(mstycznych(f2,pf2,0.0,delta,epsilon,20))
	println("Metoda siecznych:")
	println("f1:")
	println(msiecznych(f1,0.0,2.0,delta,epsilon,20))
	println(msiecznych(f1,1.0,2.0,delta,epsilon,20))
	println(msiecznych(f1,-20.0,50.0,delta,epsilon,100))
	println("f2:")
	println(msiecznych(f2,-1.0,1.0,delta,epsilon,20))
	println(msiecznych(f2,0.0,1.0,delta,epsilon,20))
	println(msiecznych(f2,-50.0,100.0,delta,epsilon,100))


	println("Dodatkowe sprawdzenia dla metody stycznych: ")
	println("f1: ")
	#println(mstycznych(f1,pf1,2.0,delta,epsilon,100))
	#println(mstycznych(f1,pf1,3.0,delta,epsilon,100))
	#println(mstycznych(f1,pf1,5.0,delta,epsilon,100))
	for i in 1:40
		println(mstycznych(f1,pf1,Float64(i),delta,epsilon,100))
	end
	#println(mstycznych(f1,pf1,10.0,delta,epsilon,100))
	#println(mstycznych(f1,pf1,20.0,delta,epsilon,100))
	#println(mstycznych(f1,pf1,100.0,delta,epsilon,100))
	println("f2: ")
	println(mstycznych(f2,pf2,2.0,delta,epsilon,100))
	println(mstycznych(f2,pf2,3.0,delta,epsilon,100))
	println(mstycznych(f2,pf2,20.0,delta,epsilon,100))
	println(mstycznych(f2,pf2,1.0,delta,epsilon,100))

end


#Rozruch
main()