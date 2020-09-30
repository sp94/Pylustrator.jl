# Pylustrator.jl
A Julia wrapper for Python's [pylustrator](https://pylustrator.readthedocs.io/en/latest/).

### Example usage
```julia
using PyPlot, Pylustrator

plot([0,1], [0,1])

@pylustrator show()
```
