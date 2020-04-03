# directory where windows binaries or built sources are available
directory <- "path/to/binary/files/"

list.files(directory)

# find out the package dependencies
packages_to_install <- c("zip", "webshot", "SparseM", "data.table", "openxlsx", "DEoptimR", "pcaPP", "qvcalc", "relimp", "gdata", "caTools", "manipulateWidget", "elliptic", "contfrac", "deSolve", "TMB", "carData", "abind", "pbkrtest", "quantreg", "maptools", "rio", "fit.models", "robustbase", "rrcov", "pander", "rjson", "TH.data", "sandwich", "estimability", "colorspace", "gnm", "ca", "lmerTest", "pbivnorm", "gplots", "maps", "dichromat", "mapproj", "rgl", "libcoin", "modeltools", "coda", "pbapply", "mvtnorm", "MatrixModels", "hypergeo", "broom.mixed", "manipulate", "expm", "car", "robust", "skimr", "jmvcore", "multcomp", "PMCMR", "emmeans", "vcd", "vcdExtra", "GPArotation", "afex", "mvnormtest", "lavaan", "ROCR", "logspline", "runjags", "LaplacesDemon", "gameofthrones", "ggthemes", "jcolors", "oompaBase", "harrypotter", "palr", "pals", "scico", "mnormt", "multcompView", "EMT", "coin", "lmtest", "nortest", "bayestestR", "insight", "performance", "sjlabelled", "sjmisc", "mc2d", "BayesFactor", "broomExtra", "cowplot", "DescTools", "ez", "ggcorrplot", "ggExtra", "ggsignif", "groupedstats", "jmv", "metaBMA", "metafor", "paletteer", "psych", "purrrlyr", "rcompanion", "sjstats", "WRS2")

# differentiate between already installed packages and those not installed
packages_to_install <- setdiff(packages_to_install, installed.packages()[,1])

packages_to_install <- unlist(sapply(X = packages_to_install, 
       function(x)grep(pattern = x, 
                       fixed = TRUE, 
                       x = list.files(directory), 
                       value = TRUE)))


# install remaining packages
install.packages(paste0(directory, packages_to_install), repos = NULL, type = "win.binary") # for linux use "source" in type argument
