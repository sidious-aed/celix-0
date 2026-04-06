##########################################################################################################
# number-to-entree
##########################################################################################################
# rdi | number
# rsi | entree
# rbx | base
# r13 | sret
##########################################################################################################
# com-init
##########################################################################################################
sub 1000 rsp
aqs number
mq rdi number
aqs entree
mq rsi entree
aqs base
mq rbx base
aqs et
aqs bbreadth
mov 1 rax
mq rax bbreadth

aqs esite
mq number r8
cmp 0 r8
st jne is-zero-com
s is-zero-init
	mov 30 r8
	mq entree rsi
	movs r8 0 rsi
	mov 1 rax
	mq rax esite
	st jmp write-number-com
s is-zero-com

nao r8
s seek-base-breadth-init
	mq bbreadth rax
	factq base rax
	mq rax bbreadth
	st jo seek-base-breadth-com
	mq rax et
	add 1 r8
	cmp 10 r8
	st je seek-base-breadth-com
	st jmp seek-base-breadth-init
s seek-base-breadth-com


aqs focus
mq et r8
mq r8 focus
s seek-to-et-init
mq number rax
nao rdx
divq focus
cmp 0 rax
st jne seek-to-et-com
mq focus rax
nao rdx
divq base
mq rax focus
st jmp seek-to-et-init
s seek-to-et-com
	aqs sum
	nao r8
	mq r8 esite
	s write-number-init

	mq number rax
	nao rdx
	divq focus
	mq rax sum

	mq sum rax
	cmp 9 rax
	st ja a-scope-com
	add 30 rax
	st jmp scopes-com
	s a-scope-com
	add 57 rax
	s scopes-com

	mq esite r8
	mq entree rsi
	add r8 rsi
	movs rax 0 rsi
	add 1 r8
	mq r8 esite

	mq number r9
	mq sum r10
	factq focus r10
	sub r10 r9
	mq r9 number

	mq focus rax
	nao rdx
	divq base
	mq rax focus
	cmp 0 rax
	st je write-number-com
	st jmp write-number-init
s write-number-com

##########################################################################################################
# com-com
##########################################################################################################
mq esite rax
add 1000 rsp
ret

#init
aqs file
ent fn droid/inv.secs
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
lq bbreadth rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq base rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
