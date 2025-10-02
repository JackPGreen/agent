if(LIBGIT2_FOUND)
  set(src
    git_config.c
    )

  FLB_PLUGIN(in_git_config "${src}" "")
endif()
