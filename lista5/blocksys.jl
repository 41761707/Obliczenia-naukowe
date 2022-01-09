#Radoslaw Wojtczak, nr indeksu: 254607
#Obliczenia Naukowe Lista 5
#Wymagane funkcje

module Functions
	export readA,readB,gauss,gaussPivot,LUPivotSolver,LUPivot,LUSolver,LU,calculateRightSide, outToFile
	using BenchmarkTools
	using SparseArrays
	using LinearAlgebra

	function readA(filename::String)
		open(filename) do file
			line = split(readline(file))
			n = parse(Int, line[1])
			l = parse(Int, line[2])
			v = convert(Int, n / l)
			size = n*l+3*(n-l)
			x = Array{Int}(undef,size)
			y = Array{Int}(undef,size)
			value = Array{Float64}(undef,size)
			counter=1

			while !eof(file)
				line = split(readline(file))
				x[counter] = parse(Int, line[1])
				y[counter] = parse(Int, line[2])
				value[counter] = parse(Float64, line[3])
				counter=counter+1
			end
			matrix = sparse(x, y, value)
			return (matrix, n, l)
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
	function outToFile(filename::String, x::Array{Float64}, n::Int, ARGS::Int)
		open(filename, "w") do file
			if ARGS==1
				onlyOnes = ones(n)
				println(file, norm(onlyOnes - x) / norm(x))
			end
			for i in 1:n
				println(file, x[i])
			end
		end
	end

	function gauss(matrix::SparseMatrixCSC{Float64, Int},b::Vector{Float64},n::Int,l::Int)
		for k in 1:n-1
			for i in k+1:min(n,k+1+l)
				if(eps(Float64) > abs(matrix[k, k]))
					println("Zero w mianowniku")
					break
				end
				I=matrix[i,k]/matrix[k,k]
				matrix[i,k]=0
				for j in k+1:min(n,k+l)
					matrix[i,j]=matrix[i,j]-I*matrix[k,j]
				end

				b[i]=b[i]-I*b[k]
			end
		end
		result = zeros(Float64,n)
		for a in n:-1:1
			sum=0
			for z in a+1:min(n, a+l)
				sum =sum+matrix[a, z]*result[z]
			end
			result[a]=(b[a]-sum)/matrix[a, a]
		end
		return result

	end


	function gaussPivot(matrix::SparseMatrixCSC{Float64, Int},b::Vector{Float64},n::Int,l::Int)
		pivot=collect(1:n)
		for k in 1:n-1
			row=k
			value=abs(matrix[pivot[k],k])

			for i in k+1:min(n,k+1+l)
				if(abs(matrix[pivot[i],k])>value)
					value=abs(matrix[pivot[i],k])
					row=i
				end
			end

			pivot[row],pivot[k]=pivot[k],pivot[row]

			for i in k+1:min(n,k+1+l+l)
				if(eps(Float64) > abs(matrix[pivot[k], k]))
					println("Zero w mianowniku")
					break
				end
				I=matrix[pivot[i],k]/matrix[pivot[k],k]
				matrix[pivot[i],k]=0
				for j in k+1:min(n,k+l+l)
					matrix[pivot[i],j]=matrix[pivot[i],j]-I*matrix[pivot[k],j]
				end

				b[pivot[i]]=b[pivot[i]]-I*b[pivot[k]]
			end
		end
		result = zeros(Float64,n)
		for a in n:-1:1
			sum=0
			for z in a+1:min(n, a+l+l)
				sum =sum+matrix[pivot[a], z]*result[z]
			end
			result[a]=(b[pivot[a]]-sum)/matrix[pivot[a], a]
		end
		return result
	end

	function LU(matrix::SparseMatrixCSC{Float64,Int64},n::Int,l::Int)
		for k in 1:n-1
			for i in k+1:min(n,k+1+l)
				if eps(Float64)>abs(matrix[k,k])
					println("Zerowe w mianowniku")
					break
				end
				I=matrix[i,k]/matrix[k,k]
				matrix[i,k]=I
				for j in k+1:min(n,k+l)
					matrix[i,j]=matrix[i,j]-I*matrix[k,j]
				end
			end
		end
	end

	function LUSolver(matrix::SparseMatrixCSC{Float64,Int64},b::Vector{Float64},n::Int,l::Int)
		for k in 1:n-1
	        for i in k+1:min(n, k+l+1)
	            b[i]=b[i]-matrix[i, k]*b[k]
	        end
	    end
		result = zeros(Float64,n)
		for a in n:-1:1
			sum=0
			for z in a+1:min(n, a+l)
				sum =sum+matrix[a, z]*result[z]
			end
			result[a]=(b[a]-sum)/matrix[a, a]
		end
		return result
	end

	function LUPivot(matrix::SparseMatrixCSC{Float64,Int64},n::Int,l::Int)
		pivot=collect(1:n)
		for k in 1:n-1
			row=k
			value=abs(matrix[pivot[k],k])

			for i in k+1:min(n,k+1+l)
				if(abs(matrix[pivot[i],k])>value)
					value=abs(matrix[pivot[i],k])
					row=i
				end
			end

			pivot[row],pivot[k]=pivot[k],pivot[row]

			for i in k+1:min(n,k+1+l+l)
				if(eps(Float64) > abs(matrix[pivot[k], k]))
					println("Zero w mianowniku")
					break
				end
				I=matrix[pivot[i],k]/matrix[pivot[k],k]
				matrix[pivot[i],k]=I
				for j in k+1:min(n,k+l+l)
					matrix[pivot[i],j]=matrix[pivot[i],j]-I*matrix[pivot[k],j]
				end
			end
		end
		return pivot
	end

	function LUPivotSolver(matrix::SparseMatrixCSC{Float64,Int64},b::Vector{Float64},n::Int,l::Int,pivot::Vector{Int})
		for k in 1:n-1
	        for i in k+1:min(n, k+l+1+l)
	            b[pivot[i]]=b[pivot[i]]-matrix[pivot[i], k]*b[pivot[k]]
	        end
	    end
		result = zeros(Float64,n)
		for a in n:-1:1
			sum=0
			for z in a+1:min(n, a+l+l)
				sum =sum+matrix[pivot[a], z]*result[z]
			end
			result[a]=(b[pivot[a]]-sum)/matrix[pivot[a], a]
		end
		return result

	end

	function calculateRightSide(M::SparseMatrixCSC{Float64,Int}, n::Int, l::Int)
		solution = zeros(Float64, n)
		for i in 1:n
	        startC = convert(Int, max(i - (2 + l), 1))
	        endC = convert(Int, min(i + l, n))

	        for j in startC:endC
	            solution[i] += M[i, j]
	        end
    	end
        
    	return solution
	end
end