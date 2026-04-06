##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 4c4b40 rsp
aqs equations
mq r9 equations
aqs views
mq r10 views
aqs cf
mq r11 cf
aqs binary-name
mq r12 binary-name
aqs naof-binary-name-secs
mq r13 naof-binary-name-secs
aqs objdfn
mq r14 objdfn
aqs system-cs
mq r14 system-cs
ent i-sim i sim. ka tic boo tic but.\n
ent jsect \n
ent source-init-code <
ent source-com-code >:
ent b16-com-code :
ent ssect  
ent robjdf objdf
ent rsect-site sect-site
ent rfsite fsite
ent rcmpv cmpv
ent rnrs nrs
ent rcom com.\n\n
ent rseek-site seek-site
ent rsegment-name-site segment-name-site
ent segment-code Disassembly of section
ent ris-asm is asm.\n
aqs segment-code-site
mov 16 r8
mq r8 segment-code-site
aqs segment-name-site
nao r8
mq r8 segment-name-site
aqs segment-name
isr 400
aqs section-name-site
aqs section-name
isr 400
aqs cs
isr 500
ent cname-com .bc
aqs cname
isr 200
aqs cname-site
aqs base-space
isr 200
aqs base-space-site

mov 1 rdi
lent i-sim rsi
mov 1b rdx
mov 1 rax
sys

mov 1 rdi
mq binary-name rsi
mq naof-binary-name-secs rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

aqs cfcs
isr 3d0908
lq cfcs rdi
nao r8
mov r8 0 rdi
mov 3d0900 r8
mov r8 8 rdi

mq binary-name rsi
lq cname rdi
mq naof-binary-name-secs rcx
mq equations r11
addc equations com r11
dct r11
mq binary-name rsi
lent cname-com rsi
lq cname rdi
mq naof-binary-name-secs r8
add r8 rdi
add 3 r8
mq r8 cname-site
mov 3 rcx
mq equations r11
addc equations com r11
dct r11

mov 1 rdi
lq cname rsi
mq cname-site rdx
mov 1 rax
sys

mq equations r11
addc equations task r11
#dct r11

##########################################################################################################
# rack-record-keys <--> * maybe meant warm even.
##########################################################################################################

ent kbin-site bin-site
aqs kbin-site-site
mov 8 r8
mq r8 kbin-site-site

ent kbin-secs bin-secs
aqs kbin-secs-site
mov 8 r8
mq r8 kbin-secs-site

ent knaof-secs naof-secs
aqs knaof-secs-site
mov 9 r8
mq r8 knaof-secs-site

##########################################################################################################
# chartify-objd
##########################################################################################################
aqs objdf
# open-read
nao rsi
mq objdfn rdi
mov 2 rax
sys
mq rax objdf

lent robjdf rsi
mq objdf rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs binc
mov 1 rdi
mov 10000 rsi
lq cfcs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax binc
aqs binc0
aqs binc1
mov 1 rdi
mov 10000 rsi
lq cfcs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax binc1
aqs combbinc
mov 1 rdi
mov 10000 rsi
lq cfcs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax combbinc

aqs key-space-site
aqs value-space-site
aqs key-space
isr 400
aqs value-space
isr 400
	# <--> in more their prime of proclimai. instead to see.
aqs secs-secs-space
isr 400
aqs secs-secs-space-site

mq binc rdi
lq cname rsi
mq cf r11
addc cf sc r11
dct r11

