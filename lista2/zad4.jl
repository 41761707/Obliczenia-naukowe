#Radoslaw Wojtczak nr indeksu 254607
#Obliczenia naukowe lista 2
#Zadanie 4

#Potrzebne importy
using Polynomials
using Printf

#Wspołczynniki dla podpunktu a

coefficientsA = [
    1,
    -210.0,
    20615.0,
    -1256850.0,
    53327946.0,
    -1672280820.0,
    40171771630.0,
    -756111184500.0,
    11310276995381.0,
    -135585182899530.0,
    1307535010540395.0,
    -10142299865511450.0,
    63030812099294896.0,
    -311333643161390640.0,
    1206647803780373360.0,
    -3599979517947607200.0,
    8037811822645051776.0,
    -12870931245150988800.0,
    13803759753640704000.0,
    -8752948036761600000.0,
    2432902008176640000.0
]

#Współczynniki dla podpunktu b

coefficientsB=[
	1,
    -210.0-2^(-23),
    20615.0,
    -1256850.0,
    53327946.0,
    -1672280820.0,
    40171771630.0,
    -756111184500.0,
    11310276995381.0,
    -135585182899530.0,
    1307535010540395.0,
    -10142299865511450.0,
    63030812099294896.0,
    -311333643161390640.0,
    1206647803780373360.0,
    -3599979517947607200.0,
    8037811822645051776.0,
    -12870931245150988800.0,
    13803759753640704000.0,
    -8752948036761600000.0,
    2432902008176640000.0

]

#Funkcja podana w zadaniu

function p(x)
    return (x - 20)*(x - 19)*(x - 18)*(x - 17)*(x - 16)*(x - 15)*(x - 14)*(x - 13)*(x - 12)*(x - 11)*
    (x - 10)*(x - 9)*(x - 8)*(x - 7)*(x - 6)*(x - 5)*(x - 4)*(x - 3)*(x - 2)*(x - 1)
end

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	#kreujemy wielomian z współczynników z podpunktu a
	zadAp1=Polynomial(reverse(coefficientsA))
	#println(zadAp1)
	#znajdujemy miejsca zerowe
	zadAr1=roots(zadAp1)
	#println(zadAr1)
	
	#Wypisujemy wyniki w petli
	println("Zera wielomianu: ")
	print(zadAr1)
	for i in 1:20
		@printf("%d & %e & %e & %e \\\\\n",i,abs(zadAp1(zadAr1[i])),abs(p(zadAr1[i])), abs(zadAr1[i]-i))
		#println("k: ", i ,", |P(zk)|: ",abs(zadAp1(zadAr1[i])), ", |p(zk)|: ",abs(p(zadAr1[i])), ", |zk-k|: ", abs(zadAr1[i]-i))
	end

	#kreujemy wielomian z współczynników z podpunktu b
	zadAp2=Polynomial(reverse(coefficientsB))
	#println(zadAp2)
	#znajdujemy miejsca zerowe
	zadAr2=roots(zadAp2)
	#println(zadAr2)
	println("Zera wielomianu: ")
	print(zadAr2)
	#Wypisujemy wyniki w petli
	for i in 1:20
		#println("k: ", i ,", |P(zk)|: ",abs(zadAp2(zadAr2[i])), ", |p(zk)|: ",abs(p(zadAr2[i])), ", |zk-k|: ", abs(zadAr2[i]-i))
		@printf("%d & %e & %e & %e \\\\\n",i,abs(zadAp2(zadAr2[i])),abs(p(zadAr2[i])), abs(zadAr2[i]-i))
	end
end

#rozruch
main()

