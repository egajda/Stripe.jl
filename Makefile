INSTALL='\
using Pkg;\
Pkg.instantiate();\
Pkg.add("Conda");\
Pkg.build("Conda");\
using Conda;\
Conda.add("stripe");\
Pkg.add("PyCall");\
Pkg.build("PyCall");\
'

c:
	julia --project=.

install:
	rm -rf ~/.julia/conda
	julia --project=. -e 'using Pkg; Pkg.instantiate()'
	julia --project=. -e $(INSTALL)

