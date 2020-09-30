module Pylustrator

using PyCall, PyPlot, MacroTools

macro pylustrator(expr)
    # use rmlines so stacktrace returns expected line number
    return rmlines(quote
        pylustrator = pyimport("pylustrator")
        pylustrator.start()
        # get filename and line position
        stack_position = stacktrace()[1]
        filename = abspath(string(stack_position.file))
        lineno = stack_position.line
        # @assert filename == @__FILE__
        ct = pylustrator.change_tracker
        ct.custom_stack_position = ct.CustomStackPosition(filename, lineno)
        # wrap generated code in a py"""...""" string
        ct.custom_prepend = "py\"\"\"from matplotlib import pyplot as plt;"
        ct.custom_append = "\"\"\""
        $expr
    end)
end

export @pylustrator, @py_str

end # module
