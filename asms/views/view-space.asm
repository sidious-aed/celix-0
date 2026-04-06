##########################################################################################################
# view-number
##########################################################################################################
# rsi | relay
# rdi | space
# rcx | naof-secs
# rbx | base
# r10 | is-board
# rdx | equations
% equations
##########################################################################################################
# view-number-init
##########################################################################################################
sub f69bf rsp
aqs equations
mq rdx equations
aqs relay
mq rsi relay
aqs space
mq rdi space
aqs space-site
nao r8
mq r8 space-site
aqs naof-secs
mq rcx naof-secs
aqs et
sub 1 rcx
mq rcx et
aqs base
mq rbx base
aqs is-board
mq r10 is-board
aqs board-expansion
mov 2 r11
mq r11 board-expansion
ent jsect \n
ent jedao-sectioner  | 
aqs vs-space
isr f62af
aqs slimit
mov f62a3 r8
mq r8 slimit
aqs bs
isr 100
aqs bs-site
aqs vs-space-site
nao r8
mq r8 vs-space-site
aqs vspace
lq vs-space r8
mq r8 vspace

mq relay rsi
mov 0 rsi rsi
mq relay r8
aqs naof-relay-secs
mq relay rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax naof-relay-secs

mq relay rsi
mq vspace rdi
mq naof-relay-secs rcx
mq rcx vs-space-site
mq equations r11
addc equations com r11
dct r11

lent jedao-sectioner rsi
mq vspace rdi
mov 3 rcx
mq vs-space-site r8
add r8 rdi
add rcx r8
mq r8 vs-space-site
mq equations r11
addc equations com r11
dct r11

mq vspace rsi
mq vs-space-site r8
add r8 rsi
mov 5b r9
#mov 5d r9
movs r9 0 rsi
add 1 r8
mq r8 vs-space-site

aqs con
aqs ospace-site
s view-secs-init
	mq space-site r8
	mq r8 ospace-site
	mq naof-secs r9
	cmp r9 r8
	st je view-secs-com

	mq space rsi
	mq space-site r8
	add r8 rsi
	nao r11
	movs 0 rsi r11
	mq r11 con
	add 1 r8
	mq r8 space-site

	mq con rdi
	mq base rbx
	lq bs rsi
	mq equations r8
	addc equations number-to-entree r8
	dct r8
	mq rax bs-site

	lq bs rsi
	mq vspace rdi
	mq vs-space-site r8
	add r8 rdi
	mq bs-site rcx
	mq equations r11
	addc equations com r11
	dct r11
	mq vs-space-site r8
	mq bs-site r9
	add r9 r8
	mq r8 vs-space-site

	mq ospace-site r8
	mq et r9
	cmp r8 r9
	st je vsect-com
	s vsect-init
		mq vspace rsi
		mq vs-space-site r8
		add r8 rsi
		mov 2c r9
		movs r9 0 rsi
		add 1 rsi
		mov 20 r9
		movs r9 0 rsi
		add 2 r8
		mq r8 vs-space-site
	s vsect-com

	mq vs-space-site r8
	mq slimit r9
	cmp r8 r9
	st jb at-limit-com
	s at-limit-init
		mov 1 rdi
		mq vspace rsi
		mq vs-space-site rdx
		mov 1 rax
		sys
		nao r8
		mq r8 vs-space-site
	s at-limit-com
	st jmp view-secs-init
s view-secs-com

mq vspace rsi
mq vs-space-site r8
add r8 rsi
mov 5d r9
#mov 5b r9
movs r9 0 rsi
mov a r9
add 1 rsi
movs r9 0 rsi
add 2 r8
mq r8 vs-space-site

mov 1 rdi
mq vspace rsi
mq vs-space-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys
#init
#com

##########################################################################################################
# view-number-com
##########################################################################################################
add f69bf rsp
ret

#init
aqs file
entb fn droid/clerk-com3.secs
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
lqb naof-relay-secs rsi
mov 8 rdx
mov 1 rax
sys
# write
mqb file rdi
lqb vs-space-site rsi
mov 8 rdx
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
