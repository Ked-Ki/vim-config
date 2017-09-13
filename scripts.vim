if did_filetype()    " filetype already set..
  finish        " ..don't do these checks
endif
if getline(1) =~ '^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d\.\d\d\d \(DEBUG\|INFO\|TRACE\|WARN\)'
  set filetype=cleversafe
endif
