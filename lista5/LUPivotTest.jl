using BenchmarkTools
using SparseArrays

include("./blocksys.jl")

using .Functions

function main()
	println(length(ARGS))
	@time (matrix,n,l)=readA(ARGS[1])
	@time right=readB(ARGS[2]) 
	println("-----LU+PIVOT-----")
	@time LUPivotArray=LUPivot(matrix,n,l)
	@time LUPivotSolution=LUPivotSolver(matrix,right,n,l,LUPivotArray)
	#println(LUPivotSolution)

end

main()