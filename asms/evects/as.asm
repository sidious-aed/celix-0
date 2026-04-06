##########################################################################################################
# as | add-string-to-vecter
##########################################################################################################
# rdi | name
# rsi | str
# rcx | str-site
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs name
mq rdi name
aqs str
mq rsi str
aqs str-site
mq rcx str-site
aqs equations
mq r12 equations
aqs views
mq r13 views
aqs name-space
isr 400
aqs name-space-site
aqs expansion-facter
mov 2 r8
mq r8 expansion-facter
ent jsect \n

##########################################################################################################
# get-vecter-meta
##########################################################################################################
aqs site
aqs naof-esecs
aqs vscope

aqs vect
# open-read
nao rsi
mq name rdi
mov 2 rax
sys
mq rax vect

# read
mq vect rdi
mov 18 rdx
lq site rsi
mov 0 rax
sys

# close
mq vect rdi
mov 3 rax
sys

ent rsite site
lent rsite rsi
mq site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rnaof-esecs naof-esecs
lent rnaof-esecs rsi
mq naof-esecs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rvscope vscope
lent rvscope rsi
mq vscope rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# calc-at-site
##########################################################################################################
aqs at-site
mq site r8
#factq naof-esecs r8
add 18 r8
mq r8 at-site

ent rat-site at-site
lent rat-site rsi
mq at-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# check-for-expansion
##########################################################################################################
mq site r8
mq vscope r9
mq str-site r10
add r10 r8
cmp r9 r8
st jb expansion-com

ent rexpansion expanding vecter.
lent rexpansion rsi
mov 11 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

mq vscope r8
factq expansion-facter r8
mq str-site r10
add r10 r8
#add 1 r8
mq r8 vscope

lent rvscope rsi
mq vscope rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

# open-write
mov 1f8 rdx
mov 41 rsi
mq name rdi
mov 2 rax
sys
mq rax vect

# lseek
mq vect rdi
mov 10 rsi
nao rdx
mov 8 rax
sys

# write
mq vect rdi
mov 8 rdx
lq vscope rsi
mov 1 rax
sys

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

# lseek
mq vect rdi
mq at-site rsi
nao rdx
mov 8 rax
sys

ent rwriting-zeros writing zeros.\n
ent rnaof-nao-secs naof-nao-secs
aqs naof-vect-secs
mq vscope rax
nao rdx
divq expansion-facter
mq rax naof-vect-secs
aqs naof-nao-secs
s naoify-vect-init
	lent rwriting-zeros rsi
	mov e rcx
	mq equations r12
	mq views r11
	addc views wtlr r11
	dct r11
	mq naof-vect-secs r8
	mq naof-generate-secs r9
	cmp r8 r9
	st ja limit-nao-secs-com
		mq r9 naof-nao-secs
		st jmp set-nao-secs-com
	s limit-nao-secs-com
		mq r8 naof-nao-secs
	s set-nao-secs-com

	lent rnaof-nao-secs rsi
	mq naof-nao-secs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	# write
	mq vect rdi
	mq naof-nao-secs rdx
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
mq vect rdi
mov 3 rax
sys

s expansion-com
##########################################################################################################
# write-vecter
##########################################################################################################
# open-write
mov 1f8 rdx
mov 41 rsi
mq name rdi
mov 2 rax
sys
mq rax vect

# lseek
mq vect rdi
mq at-site rsi
nao rdx
mov 8 rax
sys

# write
mq vect rdi
mq str-site rdx
mq str rsi
mov 1 rax
sys

##########################################################################################################
# incr-at-site
##########################################################################################################
# lseek
mq vect rdi
nao rsi
nao rdx
mov 8 rax
sys

mq site r8
mq str-site r10
add r10 r8
mq r8 site

# write
mq vect rdi
mov 8 rdx
lq site rsi
mov 1 rax
sys

##########################################################################################################
# calc-at-site and sign com.
##########################################################################################################
aqs nao-quad
nao r8
mq r8 nao-quad
aqs at-site
mq site r8
factq naof-esecs r8
add 18 r8
mq r8 at-site

lent rat-site rsi
mq at-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

# lseek
mq vect rdi
mq at-site rsi
nao rdx
mov 8 rax
sys

# write
mq vect rdi
lq nao-quad rsi
mov 1 rdx
mov 1 rax
sys

# close
mq file rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
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
