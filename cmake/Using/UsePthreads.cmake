MACRO(USE_PTHREADS)
   if(MSVC OR MINGW)
      covise_find_package(Pthreads)
      if (NOT PTHREADS_FOUND)
         using_message("Skipping pthread for Windows was not found!")
         return()
      endif()
      include_directories(SYSTEM ${PTHREADS_INCLUDE_DIR})
      set(EXTRA_LIBS ${PTHREADS_LIBRARIES} ${EXTRA_LIBS})
   else(MSVC OR MINGW)
      include_directories(SYSTEM ${PTHREAD_INCLUDE_DIR})
      set(EXTRA_LIBS ${CMAKE_THREAD_LIBS_INIT} ${EXTRA_LIBS})
      set(EXTRA_LIBS ${PTHREAD_LIBRARY} ${EXTRA_LIBS})
   endif(MSVC OR MINGW)

   if(CMAKE_COMPILER_IS_GNUCXX OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
      if(MINGW)
         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mthreads")
      else()
         set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")
         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
         set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -pthread")
         set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pthread")
      endif()
   endif()

   if(NOT PTHREADS_USED AND PTHREADS_FOUND)
      set(PTHREADS_USED TRUE)
   endif()
ENDMACRO(USE_PTHREADS)
