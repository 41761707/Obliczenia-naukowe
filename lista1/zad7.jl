#Radosław Wojtczak nr indeksu: 254607
#Obliczenia naukowe, lista 1 labolatorium zadanie 7


#zadana funkcja w tresci zadania
function f(x)
	return sin(x)+cos(3*x)
end

#pochodna funkcji obliczona wedlug znanych zasad obliczania pochodnych
function f_derivative(x)
	return cos(x)-3*sin(3*x)
end

#implementacja innego sposobu na obliczanie pochodnej podanego w treści zadania
function derivative(x,h,f)
	return (f(x+h)-f(x))/h
end


#funkcja main odpowiedzialna za odpowiednia kolejnosc wykonywania funkcji
function main()
	#x0=1, ów x nie jest nigdzie modyfikowany, więc jest utożsamiany w dalszych obliczeniach jako liczba 1 typu float do konwersji liczb typu int (np. 2*x_zero)
	x_zero=one(Float64)
	#Pętla do n podanego w treści zadania
	for n in 0:54
		h=(2*x_zero)^(-n)
		#obliczenie pochodnej z dokładną wartością
		f_derivative_value=f_derivative(x_zero)
		#obliczenie pochodnej z przybliżoną wartością
		derivative_value=derivative(x_zero,h,f)
		#przedstawienie wyników w postaci
		#n, 1+h, pochodna dokładna, pochodna niedokładna, wartość bezwzględna z różnicy pochodnej dokładnej i niedokładnej
		println("n: ",n,", h: ",h,", 1+h: ", x_zero+h,", f'(x): ",f_derivative_value,", f~'(x): ",derivative_value,", Różnica: ",abs(derivative_value-f_derivative_value))
	end

end

#rozruch
main()