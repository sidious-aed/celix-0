##########################################################################################################
# sortc
##########################################################################################################
# rdi | ci
# rsi | key
# r13 | wci
# r14 | sv
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
	#dct r11
#init
#com
	nao r8
	mq r8 rsite
	mq non-code r8
	mq r8 current
	s each-record-init
		lent rrsite rsi
		mq rsite rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11

		lent rcurrent rsi
		mq current rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11

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

			lent ris-com rsi
			mq is-com rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			#dct r11

			mq ckey rdi
			mq ckey-site rdx
			mq key rsi
			mq key-site rcx
			mq equations r11
			addc equations compair-spaces r11
			dct r11
			mq rax cmpv

			lent rcmpv rsi
			mq cmpv rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			#dct r11
#init
#com

			mq cmpv r8
			cmp 1 r8
			st jne wc-for-key-com
			s wc-for-key-init
				nao r10
				mq sv rdi
				mov 0 rdi r8
				cmp 0 r8
				st je calready-com
				factq sv-naof-esecs r8
				add 18 rdi
				mov rdi rsi
				add r8 rsi
				mq rsite r9
				s calready-init
					mov 0 rdi r8
					cmp r8 r9
					st je set-already-init
					add 8 rdi
					cmp rdi rsi
					st je calready-com
					st jmp calready-init
				s calready-com
				st jmp set-already-com
				s set-already-init
					mov 1 r10
				s set-already-com
				cmp 1 r10
				st je wc-for-key-com
#init
#com

				mq current r8
				mq non-code r9
				cmp r8 r9
				st je wc-for-initial-init

				s wc-for-through-init
					mq cvalue rdi
					mq cvalue-site rdx
					mq current rsi
					mq current-site rcx
					mq equations r11
					addc equations cs r11
					dct r11
					mq rax liw

					lent rliw rsi
					mq liw rdi
					mov 10 rbx
					mq equations rdx
					mq views r11
					addc views view-number r11
					#dct r11

					mq liw r8
					mq non-code r9
					cmp r8 r9
					st jne set-for-current-com
						mov 1 r8
						mq r8 record-is-current
						mq rsite r8
						mq r8 current-rsite
						mq cvalue rsi
						mq rsi current
						mq cvalue-site r8
						mq r8 current-site
					s set-for-current-com
				s wc-for-through-com

				st jmp wc-for-initial-com
				s wc-for-initial-init
					mov 1 r8
					mq r8 record-is-current
					mq rsite r8
					mq r8 current-rsite
					mq cvalue rsi
					mq rsi current
					mq cvalue-site r8
					mq r8 current-site
				s wc-for-initial-com
			s wc-for-key-com

			mq is-com r8
			cmp 1 r8
			st je calc-key-order-com
			st jmp calc-key-order-init
		s calc-key-order-com

		mq chart-at rsi
		mq chart rdi
		sub rdi rsi
		mq rsi csite

		mq chart-at rsi
		mq ochart-at rdi
		sub rdi rsi
		mq rsi ochart-at-site

		mq record-is-current r8
		cmp 1 r8
		st jne view-current-com
			mq ochart-at rsi
			mq rsi current-record 
			mq ochart-at-site r8
			mq r8 current-record-site
		s view-current-com

		lent rcsite rsi
		mq csite rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11

		lent rcurrent-rsite rsi
		mq current-rsite rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11
#init
#com

		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		mq rsite r8
		add 1 r8
		mq r8 rsite

		mq csite rsi
		mq chart-site r8
		cmp rsi r8
		st je each-record-com
		st jmp each-record-init
	s each-record-com
	mq naof-records r8
	mq non-code r9
	cmp r8 r9
	st jne set-naof-records-com
		mq rsite r8
		mq r8 naof-records
	s set-naof-records-com
	mq site r8
	add 1 r8
	mq r8 site

	mov 1 rdi
	mq current-record rsi
	mq current-record-site rdx
	mov 1 rax
	#sys

	mq wci rdi
	mov 8 rdi r8
	mov 0 rdi rdi
	add r8 rdi
	mq current-record rsi
	mq current-record-site rcx
	mq equations r11
	addc equations com r11
	dct r11
	mq wci rsi
	mov 8 rsi r8
	mq current-record-site r9
	add r9 r8
	mov r8 8 rsi

	mq sv rdi
	lq current-rsite rsi
	mq cs rbx
	mq equations rdx
	mq cf r11
	addc cf avec r11
	dct r11
	mq rax sv

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

	lent rnaof-records rsi
	mq naof-records rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq site r8
	mq naof-records r9
	cmp r8 r9
	st je seek-next-lw-com
	st jmp seek-next-lw-init
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
