##########################################################################################################
# av | add-to-vecter
##########################################################################################################
# rdi | entrees-name
# rbx | entrees-meta-name
# rsi | wentree
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
aqs wentree
mq rsi wentree
aqs entree-site
mq rcx entree-site
aqs equations
mq r12 equations
aqs views
mq r13 views
aqs vects
mq r14 vects
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

##########################################################################################################
# get-entree-meta and write-entree
##########################################################################################################
aqs naof-meta-record-secs
mov 10 r8
mq r8 naof-meta-record-secs
aqs entree-meta-esite
aqs entree-meta-esite-esite

# lseek
mq emvect rdi
mq entree-site rsi
factq naof-meta-record-secs rsi
add 10 rsi
nao rdx
mov 8 rax
sys

# read
mq emvect rdi
mov 10 rdx
lq entree-meta-esite rsi
mov 0 rax
sys

ent rentree-meta-esite entree-meta-esite
lent rentree-meta-esite rsi
mq entree-meta-esite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rentree-meta-esite-esite entree-meta-esite-esite
lent rentree-meta-esite-esite rsi
mq entree-meta-esite-esite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

# lseek
mq evect rdi
mq entree-meta-esite rsi
add 10 rsi
nao rdx
mov 8 rax
sys

# read
mq evect rdi
mq entree-meta-esite-esite rdx
mq wentree rsi
mov 0 rax
sys

# close
mq evect rdi
mov 3 rax
sys

# close
mq emvect rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
mq entree-meta-esite-esite rax
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
