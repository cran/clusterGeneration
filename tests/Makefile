# Makefile for tests subdirectory of clusterGeneration R package

# In Unix command line, do something like
#   export VERS=.v1

# after runs, do a 'diff' with previous version
# apply 'make' only to the tests on functions which have changed

all: run err

run: rancor posdef sepindex genclust design

err: eposdef esepindex egenclust

rancor: testrancor.r
	$(R_HOME)/bin/R --slave < testrancor.r > testrancor.out$(VERS) 

posdef: testposdef.r
	$(R_HOME)/bin/R --slave < testposdef.r > testposdef.out$(VERS) 

sepindex: testsepindex.r
	$(R_HOME)/bin/R --slave < testsepindex.r > testsepindex.out$(VERS) 

genclust: testgenrancl.r
	$(R_HOME)/bin/R --slave < testgenrancl.r > testgenrancl.out$(VERS) 

design: testdesign.r
	$(R_HOME)/bin/R --slave < testdesign.r > testdesign.out$(VERS) 

eposdef: errmsg_posdef.r
	$(R_HOME)/bin/R --slave < errmsg_posdef.r 2> errmsg_posdef.out$(VERS) 

esepindex: errmsg_sepindex.r
	$(R_HOME)/bin/R --slave < errmsg_sepindex.r 2> errmsg_sepindex.out$(VERS) 

egenclust: errmsg_genrancl.r
	$(R_HOME)/bin/R --slave < errmsg_genrancl.r 2> errmsg_genrancl.out$(VERS) 

#============================================================

#tarfile:
#	tar czvf testdir.tgz Makefile *.r
