SET(PHIGS_LIBRARIES phigs
    ${OPENGL_LIBRARY} ${X11_LIBRARY} ${XMU_LIBRARY} m)

ADD_EXECUTABLE(objdisplay objdisplay.c glm.c )
TARGET_LINK_LIBRARIES(objdisplay ${PHIGS_LIBRARIES})

