#=
Distributions:
- Julia version: 1.6.0
- Author: jeff
- Date: 2021-05-09
=#

using Random, Distributions

Random.seed!(123) # Setting the seed

d = Normal()

x = rand(d, 100)
println(x)
