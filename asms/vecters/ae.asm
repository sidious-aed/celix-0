##########################################################################################################
# ae | add-entree
##########################################################################################################
# rdi | entrees-name
# rbx | entrees-meta-name
# rsi | entree
# rcx | entree-site
% equations
% views
% vects
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs entrees-name
mq rdi entrees-name
aqs entrees-meta-name
mq rbx entrees-meta-name
aqs entree
mq rsi entree
aqs entree-site
mq rcx entree-site
aqs equations
mq r12 equations
aqs views
mq r13 views
aqs vects
mq r14 vects
aqs expansion-facter
mov 2 r8
mq r8 expansion-facter
ent jsect \n

##########################################################################################################
# get-entrees-vecter-meta
##########################################################################################################
aqs entrees-site
aqs entrees-naof-esecs

aqs evect
# open-read
nao rsi
mq entrees-name rdi
mov 2 rax
sys
mq rax evect

# read
mq evect rdi
mov 10 rdx
lq entrees-site rsi
mov 0 rax
sys

# close
mq evect rdi
mov 3 rax
sys

ent rentrees-site entrees-site
lent rentrees-site rsi
mq entrees-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rentrees-naof-esecs entrees-naof-esecs
lent rentrees-naof-esecs rsi
mq entrees-naof-esecs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# get-entrees-meta-vecter-meta
##########################################################################################################
aqs entrees-meta-site
aqs entrees-meta-naof-esecs

aqs emvect
# open-read
nao rsi
mq entrees-meta-name rdi
mov 2 rax
sys
mq rax emvect

# read
mq emvect rdi
mov 10 rdx
lq entrees-meta-site rsi
mov 0 rax
sys

# close
mq emvect rdi
mov 3 rax
sys

ent rentrees-meta-site entrees-meta-site
lent rentrees-meta-site rsi
mq entrees-meta-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rentrees-meta-naof-esecs entrees-meta-naof-esecs
lent rentrees-meta-naof-esecs rsi
mq entrees-meta-naof-esecs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rentrees-meta-vscope entrees-meta-vscope
lent rentrees-meta-vscope rsi
mq entrees-meta-vscope rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# write-entree
##########################################################################################################
mq entrees-name rdi
mq entree rsi
mq entree-site rcx
mq equations r12
mq views r13
mq vects r11
addc vects ase r11
dct r11

##########################################################################################################
# write-entree-meta
##########################################################################################################
aqs meta-esite
aqs meta-esite-esite
mq entrees-site r8
mq r8 meta-esite
mq entree-site r8
mq r8 meta-esite-esite

mq entrees-meta-name rdi
lq meta-esite rsi
mq equations r12
mq views r13
mq vects r11
addc vects av r11
dct r11

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