aqs cmpv
aqs fsite
nao r8
mq r8 fsite
aqs nrs
aqs sect-site
aqs seek-site0
aqs seek-site1
aqs seek-site2
ent ris-comb is-comb
aqs is-comb
nao r8
mq r8 is-comb
aqs at-asm-site
nao r8
mq r8 at-asm-site
ent rat-asm-site at-asm-site
aqs plsecs-com-site
aqs lsecs-com-site
aqs lsecs-com-key-com-site
aqs lsecs-com-site-site
aqs naof-asm-secs-com-site
aqs at-secs
aqs at-secs-site
s sections-init
	# lseek
	mq objdf rdi
	mq fsite rsi
	nao rdx
	mov 8 rax
	sys

	# read
	mq objdf rdi
	mov 500 rdx
	lq cs rsi
	mov 0 rax
	sys
	mq rax nrs
	cmp 0 rax
	st je sections-com

	lq cs rdi
	mq nrs rdx
	lent jsect rsi
	mov 1 rcx
	mq equations r11
	addc equations seek-space r11
	dct r11
	mq rax sect-site

	mov 1 rdi
	lq segment-name rsi
	mq segment-name-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mov 1 rdi
	lq section-name rsi
	mq section-name-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mov 1 rdi
	lq cs rsi
	mq sect-site rdx
	add 1 rdx
	mov 1 rax
	sys

lent rat-asm-site rsi
mq at-asm-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

	s calc-in-regards-to-section-init
		lq cs rdi
		mq segment-code-site rdx
		lent segment-code rsi
		mq segment-code-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax cmpv

		mq cmpv rax
		cmp 1 rax
		st jne set-segment-name-com

		s set-segment-name-init
			mq sect-site r8
			sub 18 r8
			mq r8 segment-name-site

			lq cs rsi
			add 17 rsi
			lq segment-name rdi
			mq segment-name-site rcx
			mq equations r11
			addc equations com r11
			dct r11
			st jmp calc-in-regards-to-section-com
		s set-segment-name-com

		lq cs rdi
		mq sect-site rdx
		mq binary-name rsi
		mq naof-binary-name-secs rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		cmp 0 rax
		st je set-section-name-com

		lq cs rdi
		mq sect-site rdx
		lent source-com-code rsi
		mov 2 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax cmpv

		mq cmpv rax
		mov ffffffffffffffff r8
		cmp r8 rax
		st je set-section-name-com
		s set-section-name-init
			lq cs rdi
			mq nrs rdx
			lent source-init-code rsi
			mov 1 rcx
			mq equations r11
			addc equations seek-space r11
			dct r11
			add 1 rax
			mq rax seek-site0

			mq sect-site r8
			sub 2 r8
			mq seek-site0 r9
			sub r9 r8
			mq r8 section-name-site

			lq cs rsi
			mq seek-site0 r8
			add r8 rsi
			lq section-name rdi
			mq section-name-site rcx
			mq equations r11
			addc equations com r11
			dct r11
			st jmp calc-in-regards-to-section-com
		s set-section-name-com

		lq cs rdi
		mq sect-site rdx
		lent b16-com-code rsi
		mq 1 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax cmpv
		mov ffffffffffffffff r8
		cmp rax r8
		st je is-asm-com

		s is-asm-init
			mq at-asm-site r8
			cmp 1 r8
			st je set-binc1-init
				mq binc r8
				mq r8 binc0
				st jmp set-binc1-com
			s set-binc1-init
				mq binc1 r8
				mq r8 binc0
			s set-binc1-com

			mov 1 rdi
			lent ris-asm rsi
			mov 8 rdx
			mov 1 rax
			sys

			lent kbin-site rsi
			lq key-space rdi
			mq kbin-site-site rcx
			mq equations r11
			addc equations com r11
			dct r11
			mq kbin-site-site rbx
			mq rbx key-space-site

			mov 1 rdi
			lq key-space rsi
			mq key-space-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs at-bin-site
			aqs at-bin-site-site
			lq cs rsi
			mq rsi at-bin-site
			nao r9
			s scn-to-at-bin-site-init
				movs 0 rsi r9
				cmp 9 r9
				st je scn-to-at-bin-site-init-init
				cmp 20 r9
				st je scn-to-at-bin-site-init-init

				st jmp scn-to-at-bin-site-init-com
				s scn-to-at-bin-site-init-init
					add 1 rsi
					st jmp scn-to-at-bin-site-init
				s scn-to-at-bin-site-init-com
			s scn-to-at-bin-site-com
			mq at-bin-site rdi
			mq rsi at-bin-site
			aqs naof-secs-to-bin-site
			sub rdi rsi
			mq rsi naof-secs-to-bin-site
			mq cmpv r10
			mq naof-secs-to-bin-site r11
			sub r11 r10
			mq r10 at-bin-site-site
			
			mov 1 rdi
			mq at-bin-site rsi
			mq at-bin-site-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq binc0 rdi
			lent kbin-site rcx
			mq kbin-site-site r10
			mq at-bin-site rsi
			mq at-bin-site-site r11
			nao r12
			lq cs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax binc0

			mq binc0 rsi
			mov 0 rsi r8
			mq r8 plsecs-com-site

