using BenchmarkTools
using SparseArrays

include("./blocksys.jl")

using .Functions

function main()
	println(length(ARGS))
	@time (matrix,n,l)=readA(ARGS[1])
	@time right=readB(ARGS[2]) 
	#println("-----GAUSS-----")
	#@time gaussSolution=gauss(matrix,right,n,l)
	#println(gaussSolution)
	#println("-----GAUSS+PIVOT-----")
	#@time gaussPivotSolution=gaussPivot(matrix,right,n,l)
	#println(gaussPivotSolution)
	#println("-----LU-----")
	#@time LUMatrix=LU(matrix,n,l)
	#@time LUSolution=LUSolver(matrix,right,n,l)
	#println(LUSolution)
	println("-----LU+PIVOT-----")
	@time LUPivotArray=LUPivot(matrix,n,l)
	@time LUPivotSolution=LUPivotSolver(matrix,right,n,l,LUPivotArray)
	println(LUPivotSolution)

end

main()