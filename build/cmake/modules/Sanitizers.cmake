option(JAS_ENABLE_ASAN "Enable Address Sanitizer" false)
option(JAS_ENABLE_USAN "Enable Undefined-Behavior Sanitizer" false)
option(JAS_ENABLE_LSAN "Enable Leak Sanitizer" false)
option(JAS_ENABLE_MSAN "Enable Memory Sanitizer" false)

macro(jas_enable_sanitizer name)
	if (${name} MATCHES "asan")
		set(SANITIZER_COMPILE_FLAGS "-fsanitize=address")
		set(SANITIZER_LINKER_FLAGS "-fsanitize=address")
	elseif (${name} MATCHES "usan")
		set(SANITIZER_COMPILE_FLAGS "-fsanitize=undefined")
		set(SANITIZER_LINKER_FLAGS "-fsanitize=undefined")
	elseif (${name} MATCHES "leak")
		set(SANITIZER_COMPILE_FLAGS "-fsanitize=leak")
		set(SANITIZER_LINKER_FLAGS "-fsanitize=leak")
	elseif (${name} MATCHES "memory")
		set(SANITIZER_COMPILE_FLAGS "-fsanitize=memory")
		set(SANITIZER_LINKER_FLAGS "-fsanitize=memory")
	endif()
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SANITIZER_COMPILE_FLAGS}")
	set(CMAKE_LD_FLAGS "${CMAKE_LD_FLAGS} ${SANITIZER_LINKER_FLAGS}")
endmacro()

if (JAS_ENABLE_ASAN)
	jas_enable_sanitizer("asan")
endif()
if (JAS_ENABLE_USAN)
	jas_enable_sanitizer("usan")
endif()
if (JAS_ENABLE_LSAN)
	jas_enable_sanitizer("lsan")
endif()
if (JAS_ENABLE_MSAN)
	jas_enable_sanitizer("msan")
endif()

