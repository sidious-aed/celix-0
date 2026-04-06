##########################################################################################################
# com
##########################################################################################################
# rdi | stack-time-quads
# rsi | is-com
# rbx | relay
# rdx | equations
# rcx | views
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs stack-time-quads
mq rdi stack-time-quads
aqs is-com
mq rsi is-com
aqs relay
mq rbx relay
aqs relay-site
aqs equations
mq rdx equations
aqs views
mq rcx views
aqs frelay
isr 400
aqs frelay-site
ent jsect \n

aqs stqs
mq stack-time-quads r8
mq r8 stqs

mq is-com r8
cmp 1 r8
st jne init-for-com-com
	mq stack-time-quads r8
	add 20 r8
	mq r8 stqs
	st jmp naoify-com
s init-for-com-com
	mq stack-time-quads r8
	nao r9
	mov r9 0 r8
	mov r9 8 r8
	mov r9 20 r8
	mov r9 28 r8
s naoify-com

# gettimeofday
mq stqs rdi
mov rdi rsi
add 10 rsi
mov 60 rax
sys

ent rgettimeofday-quads gettimeofday-quads
lent rgettimeofday-quads rsi
mq stack-time-quads rdi
mov 40 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

aqs init-seconds
aqs init-micro-seconds
aqs com-seconds
aqs com-micro-seconds
mq is-com r8
cmp 1 r8
st jne calc-elapsed-and-view-relay-com
	mq stack-time-quads r8
	mov 0 r8 r9
	mov 8 r8 r10
	mov 20 r8 r11
	mov 28 r8 r12
	mq r9 init-seconds
	mq r10 init-micro-seconds
	mq r11 com-seconds
	mq r12 com-micro-seconds

	ent rinit-seconds -init-seconds
	ent rinit-micro-seconds -init-micro-seconds
	ent rcom-seconds -com-seconds
	ent rcom-micro-seconds -com-micro-seconds
	mq relay rdi
	mq equations r11
	addc equations get-naof-secs r11
	dct r11
	mq rax relay-site
	mq relay rsi
	lq frelay rdi
	mq relay-site rcx
	mq equations r11
	addc equations com r11
	dct r11

	lent rinit-seconds rsi
	lq frelay rdi
	mq relay-site r8
	add r8 rdi
	mov d rcx
	mq equations r11
	addc equations com r11
	dct r11

	lq frelay rsi
	mq relay-site r8
	add r8 rsi
	add d rsi
	nao r9
	movs r9 0 rsi

	lq frelay rsi
	mq init-seconds rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rinit-micro-seconds rsi
	lq frelay rdi
	mq relay-site r8
	add r8 rdi
	mov 13 rcx
	mq equations r11
	addc equations com r11
	dct r11

	lq frelay rsi
	mq relay-site r8
	add r8 rsi
	add 13 rsi
	nao r9
	movs r9 0 rsi

	lq frelay rsi
	mq init-micro-seconds rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rcom-seconds rsi
	lq frelay rdi
	mq relay-site r8
	add r8 rdi
	mov c rcx
	mq equations r11
	addc equations com r11
	dct r11

	lq frelay rsi
	mq relay-site r8
	add r8 rsi
	add c rsi
	nao r9
	movs r9 0 rsi

	lq frelay rsi
	mq com-seconds rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rcom-micro-seconds rsi
	lq frelay rdi
	mq relay-site r8
	add r8 rdi
	mov 12 rcx
	mq equations r11
	addc equations com r11
	dct r11

	lq frelay rsi
	mq relay-site r8
	add r8 rsi
	add 12 rsi
	nao r9
	movs r9 0 rsi

	lq frelay rsi
	mq com-micro-seconds rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11
s calc-elapsed-and-view-relay-com

##########################################################################################################
# com
##########################################################################################################
add 1000 rsp
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
lqb naof-entree-secs rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
