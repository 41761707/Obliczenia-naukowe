#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 4
#Zadanie 1,2,3,4

module Functions
	using PyCall
	plt=pyimport("matplotlib.pyplot")
	export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
	"""
		Funkcja obliczająca ilorazy różnicowe
		Dane:
			x- wektor długości n+1 zawierający węzły x_{0},...,x_{n}
			x[1]=x_{0},...,x[n+1]=x_{n}
			f- wektor długości n+1 zawierający wartości interpolowanej
			funkcji w węzłach f(x0),...,f(xn)
		Wyniki:
			fx – wektor długości n+1 zawierający obliczone ilorazy różnicowe
			fx[1]=f[x0],fx[2]=f[x0,x1],...,fx[n]=f[x0,...,xn−1],fx[n+1]=f[x0,..., xn].
	"""
	function ilorazyRoznicowe(x::Vector{Float64},f::Vector{Float64})
 		fx=[item for item in f]
 		size=length(f)
 		for i in 1:size
 			for j in size:-1:i+1
 				fx[j]=(fx[j]-fx[j-1])/(x[j]-x[j-i])
 			end
 		end

 		return fx
	end

	"""
		Funkcja obliczającą wartość wielomianu interpolacyjnego stopnia n w postaci Newtona Nn(x) w punkcie x = t za pomocą uogólnionego algorytmu Hornera, w czasie O(n)

		Dane:
			x – wektor długości n+1 zawierający węzły x0,...,xn
			x[1]=x0,...,x[n+1]=xn
			fx – wektor długości n+1 zawierający ilorazy różnicowe
			fx[1]=f[x0],
			fx[2]=f[x0, x1],...,fx[n]=f[x0,..., xn−1],fx[n+1]=f[x0,...,xn]
			t – punkt, w którym należy obliczyć wartość wielomianu

		Wyniki:
			nt – wartość wielomianu w punkcie t.
	"""

	function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
		size=length(fx)
		nt=fx[size]
		for i in size-1:-1:1
			nt=fx[i]+(t-x[i])*nt
		end

		return nt

	end


	"""
		Funkcja obliczająca, znając współczynniki wielomianu interpolacyjnego w postaci Newtona c0 = f[x0],c1=f[x0, x1],c2 =f[x0,x1,x2],...,cn=f[x0,..., xn](ilorazy różnicowe) oraz węzły x0, x2,...,xn, w czasie O(n2), współczynniki postaci naturalnej a0,...,an tzn.
		a_{n}x_{n}+ a_{n−1}x_{n−1} + . . . + a_{1}x + a_{0} 

		Dane:
			x – wektor długości n + 1 zawierający węzły x0,...,xn
			x[1]=x0,...,x[n+1]=xn
			fx – wektor długości n + 1 zawierający ilorazy różnicowe
			fx[1]=f [x0],
			fx[2]=f [x0, x1],..., fx[n]=f [x0,...,xn−1], fx[n+1]=f [x0,...,xn]

		Wyniki:
			wektor długości n + 1 zawierający obliczone współczynniki postaci naturalnej
			a[1]=a0,
			a[2]=a1,..., a[n]=an−1, a[n+1]=an.
	"""
	function naturalna(x::Vector{Float64}, fx::Vector{Float64})

		size=length(fx)
		a=[item for item in fx]
		for i in size-1:-1:1
			a[i]=fx[i]-a[i+1]*x[i]
			for j in i+1:size-1
				a[j]=a[j]-a[j+1]*x[i]
			end
		end

		return a

	end


	"""
		Funkcja rysująca wielomian interpolacyjny i interpolowaną funkcję korzystając z pakietu PyPlot
		Dane:
			f – funkcja f (x) zadana jako anonimowa funkcja,
			a,b – przedział interpolacji
			n – stopień wielomianu interpolacyjnego
		Wyniki:
			– funkcja rysuje wielomian interpolacyjny i interpolowaną
			funkcję w przedziale [a, b].
	"""

	function rysujNnfx(f,a::Float64,b::Float64,n::Int)


		x=zeros(0)
		y=zeros(0)

		h=(b-a)/n
		for i in 1:n+1
			append!(x,a+(i-1)*h)
			append!(y,f(x[i]))
		end

		interY=zeros(0)
		newX=zeros(0)
		newY=zeros(0)
		ilorazy=ilorazyRoznicowe(x,y)

		tmp=(n+1)*10
		newH=(b-a)/tmp
		for i in 1:tmp
			append!(newX,a+(i-1)*newH)
			append!(interY,warNewton(x,ilorazy,newX[i]))
			append!(newY,f(newX[i]))
		end
		plt.clf()
		plt.plot(newX,newY,label="Pierwotna")
		plt.plot(newX,interY,label="Interpolowana")
		plt.legend()
		plt.grid(true)
		plt.savefig(string("wykresy/", f, "-", n, ".png"))

	end
end