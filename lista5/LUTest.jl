using BenchmarkTools
using SparseArrays

include("./blocksys.jl")
include("./matrixgen.jl")
using .matrixgen
using .Functions

function main()
	i=20
	while i<50000
		blockmat(i, 4, 1.0, "generated.txt")
		(matrix,n,l)=readA("generated.txt")
		right = calculateRightSide(matrix, n, l)
		result=@timed LUMatrix=LU(matrix,n,l)
		result2=@timed LUSolution=LUSolver(matrix,right,n,l)
		println(i,";",result[2]+result2[2],";",result[3]+result2[3])
		println(LUSolution)
		i=i+20
	end

end

main()