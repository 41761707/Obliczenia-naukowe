#Radosław Wojtczak nr indeksu:254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 1

#Oznaczenia w języku, a standard IEEE754, legenda
#Float16-half
#Float32-single
#Float64-double

#ztablicowane nazwy w celu sprawniejszego wypisywania wynikow
standards=[Float16,Float32,Float64]

#funkcja wypisujaca wartosci wbudowanej funkcji eps
#dla zadanego typu zmiennopozcyjnego
function built_in_eps()
	println("Macheps- wartosci funkcji wbudowanej eps: ")
	#iteracja po tablicy w celu wypisania wartosci dla wszystkich typow
	for i in 1:3
		println(standards[i],": ",eps(standards[i]))
	end
end

#funkcja wypisujaca wartosci wygenerowane poprzez iteracyjne zmniejszanie liczby macheps, dzielac ja przez 2 za każdym razem, gdy 1.0 (w zadanym standarcie)+macheps jest ciągle różne od 1.0
function my_eps()
	println("Wartosci macheps wygenerowane przez moja funkcje: ")
	for i in 1:3
		#zmienna macheps, która po wykonaniu pętli będzie równa epsilon maszynowemu
		macheps=one(standards[i])
		#jedynka w podanym standardzie
		numberOne=one(standards[i])
		while numberOne + macheps/2 != numberOne
			macheps=macheps/2
		end
		println(standards[i],": ",macheps)
	end

end

#funkcja wypisujaca wartosci wbudowanej funkcji nextfloat
#dla zadanego typu zmiennopozcyjnego
function built_in_eta()
	println("Eta- wartosci funkcji wbudowanej nextfloat: ")
	for i in 1:3
		println(standards[i],": ",nextfloat(standards[i](0.0)))
	end
end

#funkcja wyznaczająca wartość eta poprzez iteracyjne dzielenie jedynki do momentu, aż będzie ona nierozróżnialna od zera w zadanym standardzie
function my_eta()
	println("Wartosci eta wygenerowane przez moja funkcje: ")
	for i in 1:3
		#inicjalizacja zmiennej eta jedynką w podanym standardzie, ów zmienna będzie równa najmniejszej rozróżnialnej liczbie większej od zera
		eta=one(standards[i])
		while eta/2!=zero(standards[i])
			eta=eta/2
		end
		println(standards[i],": ",eta)
	end
end
	
#funkcja wypisujaca wartosci wbudowanej funkcji floatmax
#dla zadanego typu zmiennopozcyjnego
function built_in_max()
	println("Max- wartosci funkcji wbudowanej floatmax: ")
	for i in 1:3
		println(standards[i],": ",floatmax(standards[i]))
	end
end


#funkcja wyznaczająca wartość maksymalną dla każdego podanego typu zmiennoprzecinkowego
function my_max()
	println("Wartosci max wygenerowane przez moja funkcje: ")
	for i in 1:3
		#jedynka w podanym standardzie
		numberOne=one(standards[i])
		#zmienna, która po wykonaniu funkcji będzie zawierała wartość równą największej liczbie zmiennoprzecinkowej w danym standardzie
		max=numberOne
		#dopóki potencjalny max nie jest nieskończonością zwiększamy jego wartość dwukrotnie
		while (!isinf(max*2))
			max=max*2
		end
		#jeśli zwiększylibyśmy wartość max dwukrotnie to osiągnęlibyśmy inf, więc musi zmienić strategię, aby osiągnąć wartość maksymalną- od tego momentu kreujemy nową zmienną underflow, którą będziemy dodawać (oraz zmniejszać co iterację pętli o połowę) dopóki nie otrzymamy wartości maksymalnej
		underflow=max/2
		while (!isinf(max+underflow) && (underflow>=numberOne))
			max=max+underflow
			underflow=underflow/2
		end
		println(standards[i],": ",max)
	end
end
	

#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	my_eps()
	built_in_eps()
	my_eta()
	built_in_eta()
	my_max()
	built_in_max()
end

#rozruch
main()