# Autogenerated wrapper script for Libmount_jll for powerpc64le-linux-gnu
export libmount

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libmount`
const libmount_splitpath = ["lib", "libmount.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmount_path = ""

# libmount-specific global declaration
# This will be filled out by __init__()
libmount_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmount = "libmount.so.1"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Libmount")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libmount_path = normpath(joinpath(artifact_dir, libmount_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmount_handle = dlopen(libmount_path)
    push!(LIBPATH_list, dirname(libmount_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

