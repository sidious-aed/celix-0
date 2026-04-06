##########################################################################################################
# kv | key-value
##########################################################################################################
# rdi | record
# r15 | record-site
# rsi | key
# rdx | equations
# rbx | cf
# r12 | views
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs record
mq rdi record
aqs record-site
mq r15 record-site
aqs key
aqs key-site
mq rsi key
aqs equations
mq rdx equations
aqs cf
mq rbx cf
aqs views
mq r12 views
aqs cs
isr 5000
ent jsect \n
aqs chartf
aqs indexf
ent rsite site

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

mq key rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax key-site

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

##########################################################################################################
# index-chart
##########################################################################################################
ent rchart-site chart-site
ent rfsite fsite
ent rnrs nrs
ent ris-com is-com
ent rchart-at chart-at
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs is-com
aqs chart-at
aqs nrs
aqs is-seek
nao r8
mq r8 is-seek
aqs chart-site
aqs compr
ent rcompr compr
ent rrecord-site record-site

aqs value
aqs value-site
nao r8
mq r8 value-site
aqs is-com
aqs record-at
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs rsite
nao r8
mq r8 rsite

s seek-key-value-init
	mq record rdi
	mq rsite r8
	add r8 rdi
	mq equations r12
	mq cf r11
	addc cf jp r11
	dct r11
	mq rax is-com
	mq rbx record-at
	mq rsi ckey
	mq rcx ckey-site
	mq rdi cvalue
	mq rdx cvalue-site

	mq record-at rsi
	mq record rdi
	sub rdi rsi
	mq rsi rsite

	mq key rdi
	mq key-site rdx
	mq ckey rsi
	mq ckey-site rcx
	mq equations r11
	addc equations compair-spaces r11
	dct r11
	cmp 1 rax
	st jne set-result-and-com-com
		mov 1 rdi
		mq cvalue rsi
		mq cvalue-site rdx
		mov 1 rax
		#sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		mq cvalue rax
		mq rax value
		mq cvalue-site rcx
		mq rcx value-site
		st jmp seek-key-value-com
	s set-result-and-com-com

	mq is-com r8
	cmp 1 r8
	st je seek-key-value-com
	st jmp seek-key-value-init
s seek-key-value-com
#init
mov 1 rdi
mq record rsi
mq rsite r8
add r8 rsi
mq record-site rdx
mov 1 rax
sys
#com

##########################################################################################################
# com
##########################################################################################################
mq value rax
mq value-site rcx
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
