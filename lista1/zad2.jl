#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 2

standards=[Float16,Float32,Float64]

#metoda Kahana podana w tresci zadania
function KahanMethod()
	println("Macheps- wyznaczone metoda Kahana")
	for i in 1:3
		#dla każdego standardu obliczamy wynik korzystając z równania Kahana
		numberOne=one(standards[i])
		result=3*numberOne*(4*numberOne/3*numberOne-1*numberOne)-1*numberOne
		println(standards[i],": ",result)
	end
end

#wykorzystanie funkcji z zadania 1 w celu zweryfikowania wynikow
function Verify()
	println("Macheps- wartosci funkcji wbudowanej eps: ")
	#iteracja po tablicy w celu wypisania wartosci dla wszystkich typow
	for i in 1:3
		println(standards[i],": ",eps(standards[i]))
	end
end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	KahanMethod()
	Verify()
end

#rozruch
main()