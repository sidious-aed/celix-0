##########################################################################################################
# init | initialise
##########################################################################################################

sub-constant 2000 rsp
entree equations-file-name | secs/equations.secs
auto-quad-source equations-site
auto-quad-source naof-file-secs
auto-quad-source file
# open-read
naoify rsi
leeve-entree equations-file-name rdi
set 2 rax
syscall
move-quad rax file

# lseek
move-quad-to file rdi
naoify rsi
set 2 rdx
set 8 rax
syscall
move-quad rax naof-file-secs

# file-mmap
naoify rdi
move-quad-to naof-file-secs rsi
set 7 rdx
set 2 r10
move-quad-to file r8
naoify r9
set 9 rax
syscall
move-quad rax equations-site

# close
move-quad-to file rdi
set 3 rax
syscall

##########################################################################################################
# number-to-entree
##########################################################################################################

entree segmentiser | \n
auto-quad-source droid-space
add-to-rack-site 200

move-quad-to equations-site r15
add-constant 1 r15
leeve-quad droid-space rsi
set 10 rbx
move-quad-to equations-site rdi
leeve-quad droid-space rdi
leeve 3 rip rdx
to-domain

set 1 rdi
leeve-quad droid-space rsi
leeve 0 rax rdx
set 1 rax
syscall

set 1 rdi
leeve-entree segmentiser rsi
set 1 rdx
set 1 rax
syscall

#init
##########################################################################################################
# entree-to-number
##########################################################################################################

entree b16 | 7f0ee5e18000
move-quad-to equations-site r15
add-constant 388 r15
leeve-entree b16 rsi
set c rcx
set 10 rbx
leeve 3 rip rdx
to-domain

move-quad-to equations-site r15
add-constant 1 r15
leeve-quad droid-space rsi
set 10 rbx
leeve 0 rax rdi
leeve 3 rip rdx
to-domain

set 1 rdi
leeve-quad droid-space rsi
leeve 0 rax rdx
set 1 rax
syscall

set 1 rdi
leeve-entree segmentiser rsi
set 1 rdx
set 1 rax
syscall

##########################################################################################################
# send
##########################################################################################################

entree i-sim | i sim. ka tic boo tic but.\n
set 1 rdi
leeve-entree i-sim rsi
set 1b rdx
set 1 rax
#syscall

move-quad-to equations-site r15
add-constant 271 r15
leeve-entree i-sim rsi
leeve-quad droid-space rdi
set 1b rcx
leeve 3 rip rdx
to-domain

set 1 rdi
leeve-quad droid-space rsi
set 1b rdx
set 1 rax
syscall
#com

##########################################################################################################
# com | completion
##########################################################################################################

# munmap
move-quad-to equations-site rdi
move-quad-to naof-file-secs rsi
set b rax
syscall
add-constant 2000 rsp
ret

#init
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
#com

#init
entree droid-file-name | droid/droid-com.secs
auto-quad-source mquad
leeve-quad droid-space r8
move-quad r8 mquad
auto-quad-source droid-file
# unlink
leeve-entree droid-file-name rdi
set 57 rax
syscall
# open-write
set 1f8 rdx
set 41 rsi
leeve-entree droid-file-name rdi
set 2 rax
syscall
move-quad rax droid-file
# write
move-quad-to droid-file rdi
set 8 rdx
leeve-quad mquad rsi
set 1 rax
syscall
# close
move-quad-to droid-file rdi
set 3 rax
syscall
#com