lent rsect-site rsi
mq sect-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

			aqs naof-asm-secs
			aqs sect-et
			lq cs r8
			mq sect-site rdi
			add r8 rdi
			mq rdi sect-et
			mq at-bin-site rsi
			mq at-bin-site-site r8
			add r8 rsi
			add 2 rsi
			mq rsi at-secs
			nao r9
			nao r10
			nao r11
			nao r14
			s seek-at-secs-site-init
				movs 0 rsi r9
				cmp 0 r10
				st je seek-at-secs-site-mode-0-init
				cmp 1 r10
				st je seek-at-secs-site-mode-1-init
				s seek-at-secs-site-mode-0-init
					cmp 20 r9
					st je set-to-mod-1-init
					cmp 9 r9
					st je set-to-mod-1-init
					st jmp set-to-mod-1-com
					s set-to-mod-1-init
						add 1 r14
						mov 1 r10
					s set-to-mod-1-com
					st jmp seek-at-secs-site-mode-1-com
				s seek-at-secs-site-mode-0-com
				s seek-at-secs-site-mode-1-init
					cmp 9 r9
					st je seek-at-secs-site-com
					cmp 20 r9
					st je seek-at-secs-site-com
					nao r10
				s seek-at-secs-site-mode-1-com
				cmp rdi rsi
				st je seek-at-secs-site-with-comb-init
				add 1 rsi
				st jmp seek-at-secs-site-init
			s seek-at-secs-site-com
			mq r14 naof-asm-secs
			st jmp seek-at-secs-site-with-comb-com
			s seek-at-secs-site-with-comb-init
				mov 1 r11
				mq r11 is-comb
			s seek-at-secs-site-with-comb-com
			mq at-secs rdi
			sub rdi rsi
			sub 1 rsi
			mq rsi at-secs-site
			cmp 1 r11
			st je comb-mdshft-or-wrt-bth-init

			mq binc0 rdi
			lent kbin-secs rcx
			mq kbin-secs-site r10
			mq at-secs rsi
			mq at-secs-site r11
			nao r12
			lq cs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax binc0
			#mq r10 lsecs-com-key-com-site
			mq rbx lsecs-com-key-com-site

			mq plsecs-com-site r8
			mq r8 lsecs-com-site
			mq binc0 rsi
			mov 0 rsi r8
			mq r8 lsecs-com-site-site

			mov 1 rdi
			mq at-secs rsi
			mq at-secs-site rdx
			#mq at-secs r10
			#lq cs r11
			#sub r11 r10
			#mq sect-site rdx
			#sub r10 rdx
			#mov 10 rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mov 1 rdi
			mq binc0 rsi
			mov 0 rsi rdx
			add 18 rsi
			mov 1 rax
			sys
