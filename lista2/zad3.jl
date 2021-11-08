#Radoslaw Wojtczak nr indeksu 254607
#Obliczenia naukowe lista 2
#Zadanie 3

using LinearAlgebra
using Printf

#Funckaja Pana Profesora
function matcond(n::Int, c::Float64)
# Function generates a random square A A of size n with
# a given condition number c.
# Inputs:
#	n: size of A A, n>1
#	c: condition of A A, c>= 1.0
#
# Usage: matcond(10, 100.0)
#
# Pawel Zielinski
        if n < 2
         error("size n should be > 1")
        end
        if c< 1.0
         error("condition number  c of a A  should be >= 1.0")
        end
        (U,S,V)=svd(rand(n,n))
        return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end

#Funkcja Pana Profesora
function hilb(n::Int)
# Function generates the Hilbert A  A of size n,
#  A (i, j) = 1 / (i + j - 1)
# Inputs:
#	n: size of A A, n>=1
#
#
# Usage: hilb(10)
#
# Pawel Zielinski
        if n < 1
         error("size n should be >= 1")
        end
        return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

#Eksperyment dla macierzy Hilberta
#size- rozmiar macierzy

function hilberts(size)
        A = hilb(size)
        b = A * ones(size, 1)
        gauss = A\b
        inverse = inv(A) * b
        normGauss = norm(ones(size, 1) - gauss) / norm(ones(size, 1))
        normInverse = norm(ones(size, 1) - inverse) / norm(ones(size, 1))
        @printf("%d & %d & %e & %e & %e \\\\\n", size, rank(A), cond(A), normGauss, normInverse)
end


#Eksperyemtn dla losowej macierzy
#n- rozmiar macierzy
#c- wskaznik uwarunkowania

function randoms(n,c)
	A = matcond(n,c)
        b = A * ones((n), 1)
        gauss = A\b
        inverse = inv(A) * b
	normGauss = norm(ones(n, 1) - gauss) / norm(ones(n, 1))
        normInverse = norm(ones(n, 1) - inverse) / norm(ones(n, 1))
	@printf("%d & %d & %e & %e & %e \\\\\n", n, rank(A), cond(A), normGauss, normInverse)

end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	n=[5,10,20]
	c=[1*one(Float64),10*one(Float64),10^3*one(Float64),10^7*one(Float64),10^12*one(Float64),10^16*one(Float64)]
	println(c)
	println("Macierze Hilberta: ")
	for i in 1:20
		hilberts(i)
	end
	println("Macierze losowe: ")
	for i in n
		for j in c
			randoms(i,j)
		end
	end
end





#Rozruch
main()

