##########################################################################################################
# cv | create-vecter
##########################################################################################################
# r8  | name
# rdi | naof-esecs
# rsi | vscope
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs name
mq r8 name
aqs site
nao r8
mq r8 site
aqs naof-esecs
mq rdi naof-esecs
aqs vscope
mq rsi vscope
aqs equations
mq r12 equations
aqs views
mq r13 views
aqs name-space
isr 400
aqs name-space-site

##########################################################################################################
# nonce-name | <--> more for simple and done. a small extra feature.
#								<--> note regards of only one a time as the extra feature is from this stack.
##########################################################################################################
ent jsect \n
ent name-init vects/
ent name-com .vect
aqs time0
aqs time1
aqs zone0
aqs zone1
mq name r8
cmp 0 r8
st jne nonce-name-com

# gettimeofday
lq time0 rdi
lq zone0 rsi
mov 60 rax
sys

lent name-init rsi
lq name-space rdi
mov 6 rcx
mq rcx name-space-site
mq equations r11
addc equations com r11
dct r11

mq time0 rdi
lq name-space rsi
mq name-space-site r8
add r8 rsi
mov 10 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq name-space-site r8
add rax r8
mq r8 name-space-site

lq name-space rsi
mq name-space-site r8
add r8 rsi
mov 2e r9
movs r9 0 rsi
add 1 r8
mq r8 name-space-site

mq time1 rdi
lq name-space rsi
mq name-space-site r8
add r8 rsi
mov 10 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq name-space-site r8
add rax r8
mq r8 name-space-site

lent name-com rsi
lq name-space rdi
mq name-space-site r8
add r8 rdi
mov 5 rcx
mq equations r11
addc equations com r11
dct r11
mq name-space-site r8
add 5 r8
mq r8 name-space-site
lq name-space rsi
add r8 rsi
nao r9
movs r9 0 rsi
lq name-space rsi
mq rsi name
#init
#com

mq name rsi
mq name-space-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11
s nonce-name-com

##########################################################################################################
# setup-nao-generation
##########################################################################################################
aqs naof-generate-secs
mov 6978 r9
mq r9 naof-generate-secs
aqs nao-space
isr 6978
lq nao-space rsi
mov rsi rdi
mq naof-generate-secs r8
add r8 rdi
nao r9
s setup-nao-generation-init
	mov r9 0 rsi
	add 8 rsi
	cmp rsi rdi
	st je setup-nao-generation-com
	st jmp setup-nao-generation-init
s setup-nao-generation-com

##########################################################################################################
# calc-naof-secs
##########################################################################################################
aqs naof-vect-secs
mq vscope r8
factq naof-esecs r8
mq r8 naof-vect-secs

ent rnaof-vect-grid-secs naof-vect-grid-secs
lent rnaof-vect-grid-secs rsi
mq naof-vect-secs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# create-vecter
##########################################################################################################
aqs file
# unlink
mq name rdi
mov 57 rax
sys

# open-write
mov 1f8 rdx
mov 41 rsi
mq name rdi
mov 2 rax
sys
mq rax file

# write
mq file rdi
mov 18 rdx
lq site rsi
mov 1 rax
sys

aqs naof-nao-secs
s naoify-vect-init
	mq naof-vect-secs r8
	mq naof-generate-secs r9
	cmp r8 r9
	st ja limit-nao-secs-com
		mq r9 naof-nao-secs
		st jmp set-nao-secs-com
	s limit-nao-secs-com
		mq r8 naof-nao-secs
	s set-nao-secs-com

	# write
	mq file rdi
	mq naof-vect-secs rdx
	lq nao-space rsi
	mov 1 rax
	sys

	mq naof-nao-secs r8
	mq naof-vect-secs r9
	sub r8 r9
	mq r9 naof-vect-secs
	cmp 0 r9
	st je naoify-vect-com
	st jmp naoify-vect-init
s naoify-vect-com

# close
mq file rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
mq name rax
add 10000 rsp
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
