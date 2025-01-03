# ./launcher/setup.py
from distutils.sysconfig import get_config_vars
import os
# Define clang to compile
os.environ["CC"] = "clang"
os.environ["CXX"] = "clang++"

# cfg_vars = get_config_vars()
# cfg_vars["CC"] = "clang"
# cfg_vars["CXX"] = "clang++"

# Import Cython libraries
from setuptools import setup
from Cython.Build import cythonize

# Build laucher.pyx
setup(
    name="Launcher",
    ext_modules=cythonize("launcher.pyx", language_level="3"),
    zipsafe=False,
)