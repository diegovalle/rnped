OBJECTS=graphs/*.png data/rnped_comun.json data/rnped_federal.json run_all.Rout

.PHONY: all
all: scrape charts

scrape: data/rnped_comun.json

data/rnped_comun.json: 
	./rnped.sh

charts: data/rnped_comun.json
	R CMD BATCH --no-save run_all.R

clean :
	-rm -f $(OBJECTS)
