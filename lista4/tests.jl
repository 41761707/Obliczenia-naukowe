include("./header.jl")

using Test
using .Functions

x1 = [-1.0, 0.0, 1.0, 2.0]
f1 = [3.0, -4.0, 5.0, -6.0]
fx1 = ilorazyRoznicowe(x1, f1)
Fx1=[3.0, -7.0, 8.0, -6.0]
Nx1=[-4.0, 7.0, 8.0, -6.0]


@testset "Test funkcji ilorazyRoznicowe" begin
	@test isapprox(fx1,Fx1)
end
@testset "Test funkcji warNewton" begin
	@test isapprox(warNewton(x1, fx1, 1.0), 5.0)
	@test isapprox(warNewton(x1, fx1, 0.5), 0.75)
end
@testset "Test funkcji naturalna" begin
	@test isapprox(naturalna(x1,fx1),Nx1)
end
