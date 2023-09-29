DRISHTI_DEFINES = RENDERER

TEMPLATE = app

RESOURCES = paint.qrc

TARGET = 
DEPENDPATH += .

QT += opengl network
QT += widgets core gui xml

CONFIG += release

DESTDIR = ../../bin

TARGET = drishtipaint

INCLUDEPATH += graphcut \
	       slic

include( ../../drishti.pri )

# Input
FORMS += drishtipaint.ui viewermenu.ui \
	graphcutmenu.ui curvesmenu.ui \
	fibersmenu.ui superpixelmenu.ui pywidgetmenu.ui \
        ../../common/src/widgets/propertyeditor.ui

#----------------------------------------------------------------
# Windows setup for 64-bit system
#contains(Windows_Setup, Win64) {
  win32 {
         RC_ICONS += images/drishtipaint.ico

         DEFINES += USE_GLMEDIA

         INCLUDEPATH += C:\Qt\Qt-5.15.2\libQGLViewer\libQGLViewer-2.6.4 \
                        ..\..\glmedia-64 \
                        C:\cygwin64\home\acl900\drishtilib\c-blosc-1.14.3\blosc \
                        C:\cygwin64\home\acl900\vcpkg\vcpkg\installed\x64-windows\include \
                        ../../common/src/vdb \
                        ../../common/src/widgets \
                        ../../common/src/mesh

## C:\Users\acl900\AppData\Local\Programs\Python\Python38\include \
## C:\Users\acl900\AppData\Local\Programs\Python\Python38\Lib\site-packages\numpy\core\include


         QMAKE_LIBDIR += C:\Qt\Qt-5.15.2\libQGLViewer\libQGLViewer-2.6.4\lib \
                         ..\..\glmedia-64 \
                         C:\cygwin64\home\acl900\drishtilib\c-blosc-1.14.3\libs \
                         C:\cygwin64\home\acl900\vcpkg\vcpkg\installed\x64-windows\lib \
                         ..\..\common\lib     

## C:\Users\acl900\AppData\Local\Programs\Python\Python38\libs \
## C:\Users\acl900\AppData\Local\Programs\Python\Python38\Lib\site-packages\numpy\core\lib


## LIBS += QGLViewer2.lib glew32.lib glmedia.lib blosc.lib opengl32.lib glu32.lib python38.lib npymath.lib
         LIBS += QGLViewer2.lib glew32.lib glmedia.lib blosc.lib opengl32.lib glu32.lib
         LIBS += Imath-3_1.lib openvdb.lib vdb.lib
         

         # /std:c++17 added because openvdb requires this
         QMAKE_CXXFLAGS*=/std:c++17
         
  

         }
#}

unix {
 !macx {
    DEFINES += NO_GLMEDIA

    INCLUDEPATH += /home/acl900/drishtilib/c-blosc/blosc
                        
    QMAKE_LIBDIR += /home/acl900/drishtilib/c-blosc/build/blosc

    INCLUDEPATH += ../../common/src/vdb \
                   ../../common/src/widgets \
                   ../../common/src/mesh \
                   /home/acl900/drishtilib/openvdb/openvdb \
                   /home/acl900/drishtilib/openvdb/build/openvdb/openvdb \
                   /home/acl900/drishtilib/openvdb/build/openvdb/openvdb/openvdb \
                   /home/acl900/drishtilib/oneTBB/include

    QMAKE_LIBDIR += ../../common/lib \
                   /home/acl900/drishtilib/openvdb/build/openvdb/openvdb \
                   /home/acl900/drishtilib/oneTBB/build/gnu_11.3_cxx11_64_relwithdebinfo

    
    LIBS += -lblosc -lvdb -lopenvdb -ltbb -lImath
    }
 }

#----------------------------------------------------------------
# MacOSX setup
macx {
    LIBS += -lGLEW -framework QGLViewer -framework GLUT
}
#----------------------------------------------------------------

