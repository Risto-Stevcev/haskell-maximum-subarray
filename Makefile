GHC = ghc

.PHONY:
default: Main

.PHONY:
test: TestMaximumSubarray

Main:
	$(GHC) Main.hs

TestMaximumSubarray:
	$(GHC) TestMaximumSubarray.hs

.PHONY:
all: clean default test

.PHONY:
clean:
	rm -f *.o *.hi *.*~ TestMaximumSubarray Main
