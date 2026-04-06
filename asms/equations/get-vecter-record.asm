##########################################################################################################
# com
##########################################################################################################
# rsi | entree
# rdi | destination
# rcx | naof-secs
##########################################################################################################
# com-init
##########################################################################################################
sub 1000 rsp
aqs entree
mq rsi entree
aqs destination
mq rdi destination
aqs naof-entree-secs
mq rcx naof-entree-secs
aqs naof-secs-in-quad
mov 8 r8
mq r8 naof-secs-in-quad
mov rcx rax
nao rdx
divq naof-secs-in-quad rcx
aqs naof-quads
mq rax naof-quads
factq naof-secs-in-quad rax
mq naof-entree-secs r9
sub rax r9
aqs naof-secs
mq r9 naof-secs
aqs naof-quad-secs
mq rax naof-quad-secs

mq naof-quads rcx
mq entree rsi
mq destination rdi
mzq

mq entree rsi
mq naof-quad-secs r8
add r8 rsi
mq destination rdi
add r8 rdi
mq naof-secs rcx
mzs

##########################################################################################################
# com-com
##########################################################################################################
add 1000 rsp
ret

#init
ent fn droid/clerk-com.secs
aqs file
# unlink
lent fn rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 41 rsi
lent fn rdi
mov 2 rax
sys
mq rax file
# write
mq file rdi
mov 8 rdx
mq naof-secs rdx
mq entree rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
