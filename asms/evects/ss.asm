##########################################################################################################
# ss | static-send
##########################################################################################################
# rdi | name
# rsi | record
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs name
mq rdi name
aqs record
mq rsi record
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
# send-statically
##########################################################################################################
# lseek
mq vect rdi
mov 18 rsi
nao rdx
mov 8 rax
sys

# read
mq vect rdi
mq record rsi
mq site rdx
mov 0 rax
sys

# close
mq vect rdi
mov 3 rax
sys
mq record rsi
mq site rdi
add rdi rsi
nao r9
movs r9 0 rsi

##########################################################################################################
# com
##########################################################################################################
mq site rax
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
