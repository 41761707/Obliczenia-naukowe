#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 4

#Funkcja mająca na celu wyznaczenie najmniejszej liczby, która nie spełnia warunków zadania
function zad4()
	#inicjacja jedynką dla typu Float64
	number=one(Float64)
	#dopóki obliczanie podanego w treści zadania równania nie skutkuje niespodziewanymi wynikami lub dopóki nie dojdziemy do dwójki bierzemy pod lupę następną liczbę zmiennoprzecinkową z przedziału [1,2]
	while (number*(one(Float64)/number) == one(Float64) && number<2*one(Float64))
		number=nextfloat(number)
	end
	#Wypisujemy odpowiednią liczbę
	println("Wyznaczona liczba: ",number)
	println("Wynik działania dla tej liczby: ", number*(one(Float64)/number))
end



#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	zad4()

end

#rozruch
main()