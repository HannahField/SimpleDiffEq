module SimpleDiffEq
import DifferentialEquations

function ODESolver(func::Function, initial_conditions::Vector, time_span::Tuple{Number,Number})
    problem = ODEProblem(func,initial_conditions,time_span)
    return solve(problem,Tsit5())
end

function ODESolver(func::Function, initial_conditions::Vector, time_span::Union{Vector,AbstractRange})
    problem = ODEProblem(func,initial_conditions,(time_span[1],time_span[end]))
    return solve(problem,Tsit5(),adaptive = false, tstops = time_span)
end


end # module