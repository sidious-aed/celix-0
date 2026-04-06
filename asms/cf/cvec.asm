##########################################################################################################
# cvec | create-vecter
##########################################################################################################
# rdi | naof-esecs
# rsi | vscope
# rbx | cs
# rdx | equations
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs naof-esecs
mq rdi naof-esecs
aqs vscope
mq rsi vscope
aqs cs
mq rbx cs
aqs equations
mq rdx equations
aqs naof-gsecs
mq naof-esecs r8
factq vscope r8
add 18 r8
mq r8 naof-gsecs

aqs vect
mq cs rdi
mq naof-gsecs rsi
mq equations r11
addc equations cr r11
dct r11
mq rax vect

##########################################################################################################
# naoify
##########################################################################################################
aqs naof-secs-in-quad
mov 8 r8
mq r8 naof-secs-in-quad
aqs naof-nquads
aqs naof-nsecs
aqs naof-secs-in-nquads
mq naof-gsecs rax
nao rdx
divq naof-secs-in-quad
mq rax naof-nquads
factq naof-secs-in-quad rax
mq rax naof-secs-in-nquads
mq naof-gsecs r8
sub rax r8
mq r8 naof-nsecs

mq vect rsi
mov rsi rdi
mq naof-secs-in-nquads r8
add r8 rdi
nao r9
s naoify-init
	mov r9 0 rsi
	add 8 rsi
	cmp rsi rdi
	st je naoify-com
	st jmp naoify-init
s naoify-com

mov rsi rdi
mq naof-nsecs r8
add r8 rdi
nao r9
s naoify-init
	movs r9 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je naoify-com
	st jmp naoify-init
s naoify-com

##########################################################################################################
# metafy
##########################################################################################################
mq vect r8
nao r9
mov r9 0 r8
mq naof-esecs r9
mov r9 8 r8
mq vscope r9
mov r9 10 r8

##########################################################################################################
# com
##########################################################################################################
mq vect rax
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
lq vect rsi
mov 1 rax
sys
# write
mq file rdi
mov 18 rdx
mq vect rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
