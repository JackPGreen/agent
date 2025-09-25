message(STATUS "Running Enterprise build set up")
FLB_DEFINITION(FLB_ENTERPRISE)

# For legacy builds we need to handle this explicitly in case it is removed from the source
if(CMAKE_INSTALL_PREFIX MATCHES "/opt/td-agent-bit")
  set(FLB_TD ON)
endif()
