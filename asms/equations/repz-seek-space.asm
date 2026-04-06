##########################################################################################################
# get-naof-secs
# rdi | entree
# rdx | naof-entree-secs
# rsi | seek
# rcx | naof-seek-secs
##########################################################################################################
# com-init
##########################################################################################################
sub 1000 rsp
aqs entree
mq rdi entree
aqs naof-entree-secs
mq rdx naof-entree-secs
aqs seek
mq rsi seek
aqs naof-seek-secs
mq rcx naof-seek-secs
ent jsect \n

mq naof-entree-secs rdx
cmp 0 rdx
st je set-non-init

##########################################################################################################
# vparams
##########################################################################################################
mov 1 rdi
mq seek rsi
mq naof-seek-secs rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
mq entree rsi
mq naof-entree-secs rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#init
#com

##########################################################################################################
# calc-naof-seeks
##########################################################################################################
aqs naof-seeks
mq naof-seek-secs r8
mq naof-entree-secs r9
sub r8 r9
add 1 r9
mq r9 naof-seeks
cmp 0 r9
st jl set-non-init

##########################################################################################################
# seek-space
##########################################################################################################
aqs seek-site
nao r8
mq r8 seek-site
mq naof-seeks r9
s seek-space-init
	mq seek-site r8
	mq entree rsi
	add r8 rsi
	mq seek rdi
	mq naof-seek-secs rcx
	rcmp

	st je seek-space-com
	mq seek-site r8
	mq naof-seeks r9
	add 1 r8
	mq r8 seek-site
	cmp r9 r8
	st je set-non-init

	st jmp seek-space-init
s seek-space-com

st jmp set-non-com
s set-non-init
mov ffffffffffffffff r8
mq r8 seek-site
s set-non-com

##########################################################################################################
# com-com
##########################################################################################################
mq naof-seeks r10
mq seek-site rax
add 1000 rsp
ret

#init
#com

#init
ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys
#com

#init
mov 1 rdi
mq entree rsi
mq naof-entree-secs rdx
mov 1 rax
sys
mov 1 rdi
mq seek rsi
mq naof-seek-secs rdx
mov 1 rax
sys
#com
