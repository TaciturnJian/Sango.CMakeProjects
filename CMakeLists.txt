# set  minimum version required for this project
cmake_minimum_required(VERSION 3.22)

# set output path
set(PROJECT_OUT_PAHT        ${PROJECT_SOURCE_DIR}/out)
set(EXECUTABLE_OUTPUT_PATH  ${PROJECT_OUT_PAHT}/bin)
set(LIBRARY_OUTPUT_PATH     ${PROJECT_OUT_PATH}/lib)

# set project name
project(SangoCMake)

include_directories(
    inc
)

# set library subprojects
set(LIBRARIES_SUBDIRECTORIES
    
)

# set executable subprojects
set(EXECUTABLE_SUBDIRECTORIES
    subprojects/Sango.ProgramLock
)

foreach(var_path ${LIBRARIES_SUBDIRECTORIES})
    add_subdirectory(${var_path})
endforeach()
foreach(var_path ${EXECUTABLE_SUBDIRECTORIES})
    add_subdirectory(${var_path})
endforeach()
