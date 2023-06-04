# cmake for Program Lock

cmake_minimum_required(VERSION 3.4)

project(TEST)
set(PROGRAM_OUT ${PROJECT_SOURCE_DIR}/out)
set(EXECUTABLE_OUTPUT_PATH ${PROGRAM_OUT}/bin)
set(LIBRARY_OUTPUT_PATH ${PROGRAM_OUT}/lib)

add_executable(${PROJECT_NAME}_Lock main.cpp)
add_executable(${PROJECT_NAME} test.cpp)

