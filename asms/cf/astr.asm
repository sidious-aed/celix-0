##########################################################################################################
# astr | add-to-string
##########################################################################################################
# rdi | vect
# rsi | string
# rcx | naof-string-secs
# rbx | cs
# rdx | equations
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs vect
mq rdi vect
aqs string
mq rsi string
aqs naof-string-secs
mq rcx naof-string-secs
aqs cs
mq rbx cs
aqs equations
mq rdx equations
aqs vsite
aqs vnaof-esecs
aqs vscope
mq vect rdi
mov 0 rdi r8
mq r8 vsite
mov 8 rdi r8
mq r8 vnaof-esecs
mov 10 rdi r8
mq r8 vscope

##########################################################################################################
# expansion
##########################################################################################################
aqs naof-gsecs
aqs vspancef
mov 2 r8
mq r8 vspancef

mq vsite r11
mq naof-string-secs r12
add r12 r11
mq vscope r12
cmp r11 r12
st jae expansion-com

ent rexpansion astr expansion.\n
mov 1 rdi
lent rexpansion rsi
mov 10 rdx
mov 1 rax
sys

mq vect r10
aqs naof-csecs
mq vsite r11
add 18 r11
mq r11 naof-csecs

mq vscope r11
mq naof-string-secs r12
add r12 r11
factq vspancef r11
mq r11 vscope
mov r11 10 r10
add 18 r11
mq r11 naof-gsecs

aqs ovect
mq vect r8
mq r8 ovect
mq cs rdi
mq naof-gsecs rsi
mq equations r11
addc equations cr r11
dct r11
mq rax vect

mq ovect rsi
mq vect rdi
mq naof-csecs rcx
mq equations r11
addc equations com r11
dct r11

s expansion-com
##########################################################################################################
# add-element
##########################################################################################################
ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
#sys
mov 1 rdi
mq string rsi
mq naof-string-secs rdx
mov 1 rax
sys

mq string rsi
mq vect rdi
mov 0 rdi r8
add r8 rdi
add 18 rdi
mq naof-string-secs rcx
mq equations r11
addc equations com r11
dct r11

mq vect r10
mq vsite r11
mq naof-string-secs r8
add r8 r11
mov r11 0 r10
##########################################################################################################
# com
##########################################################################################################
mq vect rax
add 1000 rsp
ret

#init
ent fn droid/clerk-com-7.secs
mov 1 rdi
lent fn rsi
mov 14 rdx
mov 1 rax
sys
aqs file
# unlink
lent fn rdi
mov 57 rax
#sys
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
lq vect rsi
mov 1 rax
sys
# write
mq file rdi
mq vect rsi
mov 28 rdx
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
#init
aqs views
mq r12 views
aqs scv-code
mq r9 scv-code
aqs scv
mq r10 scv
nao r10
nao r12
nao r13
mq scv-code r9
mov aed123aed r10
cmp r10 r9
st jne see-scope-com
	ent rscv scv
	lent rscv rsi
	mq scv rdi
	mov 18 rcx
	mov 10 rbx
	nao r10
	mq equations rdx
	mq views r11
	addc views view-space r11
	dct r11
	mov aed123123 r10
	mq views r12
	mq scv r13
	mq equations r14
s see-scope-com
#com
