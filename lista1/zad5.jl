#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 5

#Wektory podane w zadaniu

x2 = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y2 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

#Konwersja na Float32
x = Array{Float32}(x2)
y = Array{Float32}(y2)

#Każda z funkcji przyjmuje odpowiednie argumenty
#x- pierwszy wektor
#y- drugi wektor
#type- typ danych 

#Funkcja odpowiedzialna za implementację algorytmu "w przód"
function a(x,y,type)
	#inicjacja sumy zerem danego typu
	sum=zero(type)
	#w pętli iteracyjnie przechodzimy po obu wektorach i mnożymy elementy znajdujące się na odpowiednich indeksach, dodając ów iloczyn do ogólnej sumy. Iterowanie wykonujemy od najmniejszego indeksu
	for i in (1:length(x))
		sum=sum+x[i]*y[i]
	end
	#Zwracamy obliczoną sumę
	return sum


end

#funkcja odpowiedzialna za implementację algorytmu "w tył"
function b(x,y,type)
	#inicjacja sumy poprzez zero danego typu
	sum=zero(type)
	#w pętli iteracyjnie przechodzimy po obu wektorach i mnożymy elementy znajdujące się na odpowiednich indeksach, dodając ów iloczyn do ogólnej sumy. Iterowanie wykonujemy od największego indeksu
	for i in (length(x):-1:1)
		sum=sum+x[i]*y[i]
	end
	#Zwracamy obliczoną sumę
	return sum
end

#funkcja implementująca algorytm "od największego do najmniejszego"
function c(x,y,type)
	#Utworzenie dwóch nowych wektorów przechowujących jedynie dodatnie (odpowiednio ujemne) wartości odpowiednich iloczynów
	positive_array=zeros(0)
	negative_array=zeros(0)
	#inicjacja sumy poprzez zero danego typu
	sum=zero(type)
	for i in (1:length(x))
		temp=x[i]*y[i]
		if(temp>zero(type))
			append!(positive_array,temp)
		else
			append!(negative_array,temp)
		end
	end
	sort!(positive_array,rev=true)
	sort!(negative_array)
	if(type==Float32)
		pos=Float32.(positive_array)
		neg=Float32.(negative_array)
		positive_sum=reduce(+,pos)
		negative_sum=reduce(+,neg)
		sum=positive_sum+negative_sum
	else
		positive_sum=reduce(+,positive_array)
		negative_sum=reduce(+,negative_array)
		sum=positive_sum+negative_sum
	end
	return sum

end

#funkcja implementująca "od najmniejszego do największego"
#funkcja ta jest analogiczna do funkcji c() z jedyną różnicą występującą w odwrotności sortowania dodatkowych wektorów
function d(x,y,type)
	positive_array=zeros(0)
	negative_array=zeros(0)
	sum=zero(type)
	for i in (1:length(x))
		temp=x[i]*y[i]
		if(temp>zero(type))
			append!(positive_array,temp)
		else
			append!(negative_array,temp)
		end
	end
	#Jedyna różnica względem funkcji c()
	sort!(positive_array)
	sort!(negative_array,rev=true)
	if(type==Float32)
		pos=Float32.(positive_array)
		neg=Float32.(negative_array)
		positive_sum=reduce(+,pos)
		negative_sum=reduce(+,neg)
		sum=positive_sum+negative_sum
	else
		positive_sum=reduce(+,positive_array)
		negative_sum=reduce(+,negative_array)
		sum=positive_sum+negative_sum
	end
	return sum
end




#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	sum_a_float32=a(x,y,Float32)
	sum_a_float64=a(x2,y2,Float64)
	sum_b_float32=b(x,y,Float32)
	sum_b_float64=b(x2,y2,Float64)
	sum_c_float32=c(x,y,Float32)
	sum_c_float64=c(x2,y2,Float64)
	sum_d_float32=d(x,y,Float32)
	sum_d_float64=d(x2,y2,Float64)
	println("Algorytm a, float32: ",sum_a_float32)
	println("Algorytm a, float64: ",sum_a_float64)
	println("Algorytm b, float32: ",sum_b_float32)
	println("Algorytm b, float64: ",sum_b_float64)
	println("Algorytm c, float32: ",sum_c_float32)
	println("Algorytm c, float64: ",sum_c_float64)
	println("Algorytm d, float32: ",sum_d_float32)
	println("Algorytm d, float64: ",sum_d_float64)
end

#rozruch
main()