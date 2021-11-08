#Radoslaw Wojtczak nr indeksu 254607
#Obliczenia naukowe lista 2
#Zadanie 5


#Funkcja implementująca treść zadania
function population(n,r,p0)

	if(n==0)

		return p0

	end

	pn1=population(n-1,r,p0)
	return pn1+r*pn1*(1-pn1)

end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	#Wartości dla Float32 i Float64
	println("40 iteracji Float32: ", population(40,Float32(3),Float32(0.01)))
	println("40 iteracji Float64: ", population(40,Float64(3),Float64(0.01)))

	#Wartość dla Float32 po obcinaniu wyniku co 10 iteracji

	result = population(10, Float32(3), Float32(0.01))
	result = population(30, Float32(3), Float32(trunc(result,digits=3)))

	println("40 iteracji z obcięciem wyniku po 10: ",result)


end

#rozruch
main()
