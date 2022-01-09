using BenchmarkTools
using SparseArrays

include("./blocksys.jl")
include("./matrixgen.jl")
using .matrixgen
using .Functions

function main()
	#i=1000
	#while i<50000
	#	blockmat(i, 4, 1.0, "generated.txt")
	#	(matrix,n,l)=readA("generated.txt")
	#	right = calculateRightSide(matrix, n, l)
	#	result=@timed gaussSolution=matrix\right
	#	println(i,";",result[2],";",result[3])
	#	i=i+100
	#end
	(matrix,n,l)=readA(ARGS[1])	
	right = calculateRightSide(matrix, n, l)
	LUMatrix=LUPivot(matrix,n,l)
	LUSolution=LUPivotSolver(matrix,right,n,l,LUMatrix)
	outToFile("result.txt",LUSolution,n,length(ARGS))

end

main()