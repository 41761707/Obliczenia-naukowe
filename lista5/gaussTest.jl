#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 5
#Testy dla eliminacji Gaussa


using BenchmarkTools
using SparseArrays

include("./blocksys.jl")
include("./matrixgen.jl")
using .matrixgen
using .Functions


function main()

	i=1000
	while i<50000
		blockmat(i, 4, 1.0, "generated.txt")
		(matrix,n,l)=readA("generated.txt")
		right = calculateRightSide(matrix, n, l)
		result=@timed gaussSolution=gauss(matrix,right,n,l)
		println(i,";",result[2],";",result[3])
		i=i+100
	end

end

main()