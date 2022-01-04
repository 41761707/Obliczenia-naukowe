using BenchmarkTools
using SparseArrays

include("./blocksys.jl")

using .Functions

function main()
	println(length(ARGS))
	@time (matrix,n,l)=readA(ARGS[1])
	@time right=readB(ARGS[2]) 
	println("-----LU-----")
	@time LUMatrix=LU(matrix,n,l)
	@time LUSolution=LUSolver(matrix,right,n,l)
	#println(LUSolution)

end

main()