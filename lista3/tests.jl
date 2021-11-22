include("./header.jl")

using Test
using .Functions

@testset "Test metody bisekcji" begin
    @test mbisekcji(x->3x^2+x-2,-2.0,0.0,10^(-4),10^(-4))[1]==-1.0
    @test mbisekcji(x->3x^2+x-2,0.0,1.0,10^(-4),10^(-4))[1]≈Float64(2/3) atol=10^(-4)
    @test mbisekcji(x->3x^2+x-2,5.0,7.0,10^(-4),10^(-4))[4]==1
    @test mbisekcji(x->3x^3-2x^2-3x+2,-2.0,0.0,10^(-2),10^(-2))[1]==-1.0
    @test mbisekcji(x->3x^3-2x^2-3x+2,0.0,1.0,10^(-2),10^(-2))[1]≈Float64(2/3) atol=10^(-2)
end

@testset "Test metody stycznych" begin
    @test mstycznych(x->3x^2+x-2,x->6x+1,-2.0,10^(-4),10^(-4),100)[1]≈-1 atol=10^(-4)
    @test mstycznych(x->3x^2+x-2,x->6x+1,1.0,10^(-4),10^(-4),100)[1]≈Float64(2/3) atol=10^(-4)
    @test mstycznych(x->3x^2+x-2,x->6x+1,100.0,10^(-4),10^(-4),3)[4]==1
    @test mstycznych(x->3x^3-2x^2-3x+2,x->9x^2-4x-3,-2.0,10^(-2),10^(-2),20)[1]≈-1.0 atol=10^(-2)
    @test mstycznych(x->3x^3-2x^2-3x+2,x->9x^2-4x-3,2.0,10^(-2),10^(-2),20)[1]≈1.0 atol=10^(-2)


end

@testset "Test metody siecznych" begin
    @test msiecznych(x->3x^2+x-2,-2.0,0.0,10^(-4),10^(-4),100)[1]≈-1 atol=10^(-4)
    @test msiecznych(x->3x^2+x-2,0.0,1.0,10^(-4),10^(-4),100)[1]≈Float64(2/3) atol=10^(-4)
    @test msiecznych(x->3x^2+x-2,0.0,100.0,10^(-4),10^(-4),3)[4]==1
    @test msiecznych(x->3x^3-2x^2-3x+2,-5.0,0.0,10^(-2),10^(-2),20)[1]≈Float64(2/3) atol=10^(-2)
    @test msiecznych(x->3x^3-2x^2-3x+2,0.0,2.0,10^(-2),10^(-2),20)[1]≈1 atol=10^(-2)
end