#init
#com
			
			mq naof-asm-secs rdi
			lq base-space rsi
			mov 10 rbx
			mq equations r8
			addc equations number-to-entree r8
			dct r8
			mq rax base-space-site

			mq binc0 rdi
			lent knaof-secs rcx
			mq knaof-secs-site r10
			lq base-space rsi
			mq base-space-site r11
			nao r12
			mov 1 r12
			lq cs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax binc0
			mq binc0 rsi
			mov 0 rsi r8
			mq r8 naof-asm-secs-com-site

			mov 1 rdi
			lq base-space rsi
			mq base-space-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs at-alu-module
			aqs naof-secs-from-alu-module
			mq at-secs rsi
			mq at-secs-site r8
			add r8 rsi
			nao r9
			s seek-to-asm-module-init
				movs 0 rsi r9
				cmp 9 r9
				st je seek-to-asm-module-cont
				cmp 20 r9
				st je seek-to-asm-module-cont
				st jmp seek-to-asm-module-com
				s seek-to-asm-module-cont
				add 1 rsi
				st jmp seek-to-asm-module-init
			s seek-to-asm-module-com
			lq cs rdi
			mov rsi r11
			sub rdi r11
			mq rsi at-alu-module
			mq sect-site r12
			sub r11 r12
			mq r12 naof-secs-from-alu-module

			mq at-alu-module rsi
			mq naof-secs-from-alu-module r8
			add r8 rsi
			sub 1 rsi
			nao r9
			s brace-back-from-alu-module-init
				movs 0 rsi r9
				cmp 20 r9
				st jne brace-back-from-alu-module-com
				sub 1 rsi
				sub 1 r8
				st jmp brace-back-from-alu-module-init
			s brace-back-from-alu-module-com
			mq r8 naof-secs-from-alu-module

			ent rnaof-secs-from-alu-module naof-secs-from-alu-module
			lent rnaof-secs-from-alu-module rsi
			mq naof-secs-from-alu-module rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11
			
			mov 1 rdi
			mq at-alu-module rsi
			mq naof-secs-from-alu-module rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs comp-segment-at
			mq at-alu-module rsi
			mq naof-secs-from-alu-module r8
			add r8 rsi
			mq rsi comp-segment-at
			sub 1 rsi
			nao r8
			movs 0 rsi r8
			cmp 3e r8
			st jne set-dname-com

			aqs at-dname
			aqs at-dname-com
			mq rsi at-dname-com
			aqs naof-dname-secs
			nao r8
			mq r8 naof-dname-secs
			s set-dname-init
				sub 1 rsi
				s brace-to-dname-init-init
					movs 0 rsi r8
					cmp 3c r8
					st je brace-to-dname-init-com
					sub 1 rsi
					st jmp brace-to-dname-init-init
				s brace-to-dname-init-com
				add 1 rsi
				mq rsi at-dname
				mq rsi comp-segment-at
				mq at-dname-com rdi
				sub rsi rdi
				mq rdi naof-dname-secs
				mq comp-segment-at r11
				sub 2 r11
				mq r11 comp-segment-at

				ent rnaof-dname-secs naof-dname-secs
				lent rnaof-dname-secs rsi
				mq naof-dname-secs rdi
				mov 10 rbx
				mq equations rdx
				mq views r11
				addc views view-number r11
				dct r11

				mov 1 rdi
				mq at-dname rsi
				mq naof-dname-secs rdx
				mov 1 rax
				sys
				mov 1 rdi
				lent jsect rsi
				mov 1 rdx
				mov 1 rax
				sys
			s set-dname-com

			aqs dest-code-site
			ent dest-code #
			mq at-alu-module rdi
			mq naof-secs-from-alu-module rdx
			lent dest-code rsi
			mov 1 rcx
			mq equations r11
			addc equations seek-space r11
			dct r11
			mq rax dest-code-site
			mq rax seek-site
			cmp 0 rax
			st jl set-destination-com

			s set-destination-init
				aqs destination-init
				aqs destination-com
				aqs naof-destination-secs

				mov 1 rdi
				mq comp-segment-at rsi
				lq cs rdx
				mq sect-site r8
				add r8 rdx
				sub rsi rdx
				mov 1 rax
				sys
				mov 1 rdi
				lent jsect rsi
				mov 1 rdx
				mov 1 rax
				sys

				ent rdest-code-site dest-code-site
				lent rdest-code-site rsi
				mq dest-code-site rdi
				mov 10 rbx
				mq equations rdx
				mq views r11
				addc views view-number r11
				dct r11

				secs 90 90 90
				mq comp-segment-at rsi
				nao r8
				s brace-to-destination-com-init
					movs 0 rsi r8
					cmp 20 r8
					st jne brace-to-destination-com-com
					sub 1 rsi
					st jmp brace-to-destination-com-init
				s brace-to-destination-com-com
				add 1 rsi
				mq rsi destination-com

				mov 1 rdi
				mq destination-com rsi
				lq cs rdx
				mq sect-site r8
				add r8 rdx
				sub rsi rdx
				mov 1 rax
				sys
				mov 1 rdi
				lent jsect rsi
				mov 1 rdx
				mov 1 rax
				sys

				mq destination-com rsi
				sub 1 rsi
				s brace-to-destination-init-init
					movs 0 rsi r8
					cmp 20 r8
					st je brace-to-destination-init-com
					sub 1 rsi
					st jmp brace-to-destination-init-init
				s brace-to-destination-init-com
				mq rsi comp-segment-at
				add 1 rsi
				mq rsi destination-init
				mq destination-com rdi
				sub rsi rdi
				mq rdi naof-destination-secs

				mov 1 rdi
				mq destination-init rsi
				mq naof-destination-secs rdx
				mov 1 rax
				sys
				mov 1 rdi
				lent jsect rsi
				mov 1 rdx
				mov 1 rax
				sys

				ent rnaof-destination-secs naof-destination-secs
				lent rnaof-destination-secs rsi
				mq naof-destination-secs rdi
				mov 10 rbx
				mq equations rdx
				mq views r11
				addc views view-number r11
				dct r11

				mq destination-init rsi
				sub 3 rsi
				mq rsi comp-segment-at
			s set-destination-com

			aqs params-com
			aqs params-init
			aqs naof-params-secs
			mq comp-segment-at rsi
			nao r8
			s brace-to-params-com-init
				movs 0 rsi r8
				cmp 20 r8
				st jne brace-to-params-com-com
				sub 1 rsi
				st jmp brace-to-params-com-init
			s brace-to-params-com-com
			mq rsi params-com

			mq params-com rsi
			sub 1 rsi
			s brace-to-params-init-init
				movs 0 rsi r8
				cmp 20 r8
				st je brace-to-params-init-sxt
				cmp 9 r8
				st je brace-to-params-init-sxt
				sub 1 rsi
				st jmp brace-to-params-init-init
				s brace-to-params-init-sxt
			s brace-to-params-init-com
			add 1 rsi
			mq rsi params-init
			mq params-com rdi
			sub rsi rdi
			mq rdi naof-params-secs

			mov 1 rdi
			mq params-init rsi
			mq naof-params-secs rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq params-init rsi
			sub 1 rsi
			nao r8
			movs 0 rsi r8
			cmp 9 r8
			st je set-for-not-params-init
			mov 1 r9
			s calc-if-params-init
				movs 0 rsi r8
				cmp 20 r8
				st jne calc-if-params-com
				sub 1 rsi
				add 1 r9
				st jmp calc-if-params-init
			s calc-if-params-com
			cmp 2 r9
			st jae set-for-not-params-com
			s set-for-not-params-init
				nao r8
				mq r8 naof-params-secs
				st jmp for-params-com
			s set-for-not-params-com
				mq params-init rsi
				sub 1 rsi
				mq rsi comp-segment-at
			s for-params-com

			ent rnaof-params-secs naof-params-secs
			lent rnaof-params-secs rsi
			mq naof-params-secs rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mov 1 rdi
			mq params-init rsi
			mq naof-params-secs rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

