# Autogenerated wrapper script for finufft_jll for powerpc64le-linux-gnu
export libfinufft

using FFTW_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libfinufft`
const libfinufft_splitpath = ["lib", "libfinufft.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfinufft_path = ""

# libfinufft-specific global declaration
# This will be filled out by __init__()
libfinufft_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfinufft = "libfinufft.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"finufft")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (FFTW_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (FFTW_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libfinufft_path = normpath(joinpath(artifact_dir, libfinufft_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfinufft_handle = dlopen(libfinufft_path)
    push!(LIBPATH_list, dirname(libfinufft_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

