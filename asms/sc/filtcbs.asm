##########################################################################################################
# sortc
##########################################################################################################
# rdi | ci
# rsi | key
# r14 | sv
# r13 | wci
# r15 | cs
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs ci
mq rdi ci
aqs chart
mov 0 rdi r8
mq r8 chart
aqs chart-site
mov 8 rdi r8
mq r8 chart-site
aqs index
mov 10 rdi r8
mq r8 index
aqs index-site
mov 18 rdi r8
mq r8 index-site
aqs key
mq rsi key
aqs wci
mq r13 wci
aqs sv
mq r14 sv
aqs cs
mq r15 cs
aqs equations
mq rdx equations
aqs views
mq rbx views
aqs cf
mq r12 cf
aqs sv-naof-esecs
mov 8 r8
mq r8 sv-naof-esecs
ent jsect \n

ent rsv sv
lent rsv rsi
mq sv rdi
mov 0 rdi rcx
factq sv-naof-esecs rcx
add 18 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
#sys

mq sv r8
nao r9
mov r9 0 r8

aqs wchart
# anonomous-mmap
nao rdi
mq chart-site rsi
mov 7 rdx
mov 22 r10
nao r9
nao r8
mov 9 rax
sys
mq rax wchart
mq wci r8
mov rax 0 r8
mq chart-site r9
mov r9 8 r8

aqs windex
# anonomous-mmap
nao rdi
mq index-site rsi
add 1 rsi
mov 7 rdx
mov 22 r10
nao r9
nao r8
mov 9 rax
sys
mq wci r8
mov rax 10 r8
mq index-site r9
mov r9 18 r8
#init
#com

aqs key-site
mq key rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax key-site

ent rkey-site key-site
lent rkey-site rsi
mq key-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

ent rcurrent-rsite current-rsite
ent rnaof-records naof-records
ent ris-com is-com
ent rsite site
ent rcsite csite
ent rrsite rsite
ent rcmpv cmpv
ent rliw liw
ent rcurrent current
aqs is-com
aqs chart-at
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs site
nao r8
mq r8 site
aqs csite
aqs cmpv
aqs current
aqs current-site
aqs non-code
mov ffffffffffffffff r8
mq r8 non-code
aqs rsite
aqs liw
aqs naof-records
mq non-code r8
mq r8 naof-records
aqs current-rsite
aqs current-record
aqs current-record-site
aqs ochart-at
aqs ochart-at-site
aqs record-is-current
s seek-next-lw-init
	mq chart rsi
	mq rsi chart-at
	lent rsite rsi
	mq site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11


		nao r8
		mq r8 record-is-current
		mq chart-at rsi
		mq rsi ochart-at
		s calc-key-order-init
			mq chart-at rdi
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
			#sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			#sys
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
s seek-next-lw-com
#init
#com

##########################################################################################################
# com
##########################################################################################################
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
lq naof-entree-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