#init
			mov 1 rdi
			mq comp-segment-at rsi
			lq cs rdx
			mq sect-site r8
			add r8 rdx
			sub rsi rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs alu-module-com
			aqs alu-module-init
			aqs naof-alu-module-secs
			mq comp-segment-at rsi
			nao r8
			s brace-to-alu-module-com-init
				movs 0 rsi r8
				cmp 20 r8
				st jne brace-to-alu-module-com-com
				sub 1 rsi
				st jmp brace-to-alu-module-com-init
			s brace-to-alu-module-com-com
			add 1 rsi
			mq rsi alu-module-com
			s brace-to-alu-module-init-init
				movs 0 rsi r8
				cmp 20 r8
				st je brace-to-alu-module-init-com
				sub 1 rsi
				st jmp brace-to-alu-module-init-init
			s brace-to-alu-module-init-com
			mq rsi comp-segment-at
			add 1 rsi
			mq rsi alu-module-init
			mq alu-module-com rdi
			sub rsi rdi
			mq rdi naof-alu-module-secs

			mov 1 rdi
			mq alu-module-init rsi
			mq naof-alu-module-secs rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
#com

			s comb-mdshft-or-wrt-bth-init
lent ris-comb rsi
mq is-comb rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

			mq at-asm-site r8
			cmp 0 r8
			st je is-asm-s0-init
			cmp 1 r8
			st je is-asm-s1-init
			s is-asm-s0-init
				add 1 r8
				mq r8 at-asm-site
				st jmp is-asm-s1-com
			s is-asm-s0-com
			s is-asm-s1-init
				mq is-comb r8
				cmp 1 r8
				st je apend-binc-init
				s write0-init
					mq binc rdi
					lq cname rsi
					mq cf r11
					addc cf ac r11
					dct r11
					mq binc rdi
					nao r9
					mov r9 0 rdi

					mq binc rdi
					mq binc1 rsi
					mov 0 rsi rcx
					add 18 rsi
					lq cs rbx
					mq equations rdx
					mq cf r11
					addc cf astr r11
					dct r11
					mq rax binc

					mq binc1 rdi
					nao r9
					mov r9 0 rdi
					mov 1 r8
					mq r8 at-asm-site
					st jmp apend-binc-com
				s write0-com
				s apend-binc-init
					nao r8
					mq r8 is-comb
					mq combbinc rsi
					nao r9
					mov r9 0 rsi

