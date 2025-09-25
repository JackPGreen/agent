# luajit cmake
option(LUAJIT_DIR "Path of LuaJIT 2.1 source dir" ON)
option(LUAJIT_SETUP_INCLUDE_DIR "Setup include dir if parent is present" OFF)
set(LUAJIT_DIR ${FLB_PATH_ROOT_SOURCE}/${FLB_PATH_LIB_LUAJIT})
include_directories(
  ${LUAJIT_DIR}/src
  ${CMAKE_CURRENT_BINARY_DIR}/lib/luajit-cmake
)

# Save current flags before building LuaJIT
set(SAVED_CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(SAVED_CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
set(SAVED_CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")

# Clear ALL optimization flags for LuaJIT build (buildvm crashes with them)
set(CMAKE_C_FLAGS "")
set(CMAKE_C_FLAGS_RELEASE "")
set(CMAKE_EXE_LINKER_FLAGS "")

# Set minimal flags for buildvm compilation
set(BUILDVM_COMPILER_FLAGS "-O0")

add_subdirectory("lib/luajit-cmake")

# Restore original flags after LuaJIT is configured
set(CMAKE_C_FLAGS "${SAVED_CMAKE_C_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE "${SAVED_CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_EXE_LINKER_FLAGS "${SAVED_CMAKE_EXE_LINKER_FLAGS}")

set(LUAJIT_LIBRARIES "libluajit")
