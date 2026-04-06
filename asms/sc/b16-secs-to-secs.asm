##########################################################################################################
# b16-secs-to-secs
##########################################################################################################
# rsi | b16e
# rcx | b16e-site
# rdi | entree
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs b16e
mq rsi b16e
aqs b16e-site
mq rcx b16e-site
aqs entree
mq rdi entree
aqs entree-site
nao r8
mq r8 entree-site
aqs equations
mq rdx equations
aqs views
mq rbx views
ent jsect \n

mov 1 rdi
mq b16e rsi
mq b16e-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mq b16e-site r8
cmp 0 r8
st je parse-b16-com
aqs quad-secs
aqs quad-secs-site
nao r8
mq r8 quad-secs-site
aqs esite
mq r8 esite
s parse-b16-init
	nao r9
	mq b16e rsi
	mq esite r8
	add r8 rsi
	movs 0 rsi r9
	cmp 20 r9
	st je nib-com

	lq quad-secs rdi
	mq quad-secs-site r8
	add r8 rdi
	movs r9 0 rdi
	add 1 r8
	mq r8 quad-secs-site
	cmp 2 r8
	st jne add-sec-com

		lq quad-secs rsi
		mov 2 rcx
		mov 10 rbx
		mq equations r12
		addc equations entree-to-number r12
		dct r12
		mq entree rdi
		mq entree-site r8
		add r8 rdi
		movs rax 0 rdi
		add 1 r8
		mq r8 entree-site
		nao r8
		mq r8 quad-secs-site
		
	s add-sec-com

	s nib-com
		mq esite r8
		add 1 r8
		mq r8 esite
		mq b16e-site r9
		cmp r9 r8
		st je parse-b16-com
		st jmp parse-b16-init
s parse-b16-com

##########################################################################################################
# com
##########################################################################################################
mq entree-site rax
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
