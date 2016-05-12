# dabeer
CONTEXT macros for Persian

These are a collection of macros that I use to typeset RTL Persian texts using CONTEXT.  `dabeer` means a _scribe_ in Persian.

*Warning*: Since many RTL/Persian issues are fixed and features are added in the beta, we recommend trying a recent beta and not rely on stable version in the standard TeX distributions.  The code has been tested on CONTEXT beta version 2016.05.01 09:52 with LuaTeX version 0.95.  See the instructions for getting a recent [Standalone copy](http://wiki.contextgarden.net/ConTeXt_Standalone).

*Installation*: Copy the contents of `texmf-local` directory to a directory of the same name within the context distribution and then run `context --generate` to update the file list cache.  The install.sh script is an example script doing this.

## Package structure
### tests/
Several small and medium-size documents for testing CONTEXT's RTL/Persian functionality.  Some are _usage_ examples while I also try to collect here some of the bugs that I want to report.

### texmf-local/
Contents of the package should be copied to the TeX tree.
#### texmf-local/tex/context/sample/
Snippets copied from Farsi Wikipedia to avoid boring texts in the test files.

### extras/
Some useful scripts and config files.