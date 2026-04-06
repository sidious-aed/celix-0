##########################################################################################################
# com
##########################################################################################################
# rsi | entree
# rdi | destination
# rcx | naof-secs
% views
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs entree
mq rsi entree
aqs destination
mq rdi destination
aqs naof-entree-secs
mq rcx naof-entree-secs

##########################################################################################################
# calc-naofs
##########################################################################################################
aqs naof-secs-in-quad
mov 8 r8
mq r8 naof-secs-in-quad
mq naof-entree-secs rcx
mov rcx rax
nao rdx
divq naof-secs-in-quad rcx
aqs naof-quads
mq rax naof-quads
factq naof-secs-in-quad rax
aqs naof-quad-secs
mq rax naof-quad-secs
mq naof-entree-secs r9
sub rax r9
aqs naof-secs
mq r9 naof-secs

##########################################################################################################
# coms
##########################################################################################################
mq naof-quads rcx
cmp 0 rcx
st je com-quads-com
	mq entree rsi
	mq destination rdi
	mq naof-quads rcx
	mzq
s com-quads-com

mq naof-secs rcx
cmp 0 rcx
st je com-secs-com
	mq entree rsi
	mq naof-quad-secs r8
	add r8 rsi
	mq destination rdi
	add r8 rdi
	mzs
s com-secs-com

##########################################################################################################
# com
##########################################################################################################
add 1000 rsp
ret

#init
ent fn droid/clerk-com.secs
aqs file
# open-write
mov 1f8 rdx
mov 441 rsi
lent fn rdi
mov 2 rax
sys
mq rax file
# write
mq file rdi
mov 8 rdx
lq naof-quads rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq naof-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
#init
mq entree rsi
mq destination rdi
mov rdi r8
mq naof-quad-secs r9
add r9 r8
s com-quads-init
	mov 0 rsi r10
	mov r10 0 rdi
	add 8 rsi
	add 8 rdi
	cmp rdi r8
	st je com-quads-com
	st jmp com-quads-init
s com-quads-com
#com
#init
aqs scv-code
mq r10 scv-code
aqs views
mq r12 views
aqs scv
mq r13 scv
aqs equations
mq r14 equations
ent rscv scv
ent rnaof-quads naof-quads
ent rnaof-secs naof-secs
mq scv-code r10
mov aed123123 r11
cmp r10 r11
st jne see-scope-com
	lent rscv rsi
	mq scv rdi
	mov 18 rcx
	mov 10 rbx
	nao r10
	mq equations rdx
	mq views r11
	addc views view-space r11
	dct r11

	ent rdestination destination
	lent rdestination rsi
	mq destination rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	ent rdestination-com destination-com
	lent rdestination-com rsi
	mq destination rdi
	mq naof-quad-secs r8
	add r8 rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rnaof-quads rsi
	mq naof-quads rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rnaof-secs rsi
	mq naof-secs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11
s see-scope-com
#com
