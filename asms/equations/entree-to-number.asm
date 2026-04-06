##########################################################################################################
# com
##########################################################################################################
# rsi | entree
# rcx | naof-secs
# rbx | base
##########################################################################################################
# com-init
##########################################################################################################
sub 1000 rsp
aqs entree
mq rsi entree
aqs naof-secs
mq rcx naof-secs
aqs base
mq rbx base
aqs esite
sub 1 rcx
mq rcx esite
aqs number
nao r8
mq r8 number

#init
entb jsec \n
mov 1 rdi
mqb entree rsi
mqb naof-secs rdx
mov 1 rax
sys
mov 1 rdi
lentb jsec rsi
mov 1 rdx
mov 1 rax
sys
#com

aqs sec0
aqs focus
mov 1 r8
mq r8 focus
s clerical-entree-to-number-init
	nao r9
	mq entree rsi
	mq esite r8
	add r8 rsi
	movs 0 rsi r9
	mq r9 sec0


	mq sec0 r9
	cmp 39 r9
	st ja scope-a-com
	sub 30 r9
	st jmp scopes-com
	s scope-a-com
	sub 57 r9
	s scopes-com
	mq r9 sec0

	mq sec0 r9
	factq focus r9
	mq number r10
	add r9 r10
	mq r10 number

	mq focus r11
	factq base r11
	mq r11 focus

	mq esite r12
	cmp 0 r12
	st je clerical-entree-to-number-com
	sub 1 r12
	mq r12 esite
	st jmp clerical-entree-to-number-init
s clerical-entree-to-number-com
#init
#com

##########################################################################################################
# com-com
##########################################################################################################
mq number rax
add 1000 rsp
ret

#init
aqs file
entb fn droid/clerk-com.secs
# unlink
lentb fn rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 41 rsi
lentb fn rdi
mov 2 rax
sys
mq rax file
# write
mqb file rdi
mov 8 rdx
lqb sec0 rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