HEADERS += connectviewer.h \
        commonqtclasses.h \
	boundingbox.h \
	drishtipaint.h \
	curvegroup.h \
        clipinformation.h \
        clipplane.h \
	clipobject.h \
	clipgrabber.h \
	fiber.h \
	fibergroup.h\
	slices.h \
	imagewidget.h \
        curves.h \
        curveswidget.h \
        global.h \
        handleexternal.h \
        livewire.h \
	mybitarray.h \
	myslider.h \
	mymanipulatedframe.h \
 	morphcurve.h \
 	morphslice.h \
	splineeditor.h \
	splineeditorwidget.h \
	splineinformation.h \
	splinetransferfunction.h \
	staticfunctions.h \
	transferfunctioncontainer.h \
	transferfunctioneditorwidget.h \
	transferfunctionmanager.h \
	tagcoloreditor.h \
	coloreditor.h \
	opacityeditor.h \
	viewer.h \
	viewer3d.h \
	volume.h \
	volumefilemanager.h \
	volumeinformation.h \
	volumemask.h \
	volumeoperations.h \
	graphcut/graph.h \
	graphcut/graphcut.h \
	graphcut/block.h \
	graphcut/point.h \
	lookuptable.h \
	showhelp.h \
	getmemorysize.h \
	popupslider.h \
	shaderfactory.h \
	remaphistogramline.h \
	remaphistogramwidget.h \
	slicer3d.h \
        slic/slic.h \
        filehandler.h \
        checkpointhandler.h \
        pywidget.h \
        pywidgetmenu.h \
        ../../common/src/widgets/propertyeditor.h \
        ../../common/src/widgets/dcolordialog.h \
        ../../common/src/widgets/dcolorwheel.h \
	../../common/src/widgets/gradienteditor.h \
        ../../common/src/widgets/gradienteditorwidget.h \
        ../../common/src/mesh/meshtools.h \
        ../../common/src/mesh/ply.h


SOURCES += drishtipaint.cpp \
	main.cpp \
	boundingbox.cpp \
	curvegroup.cpp \
        clipinformation.cpp \
        clipplane.cpp \
	clipobject.cpp \
	clipgrabber.cpp \
	fiber.cpp \
	fibergroup.cpp\
	slices.cpp \
	imagewidget.cpp \
        curves.cpp \
	curveswidget.cpp \
	global.cpp \
        handleexternal.cpp \
        livewire.cpp \
	mybitarray.cpp \
	myslider.cpp \
	mymanipulatedframe.cpp \
 	morphcurve.cpp \
 	morphslice.cpp \
	splineeditor.cpp \
	splineeditorwidget.cpp \
	splineinformation.cpp \
	splinetransferfunction.cpp \
	staticfunctions.cpp \
	transferfunctioncontainer.cpp \
	transferfunctioneditorwidget.cpp \
	transferfunctionmanager.cpp \
	tagcoloreditor.cpp \
	coloreditor.cpp \
	opacityeditor.cpp \
	viewer.cpp \
	viewer3d.cpp \
	volume.cpp \
	volumefilemanager.cpp \
	volumeinformation.cpp \
	volumemask.cpp \
	volumeoperations.cpp \
	graphcut/graph.cpp \
	graphcut/graphcut.cpp \
	showhelp.cpp \
	getmemorysize.cpp \
	popupslider.cpp \
	shaderfactory.cpp \
	remaphistogramline.cpp \
	remaphistogramwidget.cpp \
	slicer3d.cpp \
	slic/slic.cpp \
        filehandler.cpp \
        checkpointhandler.cpp \
        pywidget.cpp \
        pywidgetmenu.cpp \
        ../../common/src/widgets/propertyeditor.cpp \
        ../../common/src/widgets/dcolordialog.cpp \
	../../common/src/widgets/dcolorwheel.cpp \
	../../common/src/widgets/gradienteditor.cpp \
	../../common/src/widgets/gradienteditorwidget.cpp \
        ../../common/src/mesh/meshtools.cpp \
        ../../common/src/mesh/ply.c
