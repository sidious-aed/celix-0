##########################################################################################################
# cr | clerk-memory-ruler
# alias | stack-based-memory-clerkess
##########################################################################################################
# cr
# --
# a stack based clerk floor memory zonages thingy.
# --
# rdi | clerk-space
# rsi | naof-secs
% views
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs cs
mqb rdi cs
aqs naof-secs
mqb rsi naof-secs
aqs cs-site
mov 0 rdi r8
mqb r8 cs-site
aqs cs-breadth
mov 8 rdi r8
mqb r8 cs-breadth
aqs equations
mq r11 equations
aqs views
mq rbx views

#init
ent rnaof-secs naof-secs
lent rnaof-secs rsi
mq naof-secs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com

##########################################################################################################
# insure-grid-allowances
##########################################################################################################
entb unallowance-message clerk space does not have allowance for request.\n
mq cs-site r8
mq naof-secs r9
add r8 r9
mq cs-breadth r10
cmp r9 r10
#st jmp unallowance-com
st ja unallowance-com
	mov 1 rdi
	lent unallowance-message rsi
	mov 31 rdx
	mov 1 rax
	sys

	nao rdi
	mov e7 rax
	sys
s unallowance-com

##########################################################################################################
# allocate-inhashanzibra
##########################################################################################################
aqs as
mq cs rdi
mq cs-site r8
add r8 rdi
add 10 rdi
mq rdi as
mq cs rdi
mov 0 rdi r8
mq naof-secs r9
add r9 r8
mov r8 0 rdi
# <--> i dont want to be paranoid. but is almost seems their sparse alters instead of our ziz-ziz. some things.

##########################################################################################################
# com
##########################################################################################################
mq as rax
add 1000 rsp
pop rbp
ret

#init
entb fn droid/clerk-com.secs
aqs file
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
mqb rax file
# write
mqb file rdi
mov 8 rdx
lqb jrule rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys

aqs pt0
aqs pt1
s see-task-init
	lqb pt0 rdi
	lqb pt0 rsi
	mov 23 rax
	sys
	st jmp see-task-init
s see-task-com
#com

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
lq naof-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com

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
lq naof-secs rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq naof-secs rsi
mov 1 rax
sys
aqs cmp0
aqs cmp1
mq cs-site r8
mq naof-secs r9
add r8 r9
mq cs-breadth r10
mq r9 cmp0
mq r10 cmp1
# write
mq file rdi
mov 8 rdx
lq cmp0 rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq cmp1 rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
