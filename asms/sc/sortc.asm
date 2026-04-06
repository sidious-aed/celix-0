##########################################################################################################
# sortc
##########################################################################################################
# rdi | ci
# rsi | key
# r13 | wci
# r14 | sv
# rcx | nv
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
aqs nv
mq rcx nv
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

mq nv r8
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
#mq chart-site r9
mq chart-site r9
mov r9 8 r8

ent rindex-site index-site
lent rindex-site rsi
mq index-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

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
mq rax windex
mq wci r8
mov rax 10 r8
#mq index-site r9
nao r9
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

ent rnv nv
ent rrecord-is-current record-is-current
ent rnaof-scope-records naof-scope-records
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
aqs naof-non-records
aqs naof-scope-records
nao r8
mq r8 naof-non-records
mq r8 naof-scope-records
aqs cindex-site
mq r8 cindex-site
mq chart rsi
mq rsi chart-at
s discover-non-keys-init
	nao r8
	mq r8 record-is-current
	mq chart-at rsi
	mq rsi ochart-at
	s seek-key-for-non-discovery-init
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
		cmp 1 rax
		st jne set-for-non-discovery-that-record-is-current-com
			mov 1 r8
			mq r8 record-is-current
		s set-for-non-discovery-that-record-is-current-com

		mq is-com r8
		cmp 1 r8
		st je seek-key-for-non-discovery-com
		st jmp seek-key-for-non-discovery-init
	s seek-key-for-non-discovery-com

	lent rrecord-is-current rsi
	mq record-is-current rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	mq record-is-current r8
	cmp 1 r8
	st je incr-naof-scope-records-init
		lent rnv rsi
		mq nv rdi
		mov 0 rdi rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		ent rnv nv
		lent rnv rsi
		mq nv rdi
		mov 18 rcx
		mov a rbx
		nao r10
		mq equations rdx
		mq views r11
		addc views view-space r11
		#dct r11

		mq nv rdi
		mq ochart-at rsi
		mq chart-at rcx
		sub rsi rcx
		mq cs rbx
		mq equations rdx
		mq cf r11
		addc cf astr r11
		dct r11
		mq rax nv
		mq naof-non-records r8
		add 1 r8
		mq r8 naof-non-records
	s add-record-to-key-nons-com
	st jmp incr-naof-scope-records-com
	s incr-naof-scope-records-init
		mq naof-scope-records r8
		add 1 r8
		mq r8 naof-scope-records
	s incr-naof-scope-records-com

	mq chart-at rsi
	mq chart rdi
	sub rdi rsi
	mq rsi csite

	mq csite rsi
	mq chart-site r8
	cmp rsi r8
	st je discover-non-keys-com
	st jmp discover-non-keys-init
s discover-non-keys-com

ent rnon-records-site non-records-site
aqs non-records-site
mq nv r8
mov 0 r8 rdi
mq rdi non-records-site
lent rnon-records-site rsi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mq naof-scope-records rdi
lent rnaof-scope-records rsi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mq naof-scope-records r9
cmp 0 r9
st je seek-next-lw-com
s seek-next-lw-init
	mq chart rsi
	mq rsi chart-at
	lent rsite rsi
	mq site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11
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
				mov 1 rdi
				mq current rsi
				mq current-site rdx
				mov 1 rax
				#sys
				mov 1 rdi
				lent jsect rsi
				mov 1 rdx
				mov 1 rax
				#sys

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
					mov 1 rdi
					lent jsect rsi
					mov 1 rdx
					mov 1 rax
					#sys

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
		mq naof-non-records r9
		sub r9 r8
		mq r8 naof-records
	s set-naof-records-com

	mov 1 rdi
	mq current-record rsi
	mq current-record-site rdx
	mov 1 rax
	#sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
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

	mq wci r8
	mov 10 r8 rsi
	mq site r10
	factq sv-naof-esecs r10
	add r10 rsi
	mq current-record-site r11
	mq cindex-site r12
	add r11 r12
	mq r12 cindex-site
	mov r12 0 rsi

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
	add 1 r8
	mq r8 site
	mq site r8
	mq naof-records r9
	cmp r8 r9
	st je seek-next-lw-com
	st jmp seek-next-lw-init
s seek-next-lw-com
#init
#com

mq naof-non-records r8
cmp 0 r8
st je com-non-records-com
	mq wci rdi
	mov 8 rdi r8
	mov 0 rdi rdi
	add r8 rdi
	mq nv rsi
	mov 0 rsi rcx
	add 18 rsi
	mq equations r11
	addc equations com r11
	dct r11
	mq wci rsi
	mov 8 rsi r8
	mq non-records-site r9
	add r9 r8
	mov r8 8 rsi
s com-non-records-com

##########################################################################################################
# com
##########################################################################################################
mq sv rax
mq nv rbx
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
