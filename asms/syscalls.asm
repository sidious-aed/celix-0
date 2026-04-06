auto-quad-source stead-seconds
lqb maps-name rdi
auto-quad-source stead-micro-seconds
auto-quad-source naof-seconds
auto-quad-source naof-micro-seconds
auto-quad-source pid
auto-quad-source dso-site
auto-quad-source file
auto-quad-source source-file
auto-quad-source site
auto-quad-source proc-site
auto-quad-source naof-source-secs
auto-quad-source destination-file
auto-quad-source zones-1
auto-quad-source zones-2
auto-quad-source proc-files-node
add-to-rack-site 200
auto-quad-source link-name
add-to-rack-site 200
auto-quad-source naof-link-secs
entree file-name | charts/aeoliaon.chart
entree i-sim | i sim. ka tic boo tic but.\n
auto-quad-source clerk-space
add-to-rack-site 200
auto-quad-source pts-meta-space
auto-quad-source meta

# nanosleep
lqb stead-seconds rdi
mov 23 rax
sys

aqs file
# open-read
nao rsi
lent file-name rdi
mov 2 rax
sys
mq rax file

# read
mq file rdi
mov 8 rdx
lq space rsi
mov 0 rax
sys

# close
mq file rdi
mov 3 rax
sys

# open-write
mov 1f8 rdx
mov 41 rsi
mq file-name rdi
mov 2 rax
sys
mq rax file

# open-append
mov 1ff rdx
mov 441 rsi
lent file-name rdi
mov 2 rax
sys
mq rax file

# write
mq file rdi
mq naof-secs rdx
mq genseed rsi
mov 1 rax
sys

# close
mq file rdi
mov 3 rax
sys

# fork
marker init-chirp-clerk
set 39 rax
syscall
auto-quad-source pid
move-quad rax pid

# wait4
naoify rdx
naoify rsi
set ffffffffffffffff rdi
set 3d rax
syscall

# wait4
naoify rdi
set 3d rax
syscall

# exit
naoify rdi
set 3c rax
syscall

# print
leeve-entree i-sim rsi
set 1b rdx
set 1 rdi
set 1 rax
syscall

# arch_prctl
set 9e rax
# 1002 | set fs
# 1003 | get fs
# 1001 | set gc
# 1004 | get gs
set 1003 rdi
leeve-quad dso-site rsi
syscall

# brk
set 0 rdi
set c rax
syscall
add-constant 20000 rax
leeve 0 rax rdi
set c rax
syscall

# mprotect
# rdi | stack-site
# rsi | distance
# rdx | permsions-code
move-from-rack 40 rdi
set 20000 rsi
set 7 rdx
set a rax
syscall

# unlink
mq file-name rdi
mov 57 rax
sys

# lseek
mq file rdi
nao rsi
# 0 | seek-origin
# 2 | seek-completion
mov 2 rdx
mov 8 rax
sys

# file-mmap
nao rdi
mq chartf-site rsi
mov 7 rdx
mov 2 r10
mq chartf r8
nao r9
mov 9 rax
sys
mq snapci r8
mov rax 0 r8

aqs stack-site
# anonomous-mmap
nao rdi
mq chartf-site rsi
mov 7 rdx
mov 22 r10
nao r9
nao r8
mov 9 rax
sys
mq snapci r8
mov rax 0 r8

# munmap
move-quad-to meta rdi
set f4240 rsi
set b rax
syscall

# sendfile
move-quad-to source-file rsi
move-quad-to naof-source-secs rdx
move-quad-to destination-file rdi
set 28 rax
syscall

# getpid
mov 27 rax
sys
mqb rax pid

# getcwd
leeve-quad clerk-space rdi
set 50 rsi
sef 4f rax
syscall

# gettimeofday
lq naof-seconds rdi
lq zones-1 rsi
mov 60 rax
sys

# clone
#naoify rdi
set 100011 rdi
leeve-quad pid rdx
naoify rsi
set 38 rax
syscall
#move-quad rax pid
compair-constant 0 rax
# stead-stay-init-droid and stay-stead (on not-zero) droids
stay-to stay-stead-init equal

# clerical note | readlink does not seem to work good for /proc and maybe more; so, stat instead
# readlink
leeve-quad proc-files-node rdi
leeve-quad link-name rsi
set 200 rdx
set 3b rax
syscall
move-quad rax naof-link-secs

# ioctl | naof-rows, and naof-cols
naoify rdi
set 5413 rsi
leeve-quad pts-meta-space rdx
set 10 rax
syscall
marker stay-stead-init

# chmod
#tyrel@fearsome:~/celix$ base 700 8 10
#base-10 | 1c0
#tyrel@fearsome:~/celix$ base 770 8 10
#base-10 | 1f8
#tyrel@fearsome:~/celix$ base 777 8 10
#base-10 | 1ff

