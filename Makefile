global:
	Rscript -e 'source("build.R")' dontOpen

reditele:
	Rscript -e 'source("build_reditele.R")' dontOpen

ucitele:
	Rscript -e 'source("build_ucitele.R")' dontOpen

ucitele_pilot:
	Rscript -e 'source("build_ucitele.R")' pilot

ucitele_redone:
	Rscript -e 'source("build_ucitele_redone.R")' dontOpen

rodice:
	Rscript -e 'source("build_rodice.R")' dontOpen
