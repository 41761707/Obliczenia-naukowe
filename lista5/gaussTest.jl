using BenchmarkTools
using SparseArrays

include("./blocksys.jl")

using .Functions

function main()
	println(length(ARGS))
	@time (matrix,n,l)=readA(ARGS[1])
	@time right=readB(ARGS[2]) 
	println("-----GAUSS-----")
	@time gaussSolution=gauss(matrix,right,n,l)
	#println(gaussSolution)

end

main()