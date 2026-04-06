##########################################################################################################
# modc | modify-chart
##########################################################################################################
# r10 | cs
# r15 | record
# r11 | mrec
# rsi | key
# rcx | key-site
# rdi | value
# rdx | value-site
# r14 | equations
# r13 | views
# r12 | cf
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs cs
mq r10 cs
aqs record
mq r15 record
aqs mrec
mq r8 mrec
aqs key
mq rsi key
aqs key-site
mq rcx key-site
aqs value
mq rdi value
aqs value-site
mq rdx value-site
aqs equations
mq r14 equations
aqs views
mq r13 views
aqs cf
mq r12 cf
ent jsect \n

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

mov 1 rdi
mq key rsi
mq key-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

ent rcs cs
lent rcs rsi
mq cs rdi
mov 20 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

ent rckey-site ckey-site
ent rcmpr cmpr
ent radded-mod added-mod
ent ris-com is-com
aqs cmpr
nao r8
aqs added-mod
mq r8 added-mod
aqs csite
mq r8 csite
aqs is-com
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs chart-at
mq record rsi
mq rsi chart-at
s through-current-keys-init
	mq chart-at rdi
	mq csite r8
	add r8 rdi
	mq equations r12
	mq cf r11
	addc cf jp r11
	dct r11
	mq rax is-com
	mq rbx chart-at
	mq rsi ckey
	mq rcx ckey-site
	mq rdi cvalue
	mq rdx cvalue-site

	mov 1 rdi
	mq ckey rsi
	mq ckey-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mov 1 rdi
	mq cvalue rsi
	mq cvalue-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	lent rckey-site rsi
	mq ckey-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	mq key rdi
	mq key-site rdx
	mq ckey rsi
	mq ckey-site rcx
	mq equations r11
	addc equations compair-spaces r11
	dct r11
	mq rax cmpr

	lent rcmpr rsi
	mq cmpr rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent ris-com rsi
	mq is-com rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	mq cmpr r8
	cmp 1 r8
	st jne set-added-mode-com
	s set-added-mode-init
		mov 1 r8
		mq r8 added-mod
	s set-added-mode-com

	lent radded-mod rsi
	mq added-mod rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	nao r12
	mq added-mod r11
	cmp 0 r11
	st je naoify-r12-for-still-to-add-com
		mq is-com r12
	s naoify-r12-for-still-to-add-com

	mq cmpr rax
	cmp 1 rax
	st je add-active-init
	s add-still-init
		mq mrec rdi
		mq ckey rcx
		mq ckey-site r10
		mq cvalue rsi
		mq cvalue-site r11
		mq cs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax mrec
	s add-still-com
	st jmp add-active-com
	s add-active-init
		mq mrec rdi
		mq key rcx
		mq key-site r10
		mq value rsi
		mq value-site r11
		mq cs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax mrec
	s add-active-com

	mq is-com r8
	cmp 1 r8
	st je through-current-keys-com
	st jmp through-current-keys-init
s through-current-keys-com

lent radded-mod rsi
mq added-mod rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mq added-mod r8
cmp 1 r8
st je add-new-key-mod-com
s add-new-key-mod-init
	mq mrec rdi
	mq key rcx
	mq key-site r10
	mq value rsi
	mq value-site r11
	mov 1 r12
	mq cs rbx
	mq equations rdx
	mq cf r13
	mq cf r14
	addc cf atc r14
	dct r14
	mq rax mrec
s add-new-key-mod-com
#init
#com
##########################################################################################################
# com
##########################################################################################################
mq mrec rbx
mov 0 rbx rax
add 10000 rsp
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
lq naof-key-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
#init
mov 1 rdi
lq cs rsi
mov 10 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
lent rchart-site rsi
mq chart-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com
