if(LIBGIT2_FOUND)
  set(src
    custom_git_config.c
    )

  FLB_PLUGIN(custom_git_config "${src}" "")
endif()
