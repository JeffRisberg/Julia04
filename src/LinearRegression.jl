#=
LinearRegression:
- Julia version: 1.6.0
- Author: jeff
- Date: 2021-05-07
=#
import Pkg; Pkg.add("PyPlot")

using CSV, DataFrames, GLM
using Printf
using PyPlot    # for drawing plots


df = DataFrame(CSV.File("data.csv"))
println(df)

n = nrow(df)
sum_x = sum(df[!, "x"])
sum_y = sum(df[!, "y"])
sum_x2 = sum(df[!, "x"] .^ 2)
sum_y2 = sum(df[!, "y"] .^ 2)
sum_xy = sum(df[!, "x"] .* df[!, "y"])

mean_x = sum_x / n
@printf("mean_x: %f\n", mean_x)

mean_y = sum_y / n
@printf("mean_y: %f\n", mean_y)

sigma2_x = sum((df[!, "x"] .- mean_x) .^ 2) / (n - 1)
@printf("sigma2_x: %f\n", sigma2_x)

sigma2_y = sum((df[!, "y"] .- mean_y) .^ 2) / (n - 1)
@printf("sigma2_y: %f\n", sigma2_y)

slope = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x * sum_x)
@printf("slope: %f\n", slope)

intercept = (sum_y - slope * sum_x) / (n)
@printf("intercept: %f\n", intercept)

ols = lm(@formula(y ~ x), df)
println(ols)

# Creating a new figure object
fig = figure()

# Plot two datasets
plot(df[!, "x"], df[!, "y"], color = "black", linewidth = 2.0, marker = "o", linestyle = "None")

# Label axes
xlabel("x", fontsize = "xx-large")
ylabel("y", fontsize = "xx-large")

# Save the figure as PNG and PDF
savefig("fit_plot.png")

# Closr the figure object
close(fig)
