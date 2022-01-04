using BenchmarkTools

function ReadFile(filename::String)
	open(filename) do file
		line=split(readline(file))
		n=parse(Int,line[1])
		l=parse(Int,line[2])
		matrix=Dict()
		while !eof(file)
			line=split(readline(file))
			matrix[parse(Int, line[1]),parse(Int, line[2])]=parse(Float64, line[3])
		end
		return (matrix,n,l)
	end
end
function readB(filename::String)
	open(filename) do file
		line=split(readline(file))
		n=parse(Int,line[1])
		right=Array{Float64}(undef,n)
		counter=1

		while !eof(file)
			line=split(readline(file))
			right[counter]=parse(Float64,line[1])
			counter=counter+1
		end
		return right
	end

end

function gauss(matrix::Dict{Any,Any},b::Vector{Float64},n::Int,l::Int)
	for k in 1:n-1
		for i in k+1:min(n,k+1+l)
			try
				if(eps(Float64) > abs(matrix[k,k]))
					println("Zero w mianowniku")
				end
				I=matrix[i,k]/matrix[k,k]
				matrix[i,k]=0
				for j in k+1:min(n,k+1+l)
					try
						matrix[i,j]=matrix[i,j]-I*matrix[k,j]
					catch KeyError
						continue
					end
				end

				b[i]=b[i]-I*b[k]
			catch KeyError
				continue
			end
		end
	end
	result = zeros(Float64,n)
	for a in n:-1:1
		try
			sum=0
			for z in a+1:min(n, a+l+1)
				sum =sum+matrix[a, z]*result[z]
			end
			result[a]=(b[a]-sum)/matrix[a, a]
		catch KeyError
			continue
		end
	end
	return result
end

function main()
	@time (matrix,n,l)=ReadFile(ARGS[1])
	@time right=readB(ARGS[2]) 
	println("-----GAUSS-----")
	@time gaussSolution=gauss(matrix,right,n,l)
	println(gaussSolution)
end

main()