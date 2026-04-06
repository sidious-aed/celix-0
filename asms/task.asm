sub-constant 1000 rsp
auto-quad-source stead-seconds
set 1 r8
move-quad r8 stead-seconds
auto-quad-source stead-micro-seconds
set aed r8
move-quad r8 stead-micro-seconds
marker task-et
# nanosleep
leeve-quad stead-seconds rdi
set 23 rax
syscall
stay-to task-et always
