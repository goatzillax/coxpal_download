
URL_BASE=http://192.168.1.254

#  Don't ask me why I did it this way.

-include COXPAL/Front_Event/Makefile.targets
-include COXPAL/Front_Normal/Makefile.targets
-include COXPAL/Interior_Event/Makefile.targets
-include COXPAL/Interior_Normal/Makefile.targets

COXPAL/Front_Event:
	mkdir -p $@

COXPAL/Front_Normal:
	mkdir -p $@

COXPAL/Interior_Event:
	mkdir -p $@

COXPAL/Interior_Normal:
	mkdir -p $@

DIRS=COXPAL/Front_Event COXPAL/Front_Normal COXPAL/Interior_Event COXPAL/Interior_Normal


WGET_BASE=wget ${URL_BASE}

%.targets: ${DIRS}
	echo "TARGETS += \\" > $@
	${WGET_BASE}/${@:Makefile.targets=} -O - | grep "<tr><td>" | sed 's/.*COXPAL/COXPAL/' | sed 's/MP4.*/MP4 \\/' >> $@
	echo >> $@

%.MP4:
	${WGET_BASE}/$@ -O $@

all: ${TARGETS}

#  I SAID DO NOT ASK
clean:
	rm COXPAL/Front_Event/Makefile.targets COXPAL/Front_Normal/Makefile.targets COXPAL/Interior_Event/Makefile.targets COXPAL/Interior_Normal/Makefile.targets


