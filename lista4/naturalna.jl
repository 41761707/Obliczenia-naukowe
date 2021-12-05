include("./header.jl")
using .Functions

function main()

	x = [-1.0, 0.0, 1.0, 2.0]
	f = [3.0, -4.0, 5.0, -6.0]
	fx = ilorazyRoznicowe(x, f)
	println(fx)
	println(warNewton(x,fx,1.0))
	println(warNewton(x,fx,0.5))
	a=naturalna(x, fx)
	println(a)
end

main()