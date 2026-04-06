##########################################################################################################
# com
##########################################################################################################
# rdi | space
# rcx | naof-quads
# rbx | base
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs space
mq rdi space
aqs naof-quads
mq rcx naof-quads
aqs base
mq rbx base
aqs naof-secs-in-quad
mov 8 r8
mq r8 naof-secs-in-quad
aqs naof-quad-secs
mq naof-quads r11
factq naof-secs-in-quad r11
mq r11 naof-quad-secs

mq space rdi
mov rdi rsi
mq naof-quad-secs r11
add r11 rdi
nao r8
mq naof-quads r9
mq base r10
s seed-init
	mov r10 0 rsi
	add 8 rsi
	add 1 r10
	cmp rsi rdi
	st je seed-com
	st jmp seed-init
s seed-com

##########################################################################################################
# com
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
lq naof-quad-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
