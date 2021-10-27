#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 3

#Funkcja ma za zadanie wypisać , która reprezentuje odległość między dwoma sąsiadującymi ze sobą liczbami zmiennoprzecinkowymi w danym przedziale
#start- wartość oznaczająca początek rozpatrywanego przedziału
#stop- wartość oznaczająca koniec rozpatrywanego przedziału
function zad3(start,stop)
	#zmienna last przechowuje liczbę zmiennoprzeciwnkową poprzedzającą koniec rozpatrywanego przedziału
	last=prevfloat(stop)
	#Przy pomocy otrzymanej wskazówki z treści zadania korzystamy z funkcji bitstring() aby otrzymać eksponenty odpowiednio startu jak i liczby wcześniejszej niż stop
	startExponent=SubString(bitstring(start),2:12)
	stopExponent=SubString(bitstring(last),2:12)
	
	#Porównujemy exponenty obu liczb. Jeśli są różne to przerywamy działanie ze względu na nierównoległe rozłożenie liczb (rozumowanie prowadzące do tego wniosku zostało przedstawione w sprawozdaniu)
	if(startExponent!=stopExponent)
		println("Brak równego rozłożenia")
		return
	end
	#Jeśli eksponenty są równe, obliczamy odległość między kolejnymi liczbami w danym przedziale i umieszczamy ją w zmiennej diff (rozumowanie prowadzące do wniosku, że można skorzystać ze wzoru 2^(eksponenta-1023)*2^(-52) również zostało przedstawione w sprawozdaniu)
	diff=(2.0^(parse(Int, startExponent, base = 2) - 1023))*2.0^(-52)
	println("Przedzial: [" , start , "," , stop , "], rozłożenie: ",diff)
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	zad3(one(Float64),2*one(Float64))
	zad3(one(Float64)/2,one(Float64))
	zad3(2*one(Float64),4*one(Float64))

end

#rozruch
main()