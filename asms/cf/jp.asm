##########################################################################################################
# jp | just-part
##########################################################################################################
# rdi | chart-at
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs chart-at
mq rdi chart-at
aqs key
aqs key-site
aqs value
aqs value-site
aqs is-com
nao r8
mq r8 is-com
aqs equations
mq r12 equations
ent jsect \n

#init
ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mq chart-at rsi
mov 7 rdx
mov 1 rax
sys

mov 1 rdi
mq chart-at rsi
mov 1a rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

mq chart-at rdi
mov rdi rsi
mov rdi r15
mq rsi at-key-site
nao r9
s seek-key-site-init
	movs 0 rsi r9
	cmp 7c r9
	st je seek-key-site-com
	add 1 rsi
	st jmp seek-key-site-init
s seek-key-site-com
mov rsi r14
sub rdi rsi
add 1 r14
mq r14 chart-at

mov rsi rcx
mov r15 rsi
mov 24 rbx
mq equations r12
addc equations entree-to-number r12
dct r12
mq rax key-site

mq chart-at rsi
mq rsi key
mq key-site r8
add r8 rsi
add 1 rsi
mq rsi chart-at

mov rsi rdi
mov rsi r15
nao r9
s seek-value-site-init
	movs 0 rsi r9
	cmp 7c r9
	st je seek-value-site-com
	add 1 rsi
	st jmp seek-value-site-init
s seek-value-site-com
mov rsi r14
sub rdi rsi
add 1 r14
mq r14 chart-at

mov rsi rcx
mov r15 rsi
mov 24 rbx
mq equations r12
addc equations entree-to-number r12
dct r12
mq rax value-site

mq chart-at rsi
mq rsi value
mq value-site r8
add r8 rsi
mq rsi chart-at

#init
mov 1 rdi
mq chart-at rsi
mov a rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

mq chart-at rsi
nao r9
movs 0 rsi r9
cmp 7c r9
st je set-to-com-com
	mov 1 r8
	mq r8 is-com
s set-to-com-com

add 1 rsi
mq rsi chart-at

##########################################################################################################
# com
##########################################################################################################
mq key rsi
mq key-site rcx
mq value rdi
mq value-site rdx
mq is-com rax
mq chart-at rbx
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
lq key-site rsi
mov 1 rax
sys
# write
mq file rdi
mov 100 rdx
mq chart-at rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