mov 1 rdi
mq binc0 rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
#sys

mov 1 rdi
mq at-secs rsi
mq at-secs-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

					mq combbinc rdi
					mq binc rsi
					add 18 rsi
					mq lsecs-com-site rcx
					lq cs rbx
					mq equations rdx
					mq cf r11
					addc cf astr r11
					dct r11
					mq rax combbinc

aqs osecs-site
mq lsecs-com-key-com-site r8
mq lsecs-com-site-site rdi
sub r8 rdi
sub 1 rdi
mq rdi osecs-site

lent rat-asm-site rsi
mq osecs-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdx
mq binc rsi
add 18 rsi
mq lsecs-com-key-com-site r8
add r8 rsi
mq osecs-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

					mq osecs-site r8
					mq r8 secs-secs-space-site
					lq secs-secs-space rdi
					mq binc rsi
					add 18 rsi
					mq lsecs-com-key-com-site r8
					add r8 rsi
					mq osecs-site rcx
					mq equations r11
					addc equations com r11
					dct r11

					lq secs-secs-space rdi
					mq secs-secs-space-site r8
					add r8 rdi
					add 1 r8
					mq r8 secs-secs-space-site
					lent ssect rsi
					mov 1 rcx
					mq equations r11
					addc equations com r11
					dct r11

					lq secs-secs-space rdi
					mq secs-secs-space-site r8
					add r8 rdi
					mq at-secs rsi
					mq at-secs-site rcx
					add rcx r8
					mq r8 secs-secs-space-site
					mq equations r11
					addc equations com r11
					dct r11

					mq combbinc rdi
					lent kbin-secs rcx
					mq kbin-secs-site r10
					lq secs-secs-space rsi
					mq secs-secs-space-site r11
					nao r12
					lq cs rbx
					mq equations rdx
					mq cf r13
					mq cf r14
					addc cf atc r14
					dct r14
					mq rax combbinc

					mov 1 rdi
					mq combbinc rsi
					mov 0 rsi rdx
					add 18 rsi
					mov 1 rax
					sys
					mov 1 rdi
					lent jsect rsi
					mov 1 rdx
					mov 1 rax
					sys

					aqs naof-comb-secs
					lq secs-secs-space rsi
					mq secs-secs-space-site r8
					mov rsi rdi
					add r8 rdi
					nao r9
					mov 1 r10
					s calc-naof-asm-secs-for-comb-init
						movs 0 rsi r9
						cmp 20 r9
						st jne incr-naof-comb-secs-com
							add 1 r10
						s incr-naof-comb-secs-com
						cmp rsi rdi
						st je calc-naof-asm-secs-for-comb-com
						add 1 rsi
						st jmp calc-naof-asm-secs-for-comb-init
					s calc-naof-asm-secs-for-comb-com
					mq r10 naof-comb-secs

					ent rnaof-comb-secs naof-comb-secs
					lent rnaof-comb-secs rsi
					mq naof-comb-secs rdi
					mov 10 rbx
					mq equations rdx
					mq views r11
					addc views view-number r11
					dct r11

					mq naof-comb-secs rdi
					lq base-space rsi
					mov 10 rbx
					mq equations r8
					addc equations number-to-entree r8
					dct r8
					mq rax base-space-site

					mq combbinc rdi
					lent knaof-secs rcx
					mq knaof-secs-site r10
					lq base-space rsi
					mq base-space-site r11
					mov 1 r12
					lq cs rbx
					mq equations rdx
					mq cf r13
					mq cf r14
					addc cf atc r14
					dct r14
					mq rax combbinc

					mq combbinc rdi
					lq cname rsi
					mq cf r11
					addc cf ac r11
					dct r11
					mq combbinc rdi
					nao r9
					mov r9 0 rdi
					mq binc rdi
					nao r9
					mov r9 0 rdi
					mq binc1 rdi
					nao r9
					mov r9 0 rdi

					nao r8
					mq r8 at-asm-site
					#st jmp sections-com
				s apend-binc-com
				nao r8
			s is-asm-s1-com
		s is-asm-com
	s calc-in-regards-to-section-com

	mov 1 rdi
	lent rcom rsi
	mov 6 rdx
	mov 1 rax
	sys

	mq fsite r8
	mq sect-site r9
	add r9 r8
	add 1 r8
	mq r8 fsite
	st jmp sections-init
s sections-com
mq at-asm-site r8
cmp 1 r8
st jne append-mode-et-com
	mq binc rdi
	lq cname rsi
	mq cf r11
	addc cf ac r11
	dct r11
	mq binc rdi
	nao r9
	mov r9 0 rdi
s append-mode-et-com

# close
mq objdf rdi
mov 3 rax
sys

mq equations r11
addc equations task r11
#dct r11

##########################################################################################################
# com
##########################################################################################################
add 4c4b40 rsp
ret

#init
ent fn droid/clerk-com.secs
aqs file
# unlink
lentb fn rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 41 rsi
lentb fn rdi
mov 2 rax
sys
mqb rax file
# write
mqb file rdi
mov 8 rdx
lq b16-number rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com

#init
lent rcmpv rsi
mq cmpv rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com

#init
aqs time-secs
nao r8
mqb r8 time-secs
aqs time-micro-secs
mov aed r8
mqb r8 time-micro-secs
s task0-init
# nanosleep
lqb time-seconds rdi
mov 23 rax
sys
st jmp task0-init
s task0-com
#com
