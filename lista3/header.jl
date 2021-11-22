#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 3
#Zadanie 1,2,3

#Ponizsze funkcje sa doslowna implementacja slajdow przedstawionych na wykladzie


module Functions

	export mbisekcji, mstycznych, msiecznych

	"""
    Rozwiązanie f(x) = 0 przy użyciu metody bisekcji.
    Dane wejściowe:
    f               – f(x) jako anonimowa funkcja
    a,b             – końce przedziału początkowego
    delta, epsilon  – dokładność obliczeń
    Dane wyjściowe:
    (r, v, it, err)
    r   – przybliżenie pierwiastka równania f(x) = 0
    v   – f(r)
    it  – liczba iteracji
    err – kod błedu
        0 – brak błędu
        1 – funkcja nie zmienia znaku v [a,b]
    """
	function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
		it=0
		u=f(a)
		z=f(b)
		e=b-a
		if(sign(u)==sign(z))
			return (0,0,0,1)
		end
		while true
			it=it+1
			e=e/2;
			r=a+e
			v=f(r)

			if(abs(e)<delta || abs(v)<epsilon)
				return (r,v,it,0)
			end
			if(sign(v)!=sign(u))
				b=r
				z=v
			else
				a=r
				u=v
			end
		end

	end

	"""
    Rozwiązanie f(x) = 0 przy użyciu metody Newtona.
    Dane wejściowe:
    f               – f(x) jako anonimowa funkcja
    pf              – f'(x) jako anonimowa funkcja
    x0              - przybliżenie początkowe
    delta, epsilon  – dokładność obliczeń
    maxit           - maksymalna dopuszczalna liczba iteracji
    Dane wyjściowe:
    (r, v, it, err)
    r   – przybliżenie pierwiastka równania f(x) = 0
    v   – f(r)
    it  – liczba iteracji
    err – kod błedu
        0 – metoda zbieżna
        1 - nie osiągnięto wymaganej dokładności w maxit iteracji
        2 – pochodna bliska zeru
    """
    
	function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
		v=f(x0)
		if(abs(v)<epsilon)
			return(x0,v,1,0)
		end
		if(abs(pf(x0))<epsilon)
			return(0,0,0,2)
		end

		for i in 1:maxit
			x1=x0-v/pf(x0)
			v=f(x1)
			if(abs(x1-x0)<delta || abs(v)<epsilon)
				return(x1,v,i,0)
			end
			x0=x1

		end
		return(0,0,0,1)
	end

	"""
    Rozwiązanie f(x) = 0 przy użyciu metody siecznych.
    Dane wejściowe:
    f               – f(x) jako anonimowa funkcja
    x0,x1           - przybliżenia początkowe
    delta, epsilon  – dokładność obliczeń
    maxit           - maksymalna dopuszczalna liczba iteracji
    Dane wyjściowe:
    (r, v, it, err)
    r   – przybliżenie pierwiastka równania f(x) = 0
    v   – f(r)
    it  – liczba iteracji
    err – kod błedu
        0 – metoda zbieżna
        1 - nie osiągnięto wymaganej dokładności w maxit iteracji
    """
	function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64,
	maxit::Int)
		fx0=f(x0)
		fx1=f(x1)

		for i in 1:maxit
			if(abs(fx0)>abs(fx1))
				temp=x0
				x0=x1
				x1=temp
				ftemp=fx0
				fx0=fx1
				fx1=ftemp
			end
			s=(x1-x0)/(fx1-fx0)
			x1=x0
			fx1=fx0
			x0=x0-(fx0*s)
			fx0=f(x0)
			if(abs(x1-x0)<delta || abs(fx0)<epsilon)
				return(x0,fx0,i,0)
			end
		end
		return (0,0,0,1)

	end
end