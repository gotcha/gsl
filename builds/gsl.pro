TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle qt

win32-msvc*: DEFINES += _CRT_SECURE_NO_WARNINGS
win32: LIBS += -lAdvapi32 -lUser32

macx: QMAKE_CFLAGS_WARN_ON += \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers \
    -Wno-self-assign \
    -Wno-constant-logical-operand \
    -Wno-sign-compare \
    -Wno-sometimes-uninitialized \
    -Wno-pointer-sign \
    -Wno-unused-function

SRC_HEADERS = \
    ggpriv.h \
    ggcomm.h \
    ggpars.h \
    ggscop.h \
    ggcode.h \
    ggobjt.h \
    version.h \
    sflbits.h \
    sfldescr.h \
    sflfind.h \
    sflini.h \
    sflmem.h \
    sflprocx.h \
    sflstr.h \
    sfluid.h \
    smthead.h \
    smtserv.h \
    sflcomp.h \
    sfldes.h \
    sflfort.h \
    sfllang.h \
    sflmesg.h \
    sflsearch.h \
    sflsymb.h \
    sflxml.h \
    smtlib.h \
    smtsimu.h \
    sflcons.h \
    sfldir.h \
    sfl.h \
    sfllbuf.h \
    sflmime.h \
    sflsha.h \
    sflsyst.h \
    sflxmll.h \
    smtmem.h \
    smtsslm.h \
    sflconv.h \
    sflenv.h \
    sflhead.h \
    sfllist.h \
    sflnode.h \
    sflslot.h \
    sfltok.h \
    sflxmls.h \
    smtmsg.h \
    smttime.h \
    sflcryp.h \
    sflexdr.h \
    sflheap.h \
    sflmail.h \
    sflprint.h \
    sflsock.h \
    sfltree.h \
    smt3.h \
    smtpriv.h \
    smtxlog.h \
    sfldate.h \
    sflfile.h \
    sflhttp.h \
    sflmath.h \
    sflproc.h \
    sflsort.h \
    sfltron.h \
    smtdefn.h \
    smtrdnsl.h

SRC_SOURCES = \
    gsl.c \
    ggobjt.c \
    ggcomm.c \
    ggscop.c \
    ggcode.c \
    ggcodem.c \
    ggpars.c \
    ggparsm.c \
    ggconv.c \
    ggdiag.c \
    ggenvt.c \
    ggfile.c \
    gggsl.c \
    ggmath.c \
    ggpcre.c \
    ggproc.c \
    ggscrp.c \
    ggsock.c \
    ggstrn.c \
    ggsymb.c \
    ggthrd.c \
    ggtime.c \
    ggxml.c \
    sflbits.c \
    sflcomp.c \
    sflcons.c \
    sflconv.c \
    sflcryp.c \
    sflcvbs.c \
    sflcvdp.c \
    sflcvds.c \
    sflcvns.c \
    sflcvsb.c \
    sflcvsd.c \
    sflcvsn.c \
    sflcvst.c \
    sflcvtp.c \
    sflcvts.c \
    sfldate.c \
    sfldes.c \
    sfldescr.c \
    sfldir.c \
    sflenv.c \
    sflexdr.c \
    sflfile.c \
    sflfind.c \
    sflfort.c \
    sflheap.c \
    sflhttp.c \
    sflini.c \
    sfllang.c \
    sfllbuf.c \
    sfllist.c \
    sflmail.c \
    sflmath.c \
    sflmem.c \
    sflmesg.c \
    sflmime.c \
    sflnode.c \
    sflprint.c \
    sflproc.c \
    sflscrit.c \
    sflsearch.c \
    sflsha.c \
    sflslot.c \
    sflsock.c \
    sflsort.c \
    sflstr.c \
    sflsymb.c \
    sflsyst.c \
    sfltok.c \
    sfltree.c \
    sfltron.c \
    sfluid.c \
    sflxml.c \
    sflxmll.c \
    sflxmls.c \
    smtecho.c \
    smtlib.c \
    smtlog.c \
    smtmsg.c \
    smtoper.c \
    smtpipe.c \
    smtpop.c \
    smtrdns.c \
    smtrdnsl.c \
    smtserv.c \
    smtsimu.c \
    smtslot.c \
    smtsmtp.c \
    smtsock.c \
    smttime.c \
    smttran.c \
    smttst1.c \
    smttst2.c \
    smttst3.c \
    smtxlog.c

for(header, SRC_HEADERS): HEADERS += ../src/$${header}
for(source, SRC_SOURCES): SOURCES += ../src/$${source}
