MACRO(USE_SURFACE)
  covise_find_package(Surface)
  IF ((NOT SURFACE_FOUND)  AND (${ARGC} LESS 1))
    USING_MESSAGE("Skipping because of missing SURFACE SDK")
    RETURN()
  ENDIF((NOT SURFACE_FOUND) AND (${ARGC} LESS 1))
  IF(NOT SURFACE_USED AND SURFACE_FOUND)
    SET(SURFACE_USED TRUE)
    SET(EXTRA_REFS ${EXTRA_REFS} ${SURFACE_LIBRARIES})
  ENDIF()
ENDMACRO(USE_SURFACE)
