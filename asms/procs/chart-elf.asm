##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% cf
% sc
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
aqs sc
mq r15 sc
aqs binary-name
mq r12 binary-name
aqs naof-binary-name-secs
mq r13 naof-binary-name-secs
aqs elfdfn
mq r14 elfdfn
aqs elffn
mq rsi elffn
aqs elffn-site
mq rcx elffn-site
ent i-sim i sim. ka tic boo tic but.\n
ent jsect \n
ent asect  
ent vsect  | 
aqs cs
isr 400
aqs cs0
isr 400
aqs cs0-site
aqs cs1
isr 400
aqs cs1-site
aqs cs2
isr 400
aqs cs2-site
ent mat-mode-3 at mode 3.\n
aqs comn-mod-fact
mov 2 r10
mq r10 comn-mod-fact
aqs naof-sh-secs
mov 40 r10
mq r10 naof-sh-secs
aqs naof-dsr-secs
mov 18 r10
mq r10 naof-dsr-secs
aqs cfcs
isr 1e8480
lq cfcs r9
nao r8
mov r8 0 r9
mov 1e8480 r8
mov r8 8 r9

aqs binf
# open-read
mq binary-name rdi
nao rsi
mov 2 rax
sys
mq rax binf

mov 1 rdi
mq elffn rsi
mq elffn-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

# unlink
mq elffn rdi
mov 57 rax
sys

mov 1 rdi
lent i-sim rsi
mov 1b rdx
mov 1 rax
sys

aqs elff
# open-read
mq elfdfn rdi
nao rsi
mov 2 rax
sys
mq rax elff

mq equations r11
addc equations task r11
#dct r11

##########################################################################################################
# chart-meta
##########################################################################################################
ent at-section-names-site Section header string table index:
ent at-mode-2 Section Headers:
ent at-mode-5 Program Headers:
ent at-mode-4 Key to Flags:
ent at-mode-8   Tag
ent at-esection-headers Start of section headers:
ent at-interpreter [Requesting program interpreter:
ent at-rela-dyn Relocation section '.rela.dyn'
ent at-rela-plt Relocation section '.rela.plt'
ent at-dynsymt Symbol table '.dynsym'
aqs record-name-cs
isr 200
aqs record-name-cs-site
ent at-dynsym DYNSYM
ent at-dynstr .dynstr
ent b16-nao 0
ent bracin-init [

ent vrs rs | 
ent vname name | 
ent vtype type | 
ent vbind bind | 
ent vloc loc | 
ent vvsite vsite | 
ent vsite site | 
ent vnaof-secs naof-secs | 
ent vnaof-rsecs naof-rsecs | 
ent vflags flags | 
ent vlink link | 
ent vinfo info | 
ent valign align | 
ent vinterp-name interp-name | 
ent vfsite fsite | 
ent vvsite vsite | 
ent vnaof-fsecs naof-fsecs | 
ent vnaof-vsecs naof-vsecs | 
ent vsns sns | 
ent vmvalue mvalue | 
ent vbin-sn-site bin-sn-site | 
ent vsh-bin-site sh-bin-site | 
ent vsh-full-name sh-full-name | 
ent vdyn-code dyn-code | 
ent vdyn-type dyn-type | 
ent vdyn-name dyn-name | 
ent vvalue value | 
ent vsect-site sect-site | 
##########################################################################################################
# chart-elf
##########################################################################################################
aqs esite
nao r8
mq r8 esite
aqs nrs
aqs mode
mq r8 mode
aqs mode-site
mq r8 mode-site
aqs mode-cmp
aqs aon
aqs sn-bin-site
aqs sh-bin-site
aqs dynsym-site
aqs dynstr-site
aqs rela-rname
aqs rela-rname-site
aqs rela-rname-esite

ent krtype rtype
ent krtype-meta meta
ent ksh sh
ent kph ph
ent kname name
ent krs rs
ent ktype type
ent kvsite vsite
ent ksite site
ent knaof-secs naof-secs
ent knaof-rsecs naof-rsecs
ent kflags flags
ent klink link
ent kinfo info
ent kalign align
ent kfsite fsite
ent knaof-fsecs naof-fsecs
ent krela-dyn rela-dyn
ent krela-plt rela-plt
ent kdynamic dynamic
ent kcode code
ent kdynsym dynsym
ent kvalue value
ent kbind bin
ent kloc loc
ent ksect-site sect-site

aqs elfc
mov 1 rdi
mov 10000 rsi
lq cfcs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax elfc
#init
#com

##########################################################################################################
# elf-initials
##########################################################################################################
ent rcs0 cs0
ent rcs1 cs1
ent rmode-cmp mode-cmp
ent rmode mode
ent rmode-site mode-site
ent remeta-value-site emeta-value-site
ent resite esite
aqs sect-site
ent rnrs nrs
ent rsns sns
ent rsns-site sns-site
ent rsect-site sect-site
ent rsect-site sect-site
ent rsn-bin-site sn-bin-site
ent rsh-bin-site sh-bin-site
ent rstr-site str-site
ent rdynsym-site dynsym-site
ent rdynstr-site dynstr-site
ent rdyn-sym-link dyn-sym-link
ent relfc elfc
s elf-initials-init
	lent resite rsi
	mq esite rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rmode rsi
	mq mode rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	# lseek
	mq elff rdi
	mq esite rsi
	nao rdx
	mov 8 rax
	sys

	# read
	mq elff rdi
	mov 400 rdx
	lq cs rsi
	mov 0 rax
	sys
	cmp 0 rax
	st je elf-initials-com
	mq rax nrs

	lq cs rdi
	mq nrs rdx
	lent jsect rsi
	mov 1 rcx
	mq equations r11
	addc equations seek-space r11
	dct r11
	mq rax sect-site

	lent rsect-site rsi
	mq sect-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	mov 1 rdi
	lq cs rsi
	mq sect-site rdx
	add 1 rdx
	mov 1 rax
	sys

	lent rmode rsi
	mq mode rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	aqs sns
	aqs sns-site
	aqs section-name-site
	aqs section-name-site-site
	mq mode r8
	cmp 0 r8
	st jne elf-initials-mode-0-com
		lq cs rdi
		mq sect-site rdx
		lent at-esection-headers rsi
		mov 19 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		aqs sh-bin-site-e
		aqs sh-bin-site-esite
		mq mode-cmp r8
		mov ffffffffffffffff r9
		cmp r8 r9
		st je at-section-headerse-site-com
			lq cs rsi
			add 1d rsi
			nao r9
			s seek-sh-bin-site-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-sh-bin-site-init-com
				add 1 rsi
				st jmp seek-sh-bin-site-init-init
			s seek-sh-bin-site-init-com
			mq rsi sh-bin-site-e
			mov rsi rdi
			s seek-sh-bin-site-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-sh-bin-site-com-com
				add 1 rsi
				st jmp seek-sh-bin-site-com-init
			s seek-sh-bin-site-com-com
			sub rdi rsi
			mq rsi sh-bin-site-esite
			mov 1 rdi
			lent vsh-bin-site rsi
			mov e rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq sh-bin-site-e rsi
			mq sh-bin-site-esite rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq sh-bin-site-e rsi
			mq sh-bin-site-esite rcx
			mov a rbx
			mq equations r12
			addc equations entree-to-number r12
			dct r12
			mq rax sh-bin-site

			lent rsh-bin-site rsi
			mq sh-bin-site rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11
		s at-section-headerse-site-com

		lq cs rdi
		mq sect-site rdx
		lent at-section-names-site rsi
		mov 22 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-cmp rax
		mov ffffffffffffffff r8
		cmp r8 rax
		st je elf-initials-mode-0-com
		lq cs rsi
		mq mode-cmp r8
		add r8 rsi
		add 22 rsi
		nao r9
		s seek-section-name-site-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-section-name-site-init-com
			add 1 rsi
			st jmp seek-section-name-site-init-init
		s seek-section-name-site-init-com
		mq rsi section-name-site
		mov rsi rdi
		s seek-section-name-site-com-init
			movs 0 rsi r9
			cmp a r9
			st je seek-section-name-site-com-com
			add 1 rsi
			st jmp seek-section-name-site-com-init
		s seek-section-name-site-com-com
		sub rdi rsi
		mq rsi section-name-site-site
		mov 1 rdi
		lent vsns rsi
		mov 6 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq section-name-site rsi
		mq section-name-site-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys
		mov 1 r8
		mq r8 mode
		mq section-name-site rsi
		mq section-name-site-site rcx
		mov a rbx
		mq equations r12
		addc equations entree-to-number r12
		dct r12
		mq rax sns

		lent rsns rsi
		mq sns rdi
		mov a rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11
		nao r8
		mq r8 mode-site
		mq sns r11
		factq comn-mod-fact r11
		add 4 r11
		mq r11 sns-site

		lent rsns-site rsi
		mq sns-site rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11
		st jmp elf-initials-drive-esite-init
	s elf-initials-mode-0-com

	mq mode r8
	cmp 1 r8
	st jne elf-initials-mode-1-com
		lent rmode-site rsi
		mq mode-site rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11
		mq mode-site r8
		mq sns-site r9
		cmp r8 r9
		st jne elf-initials-mode-1-smode2-com
			mov 2 r8
			mq r8 mode
			st jmp elf-initials-mode-1-com
		s elf-initials-mode-1-smode2-com
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
	s elf-initials-mode-1-com

	aqs ebin-sn-site
	aqs ebin-sn-site-site
	mq mode r8
	cmp 2 r8
	st jne elf-initials-mode-2-com
	s elf-initials-mode-2-init
		lq cs rsi
		mq sect-site r8
		add r8 rsi
		mov rsi rdi
		nao r9
		s seek-sect-name-bin-site-init-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-sect-name-bin-site-init-com
			sub 1 rsi
			st jmp seek-sect-name-bin-site-init-init
		s seek-sect-name-bin-site-init-com
		add 1 rsi
		s seek-sect-name-bin-site-init-init-0
			movs 0 rsi r9
			cmp 30 r9
			st jne seek-sect-name-bin-site-init-com-0
			add 1 rsi
			st jmp seek-sect-name-bin-site-init-init-0
		s seek-sect-name-bin-site-init-com-0
		mq rsi ebin-sn-site
		sub rsi rdi
		mq rdi ebin-sn-site-site
		mov 1 rdi
		lent vbin-sn-site rsi
		mov e rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq ebin-sn-site rsi
		mq ebin-sn-site-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys
		mov 1 r8
		mq ebin-sn-site rsi
		mq ebin-sn-site-site rcx
		mov 10 rbx
		mq equations r12
		addc equations entree-to-number r12
		dct r12
		mq rax sn-bin-site

		lent rsn-bin-site rsi
		mq sn-bin-site rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11
		st jmp elf-initials-com
	s elf-initials-mode-2-com

	s elf-initials-drive-esite-init
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mq esite r8
	mq sect-site r9
	add r9 r8
	add 1 r8
	mq r8 esite
	st jmp elf-initials-init
s elf-initials-com
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# elf-primeary
##########################################################################################################
nao r8
mq r8 esite
mq r8 mode
mq r8 mode-site
s each-elf-section-init
	lent resite rsi
	mq esite rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	# lseek
	mq elff rdi
	mq esite rsi
	nao rdx
	mov 8 rax
	sys

	# read
	mq elff rdi
	mov 400 rdx
	lq cs rsi
	mov 0 rax
	sys
	cmp 0 rax
	st je each-elf-section-com
	mq rax nrs

	lent rnrs rsi
	mq nrs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lq cs rdi
	mq nrs rdx
	lent jsect rsi
	mov 1 rcx
	mq equations r11
	addc equations seek-space r11
	dct r11
	mq rax sect-site

	lent rsect-site rsi
	mq sect-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rmode rsi
	mq mode rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rmode-site rsi
	mq mode-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	mov 1 rdi
	lq cs rsi
	mq sect-site rdx
	add 1 rdx
	mov 1 rax
	sys

	##########################################################################################################
	# mode-switches
	##########################################################################################################
	mq mode r8
	cmp 0 r8
	st jne smode1-com
		mov 1 r8
		mq r8 mode
		st jmp drive-esite-init
	s smode1-com
	mq mode r8
	cmp 1 r8
	st jne smode2-com
		lq cs rdi
		mov 10 rdx
		lent at-mode-2 rsi
		mov 10 rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-cmp rax
		cmp 1 rax
		st jne set-to-mode-2-com
			mov 2 r8
			mq r8 mode
			st jmp drive-esite-init
		s set-to-mode-2-com
	s smode2-com
	mq mode r8
	cmp 2 r8
	st jne smode3-com
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
		cmp 4 r8
		st jne set-to-mode-3-com
			nao r8
			mq r8 mode-site
			mov 3 r8
			mq r8 mode
		s set-to-mode-3-com
		st jmp drive-esite-init
	s smode3-com
	mq mode r8
	cmp 3 r8
	st jne smode4-com
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
		lq cs rdi
		mov d rdx
		lent at-mode-4 rsi
		mov d rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-cmp rax
		cmp 1 rax
		st jne set-to-mode-4-com
			mov 4 r8
			mq r8 mode
			st jmp drive-esite-init
		s set-to-mode-4-com
	s smode4-com
	mq mode r8
	cmp 4 r8
	st jne smode5-com
		lq cs rdi
		mov 10 rdx
		lent at-mode-5 rsi
		mov 10 rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-cmp rax
		cmp 1 rax
		st jne set-to-mode-5-com
			nao r8
			mq r8 mode-site
			mov 5 r8
			mq r8 mode
			st jmp drive-esite-init
		s set-to-mode-5-com
		st jmp drive-esite-init
	s smode5-com
	mq mode r8
	cmp 5 r8
	st jne smode6-com
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
		cmp 2 r8
		st jne st-mode-6-com
			nao r8
			mq r8 mode-site
			mov 6 r8
			mq r8 mode
			st jmp drive-esite-init
		s st-mode-6-com
	s smode6-com
	mq mode r8
	cmp 6 r8
	st jne smode7-com
		mq sect-site r8
		cmp 0 r8
		st jne st-mode-7-com
			nao r8
			mq r8 mode-site
			mov 7 r8
			mq r8 mode
			st jmp drive-esite-init
		s st-mode-7-com
		lq cs rdi
		mq sect-site rdx
		lent at-interpreter rsi
		mov 20 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		aqs interpreter-name
		aqs interpreter-name-site
		mq mode-cmp r8
		mov ffffffffffffffff r9
		cmp r8 r9
		st je at-interpreter-com
			lq cs rsi
			mq mode-cmp r8
			add r8 rsi
			nao r9
			s seek-interpreter-init-init
				movs 0 rsi r9
				cmp 3a r9
				st je seek-interpreter-init-com
				add 1 rsi
				st jmp seek-interpreter-init-init
			s seek-interpreter-init-com
			add 2 rsi
			mq rsi interpreter-name
			mov rsi rdi
			s seek-interpreter-com-init
				movs 0 rsi r9
				cmp 5d r9
				st je seek-interpreter-com-com
				add 1 rsi
				st jmp seek-interpreter-com-init
			s seek-interpreter-com-com
			sub rdi rsi
			mq rsi interpreter-name-site
			mov 1 rdi
			lent vinterp-name rsi
			mov e rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq interpreter-name rsi
			mq interpreter-name-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
			st jmp drive-esite-init
		s at-interpreter-com
	s smode7-com
	mq mode r8
	cmp 7 r8
	st jne smode8-com
	s smode8-init
		lq cs rdi
		mov 5 rdx
		lent at-mode-8 rsi
		mov 5 rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp
		cmp 1 rax
		st jne drive-stm8-com
			nao r8
			mq r8 mode-site
			mov 8 r8
			mq r8 mode
		s drive-stm8-com
	s smode8-com
	mq mode r8
	cmp 8 r8
	st jne smode9-com
	s smode9-init
		mq sect-site r8
		cmp 0 r8
		st jne smode9-com
		nao r8
		mq r8 mode-site
		mov 9 r8
		mq r8 mode
		st jmp drive-esite-init
	s smode9-com
	mq mode r8
	cmp 9 r8
	st jb smodesa9-com
		ent i-sim-p9 at p9 section.\n
		mov 1 rdi
		lent i-sim-p9 rsi
		mov f rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq sect-site r8
		cmp 0 r8
		st jne dmss-st9-com
			mov 9 r8
			mq r8 mode
			mq r8 mode-site
			st jmp drive-esite-init
		s dmss-st9-com

		lq cs rdi
		mov 1c rdx
		lent at-rela-dyn rsi
		mov 1c rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp
		cmp 1 rax
		st jne sma-com
			nao r8
			mq r8 mode-site
			mov a r8
			mq r8 mode
			st jmp drive-esite-init
		s sma-com

		lq cs rdi
		mov 1c rdx
		lent at-rela-plt rsi
		mov 1c rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp
		cmp 1 rax
		st jne smb-com
			nao r8
			mq r8 mode-site
			mov b r8
			mq r8 mode
			st jmp drive-esite-init
		s smb-com

		lq cs rdi
		mov 16 rdx
		lent at-dynsymt rsi
		mov 16 rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax mode-cmp
		cmp 1 rax
		st jne smc-com
			nao r8
			mq r8 mode-site
			mov c r8
			mq r8 mode
			st jmp drive-esite-init
		s smc-com

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11
	s smodesa9-com

	mq sect-site rax
	cmp 0 rax
	st je drive-esite-init

	##########################################################################################################
	# modes
	##########################################################################################################
	mq mode r8
	cmp 1 r8
	st jne each-section-mode-1-com

	aqs emeta-name
	aqs emeta-name-site
	aqs emeta-value
	aqs emeta-value-site
	s each-section-mode-1-init
		lq cs rsi
		add 2 rsi
		mq rsi emeta-name
		mov rsi rdi
		nao r9
		s seek-emeta-name-com-init
			movs 0 rsi r9
			cmp 41 r9
			st jb mode-1-downcase-com
			cmp 5a r9
			st ja mode-1-downcase-com
				add 20 r9
				movs r9 0 rsi
			s mode-1-downcase-com
			cmp 20 r9
			st jne mode-1-hyphenise-com
				mov 2d r9
				movs r9 0 rsi
			s mode-1-hyphenise-com
			cmp 3a r9
			st je seek-emeta-name-com-com
			add 1 rsi
			st jmp seek-emeta-name-com-init
		s seek-emeta-name-com-com
		sub rdi rsi
		mq rsi emeta-name-site
		ent vmname mname | 
		mov 1 rdi
		lent vmname rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq emeta-name rsi
		mq emeta-name-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq elfc rdi
		lent krtype rcx
		mov 5 r10
		lent krtype-meta rsi
		mov 4 r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kname rcx
		mov 4 r10
		mq emeta-name rsi
		mq emeta-name-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq emeta-name rsi
		mq emeta-name-site r8
		add r8 rsi
		add 1 rsi
		nao r9
		s seek-emeta-value-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-emeta-value-init-com
			add 1 rsi
			st jmp seek-emeta-value-init-init
		s seek-emeta-value-init-com
		mq rsi emeta-value
		lq cs rdi
		sub rdi rsi
		mq sect-site r8
		sub rsi r8
		mq r8 emeta-value-site

		lent remeta-value-site rsi
		mq emeta-value-site rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mov 1 rdi
		lent vmvalue rsi
		mov 9 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq emeta-value rsi
		mq emeta-value-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq elfc rdi
		lent kvalue rcx
		mov 5 r10
		mq emeta-value rsi
		mq emeta-value-site r11
		mov 1 r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		mq elffn rsi
		mq cf r11
		addc cf ac r11
		dct r11
		mq elfc rdi
		nao r9
		mov r9 0 rdi

	s each-section-mode-1-com

	cmp 3 r8
	st jne each-section-mode-3-com

	s each-section-mode-3-init
		mov 1 rdi
		lent mat-mode-3 rsi
		mov b rdx
		mov 1 rax
		sys

		mq mode-site rax
		sub 1 rax
		nao rdx
		divq comn-mod-fact
		mq rdx mode-cmp

		lent rmode-cmp rsi
		mq mode-cmp rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-cmp rdx
		cmp 1 rdx
		st je mode-3-mode-1-init

		s mode-3-mode-0-init
			lq cs rsi
			lq cs2 rdi
			mq sect-site rcx
			add 1 rcx
			mq equations r11
			addc equations com r11
			dct r11

			aqs secth-rs
			aqs secth-rs-site
			lq cs2 rsi
			add 3 rsi
			nao r9
			s seek-to-secth-rs-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-to-secth-rs-init-com
				add 1 rsi
				st jmp seek-to-secth-rs-init-init
			s seek-to-secth-rs-init-com
			mq rsi secth-rs
			mov rsi rdi
			s seek-to-secth-rs-com-init
				movs 0 rsi r9
				cmp 5d r9
				st je seek-to-secth-rs-com-com
				add 1 rsi
				st jmp seek-to-secth-rs-com-init
			s seek-to-secth-rs-com-com
			sub rdi rsi
			mq rsi secth-rs-site

			mov 1 rdi
			lent vrs rsi
			mov 5 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-rs rsi
			mq secth-rs-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-name
			aqs secth-name-site
			mq secth-rs rsi
			mq secth-rs-site r8
			add r8 rsi
			add 2 rsi
			mq rsi secth-name
			mov rsi rdi
			nao r9
			s seek-secth-name-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-name-com-com
				add 1 rsi
				st jmp seek-secth-name-com-init
			s seek-secth-name-com-com
			sub rdi rsi
			mq rsi secth-name-site

			mov 1 rdi
			lent vname rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-name rsi
			mq secth-name-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-type
			aqs secth-type-site
			mq secth-name rsi
			mq secth-name-site r8
			add r8 rsi
			nao r9
			s seek-secth-type-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-secth-type-init-com
				add 1 rsi
				st jmp seek-secth-type-init-init
			s seek-secth-type-init-com
			mq rsi secth-type
			mov rsi rdi
			s seek-secth-type-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-type-com-com
				#add 20 r9
				movs r9 0 rsi
				add 1 rsi
				st jmp seek-secth-type-com-init
			s seek-secth-type-com-com
			sub rdi rsi
			mq rsi secth-type-site

			mov 1 rdi
			lent vtype rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-type rsi
			mq secth-type-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs aon
			nao r8
			mq r8 aon
			aqs secth-vsite
			aqs secth-vsite-site
			mq secth-type rsi
			mq secth-type-site r8
			add r8 rsi
			nao r9
			s seek-secth-vsite-init-init
				movs 0 rsi r9
				add 1 rsi
				cmp 20 r9
				st jne seek-secth-vsite-init-com
				st jmp seek-secth-vsite-init-init
			s seek-secth-vsite-init-com
			s seek-secth-vsite-init-init-0
				movs 0 rsi r9
				cmp 20 r9
				st je secth-vsite-is-nao-init
				cmp 30 r9
				st jne seek-secth-vsite-init-com-0
				add 1 rsi
				st jmp seek-secth-vsite-init-init-0
			s seek-secth-vsite-init-com-0
			st jmp secth-vsite-is-nao-com
			s secth-vsite-is-nao-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi secth-vsite
				mov 1 r8
				mq r8 secth-vsite-site
				st jmp set-secth-vsite-com
			s secth-vsite-is-nao-com
			mq rsi secth-vsite
			mov rsi rdi
			s seek-secth-vsite-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-vsite-com-com
				add 1 rsi
				st jmp seek-secth-vsite-com-init
			s seek-secth-vsite-com-com
			sub rdi rsi
			mq rsi secth-vsite-site
			s set-secth-vsite-com

			mov 1 rdi
			lent vvsite rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-vsite rsi
			mq secth-vsite-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-site
			aqs secth-site-site
			mq secth-vsite rsi
			mq secth-vsite-site r8
			add r8 rsi
			mq aon r10
			cmp 0 r10
			st je set-for-secth-aon-com
				mq aon rsi
			s set-for-secth-aon-com
			nao r9
			s seek-secth-site-init-init
				movs 0 rsi r9
				add 1 rsi
				cmp 20 r9
				st jne seek-secth-site-init-com
				st jmp seek-secth-site-init-init
			s seek-secth-site-init-com
			s seek-secth-site-init-init-0
				movs 0 rsi r9
				cmp 20 r9
				st je secth-site-is-nao-init
				cmp 30 r9
				st jne seek-secth-site-init-com-0
				add 1 rsi
				st jmp seek-secth-site-init-init-0
			s seek-secth-site-init-com-0
			st jmp secth-site-is-nao-com
			s secth-site-is-nao-init
				lent b16-nao rsi
				mq rsi secth-site
				mov 1 r8
				mq r8 secth-site-site
				st jmp set-secth-site-com
			s secth-site-is-nao-com
			mq rsi secth-site
			mov rsi rdi
			s seek-secth-site-com-init
				movs 0 rsi r9
				cmp a r9
				st je seek-secth-site-com-com
				add 1 rsi
				st jmp seek-secth-site-com-init
			s seek-secth-site-com-com
			sub rdi rsi
			mq rsi secth-site-site
			s set-secth-site-com

			mov 1 rdi
			lent vsite rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-site rsi
			mq secth-site-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq secth-type rdi
			mq secth-type-site rdx
			lent at-dynsym rsi
			mov 6 rcx
			mq equations r11
			addc equations compair-spaces r11
			dct r11
			cmp 1 rax
			st jne set-dynsym-site-com
				mq secth-site rsi
				mq secth-site-site rcx
				mov 10 rbx
				mq equations r12
				addc equations entree-to-number r12
				dct r12
				mq rax dynsym-site

				lent rdynsym-site rsi
				mq dynsym-site rdi
				mov 10 rbx
				mq equations rdx
				mq views r11
				addc views view-number r11
				dct r11
			s set-dynsym-site-com

			mq secth-name rdi
			mq secth-name-site rdx
			lent at-dynstr rsi
			mov 7 rcx
			mq equations r11
			addc equations compair-spaces r11
			dct r11
			cmp 1 rax
			st jne set-dynstr-site-com
				mq secth-site rsi
				mq secth-site-site rcx
				mov 10 rbx
				mq equations r12
				addc equations entree-to-number r12
				dct r12
				mq rax dynstr-site

				lent rdynstr-site rsi
				mq dynstr-site rdi
				mov 10 rbx
				mq equations rdx
				mq views r11
				addc views view-number r11
				dct r11
			s set-dynstr-site-com
		s mode-3-mode-0-com
		st jmp mode-3-mode-1-com
		s mode-3-mode-1-init
			nao r8
			mq r8 aon
			aqs secth-naof-secs
			aqs secth-naof-secs-site
			lq cs rsi
			nao r9
			s seek-secth-naof-secs-init-init
				movs 0 rsi r9
				add 1 rsi
				cmp 20 r9
				st jne seek-secth-naof-secs-init-com
				st jmp seek-secth-naof-secs-init-init
			s seek-secth-naof-secs-init-com
			s seek-secth-naof-secs-init-init-0
				movs 0 rsi r9
				cmp 20 r9
				st je secth-naof-secs-is-nao-init
				cmp 30 r9
				st jne seek-secth-naof-secs-init-com-0
				add 1 rsi
				st jmp seek-secth-naof-secs-init-init-0
			s seek-secth-naof-secs-init-com-0
			st jmp secth-naof-secs-is-nao-com
			s secth-naof-secs-is-nao-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi secth-naof-secs
				mov 1 r8
				mq r8 secth-naof-secs-site
				st jmp set-secth-naof-secs-com
			s secth-naof-secs-is-nao-com
			mq rsi secth-naof-secs
			mov rsi rdi
			s seek-secth-naof-secs-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-naof-secs-com-com
				add 1 rsi
				st jmp seek-secth-naof-secs-com-init
			s seek-secth-naof-secs-com-com
			sub rdi rsi
			mq rsi secth-naof-secs-site
			s set-secth-naof-secs-com

			mov 1 rdi
			lent vnaof-secs rsi
			mov c rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-naof-secs rsi
			mq secth-naof-secs-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-naof-rsecs
			aqs secth-naof-rsecs-site
			mq secth-naof-secs rsi
			mq secth-naof-secs-site r8
			add r8 rsi
			mq aon r10
			cmp 0 r10
			st je set-for-secth-aon-com-0
				mq aon rsi
			s set-for-secth-aon-com-0
			nao r9
			mq r9 aon
			s seek-secth-naof-rsecs-init-init
				movs 0 rsi r9
				add 1 rsi
				cmp 20 r9
				st jne seek-secth-naof-rsecs-init-com
				st jmp seek-secth-naof-rsecs-init-init
			s seek-secth-naof-rsecs-init-com
			s seek-secth-naof-rsecs-init-init-0
				movs 0 rsi r9
				cmp 20 r9
				st je secth-naof-rsecs-is-nao-init
				cmp 30 r9
				st jne seek-secth-naof-rsecs-init-com-0
				add 1 rsi
				st jmp seek-secth-naof-rsecs-init-init-0
			s seek-secth-naof-rsecs-init-com-0
			st jmp secth-naof-rsecs-is-nao-com
			s secth-naof-rsecs-is-nao-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi secth-naof-rsecs
				mov 1 r8
				mq r8 secth-naof-rsecs-site
				st jmp set-secth-naof-rsecs-com
			s secth-naof-rsecs-is-nao-com
			mq rsi secth-naof-rsecs
			mov rsi rdi
			s seek-secth-naof-rsecs-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-naof-rsecs-com-com
				add 1 rsi
				st jmp seek-secth-naof-rsecs-com-init
			s seek-secth-naof-rsecs-com-com
			sub rdi rsi
			mq rsi secth-naof-rsecs-site
			s set-secth-naof-rsecs-com

			mov 1 rdi
			lent vnaof-rsecs rsi
			mov d rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-naof-rsecs rsi
			mq secth-naof-rsecs-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-flags
			aqs secth-flags-site
			mq secth-naof-rsecs rsi
			mq secth-naof-rsecs-site r8
			add r8 rsi
			mq aon r10
			cmp 0 r10
			st je set-for-secth-aon-com-1
				mq aon rsi
			s set-for-secth-aon-com-1
			mq rsi aon
			nao r9
			s seek-secth-flags-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-secth-flags-init-com
				add 1 rsi
				st jmp seek-secth-flags-init-init
			s seek-secth-flags-init-com
			movs 0 rsi r9
			cmp 30 r9
			st jb non-secth-flags-com
			cmp 39 r9
			st ja non-secth-flags-com
				st jmp secth-flags-com
			s non-secth-flags-com
			mq rsi secth-flags
			mov rsi rdi
			s seek-secth-flags-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-flags-com-com
				add 1 rsi
				st jmp seek-secth-flags-com-init
			s seek-secth-flags-com-com
			mq rsi aon
			sub rdi rsi
			mq rsi secth-flags-site

			aqs secth-has-flags
			mov 1 r8
			mq r8 secth-has-flags
			mov 1 rdi
			lent vflags rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-flags rsi
			mq secth-flags-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
			st jmp secth-flags-com-com
			s secth-flags-com
				nao r8
				mq r8 secth-has-flags
			s secth-flags-com-com

			aqs secth-link
			aqs secth-link-site
			mq aon rsi
			nao r9
			s seek-secth-link-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-secth-link-init-com
				add 1 rsi
				st jmp seek-secth-link-init-init
			s seek-secth-link-init-com
			mq rsi secth-link
			mov rsi rdi
			s seek-secth-link-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-link-com-com
				add 1 rsi
				st jmp seek-secth-link-com-init
			s seek-secth-link-com-com
			sub rdi rsi
			mq rsi secth-link-site

			mov 1 rdi
			lent vlink rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-link rsi
			mq secth-link-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-info
			aqs secth-info-site
			mq secth-link rsi
			mq secth-link-site r8
			add r8 rsi
			nao r9
			s seek-secth-info-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-secth-info-init-com
				add 1 rsi
				st jmp seek-secth-info-init-init
			s seek-secth-info-init-com
			mq rsi secth-info
			mov rsi rdi
			s seek-secth-info-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-secth-info-com-com
				add 1 rsi
				st jmp seek-secth-info-com-init
			s seek-secth-info-com-com
			sub rdi rsi
			mq rsi secth-info-site

			mov 1 rdi
			lent vinfo rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-info rsi
			mq secth-info-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs secth-align
			aqs secth-align-site
			mq secth-info rsi
			mq secth-info-site r8
			add r8 rsi
			nao r9
			s seek-secth-align-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-secth-align-init-com
				add 1 rsi
				st jmp seek-secth-align-init-init
			s seek-secth-align-init-com
			mq rsi secth-align
			mov rsi rdi
			s seek-secth-align-com-init
				movs 0 rsi r9
				cmp a r9
				st je seek-secth-align-com-com
				add 1 rsi
				st jmp seek-secth-align-com-init
			s seek-secth-align-com-com
			sub rdi rsi
			mq rsi secth-align-site

			mov 1 rdi
			lent valign rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq secth-align rsi
			mq secth-align-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs bin-seek-site
			mq mode-site rax
			divq comn-mod-fact
			factq naof-sh-secs rax
			mq sh-bin-site r8
			add r8 rax
			mq rax bin-seek-site
			mq sh-bin-site r8
			# lseek
			mq binf rdi
			mq bin-seek-site rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 40 rdx
			lq cs0 rsi
			mov 0 rax
			sys
			cmp 0 rax
			st je elf-initials-com
			mq rax cs0-site
			lq cs0 rsi
			mov 0 rsi r9
			mov ffffffff r10
			and r10 r9
			mq r9 str-site

			lent rstr-site rsi
			mq str-site rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			lent rcs0 rsi
			lq cs0 rdi
			mq cs0-site rcx
			mov 10 rbx
			nao r10
			mq equations rdx
			mq views r11
			addc views view-space r11
			dct r11

			# lseek
			mq binf rdi
			mq sn-bin-site rsi
			mq str-site r8
			add r8 rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 200 rdx
			lq cs1 rsi
			mov 0 rax
			sys
			mq rax cs1-site

			aqs sh-full-name
			aqs sh-full-name-site
			lq cs1 rsi
			mq rsi sh-full-name
			mov rsi rdi
			nao r9
			s seek-full-sh-name-com-init
				movs 0 rsi r9
				cmp 0 r9
				st je seek-full-sh-name-com-com
				add 1 rsi
				st jmp seek-full-sh-name-com-init
			s seek-full-sh-name-com-com
			sub rdi rsi
			mq rsi sh-full-name-site

			mov 1 rdi
			lent vsh-full-name rsi
			mov f rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq sh-full-name rsi
			mq sh-full-name-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq elfc rdi
			lent krtype rcx
			mov 5 r10
			lent ksh rsi
			mov 2 r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kname rcx
			mov 4 r10
			mq sh-full-name rsi
			mq sh-full-name-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent krs rcx
			mov 2 r10
			mq secth-rs rsi
			mq secth-rs-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent ktype rcx
			mov 4 r10
			mq secth-type rsi
			mq secth-type-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kvsite rcx
			mov 5 r10
			mq secth-vsite rsi
			mq secth-vsite-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent ksite rcx
			mov 4 r10
			mq secth-site rsi
			mq secth-site-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent knaof-secs rcx
			mov 9 r10
			mq secth-naof-secs rsi
			mq secth-naof-secs-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent knaof-rsecs rcx
			mov a r10
			mq secth-naof-rsecs rsi
			mq secth-naof-rsecs-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq secth-has-flags r8
			cmp 0 r8
			st je secth-add-flags-to-chart-com
			mq elfc rdi
			lent kflags rcx
			mov 5 r10
			mq secth-flags rsi
			mq secth-flags-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc
			s secth-add-flags-to-chart-com

			mq elfc rdi
			lent klink rcx
			mov 4 r10
			mq secth-link rsi
			mq secth-link-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kinfo rcx
			mov 4 r10
			mq secth-info rsi
			mq secth-info-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kalign rcx
			mov 5 r10
			mq secth-align rsi
			mq secth-align-site r11
			mov 1 r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			mq elffn rsi
			mq cf r11
			addc cf ac r11
			dct r11
			mq elfc rdi
			nao r9
			mov r9 0 rdi

		s mode-3-mode-1-com
	s each-section-mode-3-com

	mq mode r8
	cmp 6 r8
	st jne each-section-mode-6-com

	s each-section-mode-6-init
		lent rmode-site rsi
		mq mode-site rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq mode-site rax
		nao rdx
		divq comn-mod-fact
		cmp 1 rdx
		st je mode-6-mode-1-init

		s mode-6-mode-0-init
			lq cs rsi
			lq cs2 rdi
			mq sect-site rcx
			add 1 rcx
			mq equations r11
			addc equations com r11
			dct r11

			aqs phdr-type
			aqs phdr-type-site
			lq cs2 rsi
			add 2 rsi
			mq rsi phdr-type
			mov rsi rdi
			nao r9
			s seek-phdr-type-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-phdr-type-com-com
				add 1 rsi
				st jmp seek-phdr-type-com-init
			s seek-phdr-type-com-com
			sub rdi rsi
			mq rsi phdr-type-site

			mov 1 rdi
			lent vtype rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-type rsi
			mq phdr-type-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			nao r8
			mq r8 aon
			aqs phdr-fsite
			aqs phdr-fsite-site
			mq phdr-type rsi
			mq phdr-type-site r8
			add r8 rsi
			nao r9
			s seek-phdr-fsite-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-phdr-fsite-init-com
				add 1 rsi
				st jmp seek-phdr-fsite-init-init
			s seek-phdr-fsite-init-com
			s seek-phdr-fsite-init-init-0
				movs 0 rsi r9
				cmp 30 r9
				st je cont-seek-phdr-fsite-init-init-0
				cmp 78 r9
				st je cont-seek-phdr-fsite-init-init-0
				cmp 20 r9
				st je seek-phdr-fsite-aon-init
				st jmp seek-phdr-fsite-init-com-0
				s cont-seek-phdr-fsite-init-init-0
				add 1 rsi
				st jmp seek-phdr-fsite-init-init-0
			s seek-phdr-fsite-init-com-0
			mq rsi phdr-fsite
			mov rsi rdi
			s seek-phdr-fsite-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-phdr-fsite-com-com
				add 1 rsi
				st jmp seek-phdr-fsite-com-init
			s seek-phdr-fsite-com-com
			st jmp seek-phdr-fsite-aon-com
			s seek-phdr-fsite-aon-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi phdr-fsite
				mov 1 r8
				mq r8 phdr-fsite-site
				st jmp seek-phdr-fsite-com
			s seek-phdr-fsite-aon-com
			sub rdi rsi
			mq rsi phdr-fsite-site
			s seek-phdr-fsite-com

			mov 1 rdi
			lent vfsite rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-fsite rsi
			mq phdr-fsite-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs phdr-vsite
			aqs phdr-vsite-site
			mq phdr-fsite rsi
			mq phdr-fsite-site r8
			add r8 rsi
			mq aon r8
			cmp 0 r8
			st je phdr-vsite-aon-com
				mq aon rsi
			s phdr-vsite-aon-com
			nao r8
			mq r8 aon
			nao r9
			s seek-phdr-vsite-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-phdr-vsite-init-com
				add 1 rsi
				st jmp seek-phdr-vsite-init-init
			s seek-phdr-vsite-init-com
			s seek-phdr-vsite-init-init-0
				movs 0 rsi r9
				cmp 30 r9
				st je cont-seek-phdr-vsite-init-init-0
				cmp 78 r9
				st je cont-seek-phdr-vsite-init-init-0
				cmp 20 r9
				st je seek-phdr-vsite-aon-init
				st jmp seek-phdr-vsite-init-com-0
				s cont-seek-phdr-vsite-init-init-0
				add 1 rsi
				st jmp seek-phdr-vsite-init-init-0
			s seek-phdr-vsite-init-com-0
			mq rsi phdr-vsite
			mov rsi rdi
			s seek-phdr-vsite-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-phdr-vsite-com-com
				add 1 rsi
				st jmp seek-phdr-vsite-com-init
			s seek-phdr-vsite-com-com
			st jmp seek-phdr-vsite-aon-com
			s seek-phdr-vsite-aon-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi phdr-vsite
				mov 1 r8
				mq r8 phdr-vsite-site
				st jmp seek-phdr-vsite-com
			s seek-phdr-vsite-aon-com
			sub rdi rsi
			mq rsi phdr-vsite-site
			s seek-phdr-vsite-com

			mov 1 rdi
			lent vvsite rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-vsite rsi
			mq phdr-vsite-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
		s mode-6-mode-0-com
		st jmp mode-6-mode-1-com
		s mode-6-mode-1-init
			nao r8
			mq r8 aon
			aqs phdr-naof-fsecs
			aqs phdr-naof-fsecs-site
			lq cs rsi
			add 11 rsi
			nao r9
			s seek-phdr-naof-fsecs-init-init
				movs 0 rsi r9
				cmp 30 r9
				st je cont-seek-phdr-naof-fsecs-init-init
				cmp 78 r9
				st je cont-seek-phdr-naof-fsecs-init-init
				cmp 20 r9
				st je seek-phdr-naof-fsecs-aon-init
				st jmp seek-phdr-naof-fsecs-init-com
				s cont-seek-phdr-naof-fsecs-init-init
				add 1 rsi
				st jmp seek-phdr-naof-fsecs-init-init
			s seek-phdr-naof-fsecs-init-com
			mq rsi phdr-naof-fsecs
			mov rsi rdi
			s seek-phdr-naof-fsecs-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-phdr-naof-fsecs-com-com
				add 1 rsi
				st jmp seek-phdr-naof-fsecs-com-init
			s seek-phdr-naof-fsecs-com-com
			st jmp seek-phdr-naof-fsecs-aon-com
			s seek-phdr-naof-fsecs-aon-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi phdr-naof-fsecs
				mov 1 r8
				mq r8 phdr-naof-fsecs-site
				st jmp seek-phdr-naof-fsecs-com
			s seek-phdr-naof-fsecs-aon-com
			sub rdi rsi
			mq rsi phdr-naof-fsecs-site
			s seek-phdr-naof-fsecs-com

			mov 1 rdi
			lent vnaof-fsecs rsi
			mov d rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-naof-fsecs rsi
			mq phdr-naof-fsecs-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs phdr-naof-vsecs
			aqs phdr-naof-vsecs-site
			mq phdr-naof-fsecs rsi
			mq phdr-naof-fsecs-site r8
			add r8 rsi
			mq aon r8
			cmp 0 r8
			st je init-aon-for-phdr-naof-vsecs-com
				mq aon rsi
			s init-aon-for-phdr-naof-vsecs-com
			nao r8
			mq r8 aon
			nao r9
			s seek-phdr-naof-vsecs-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-phdr-naof-vsecs-init-com
				add 1 rsi
				st jmp seek-phdr-naof-vsecs-init-init
			s seek-phdr-naof-vsecs-init-com
			s seek-phdr-naof-vsecs-init-init
				movs 0 rsi r9
				cmp 30 r9
				st je cont-seek-phdr-naof-vsecs-init-init
				cmp 78 r9
				st je cont-seek-phdr-naof-vsecs-init-init
				cmp 20 r9
				st je seek-phdr-naof-vsecs-aon-init
				st jmp seek-phdr-naof-vsecs-init-com
				s cont-seek-phdr-naof-vsecs-init-init
				add 1 rsi
				st jmp seek-phdr-naof-vsecs-init-init
			s seek-phdr-naof-vsecs-init-com
			mq rsi phdr-naof-vsecs
			mov rsi rdi
			s seek-phdr-naof-vsecs-com-init
				movs 0 rsi r9
				cmp 20 r9
				st je seek-phdr-naof-vsecs-com-com
				add 1 rsi
				st jmp seek-phdr-naof-vsecs-com-init
			s seek-phdr-naof-vsecs-com-com
			st jmp seek-phdr-naof-vsecs-aon-com
			s seek-phdr-naof-vsecs-aon-init
				mq rsi aon
				lent b16-nao rsi
				mq rsi phdr-naof-vsecs
				mov 1 r8
				mq r8 phdr-naof-vsecs-site
				st jmp seek-phdr-naof-vsecs-com
			s seek-phdr-naof-vsecs-aon-com
			sub rdi rsi
			mq rsi phdr-naof-vsecs-site
			s seek-phdr-naof-vsecs-com

			mov 1 rdi
			lent vnaof-vsecs rsi
			mov d rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-naof-vsecs rsi
			mq phdr-naof-vsecs-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs phdr-flags
			aqs phdr-flags-site
			mq phdr-naof-vsecs rsi
			mq phdr-naof-vsecs-site r8
			add r8 rsi
			mq aon r8
			cmp 0 r8
			st je init-aon-for-phdr-flags-com
				mq aon rsi
			s init-aon-for-phdr-flags-com
			nao r9
			s seek-phdr-flags-init-init
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-phdr-flags-init-com
				add 1 rsi
				st jmp seek-phdr-flags-init-init
			s seek-phdr-flags-init-com
			mq rsi phdr-flags
			mov rsi rdi
			s seek-phdr-flags-com-init
				movs 0 rsi r9
				cmp 30 r9
				st je seek-phdr-flags-com-com
				add 1 rsi
				st jmp seek-phdr-flags-com-init
			s seek-phdr-flags-com-com
			sub 1 rsi
			s seek-phdr-flags-com-init-0
				movs 0 rsi r9
				cmp 20 r9
				st jne seek-phdr-flags-com-com-0
				sub 1 rsi
				st jmp seek-phdr-flags-com-init-0
			s seek-phdr-flags-com-com-0
			add 1 rsi
			sub rdi rsi
			mq rsi phdr-flags-site

			mov 1 rdi
			lent vflags rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-flags rsi
			mq phdr-flags-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			aqs phdr-align
			aqs phdr-align-site
			mq phdr-flags rsi
			mq phdr-flags-site r8
			add r8 rsi
			nao r9
			s seek-phdr-align-init-init
				movs 0 rsi r9
				cmp 30 r9
				st je seek-phdr-align-init-com
				add 1 rsi
				st jmp seek-phdr-align-init-init
			s seek-phdr-align-init-com
			add 2 rsi
			mq rsi phdr-align
			mov rsi rdi
			s seek-phdr-align-com-init
				movs 0 rsi r9
				cmp a r9
				st je seek-phdr-align-com-com
				add 1 rsi
				st jmp seek-phdr-align-com-init
			s seek-phdr-align-com-com
			sub rdi rsi
			mq rsi phdr-align-site

			mov 1 rdi
			lent valign rsi
			mov 8 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq phdr-align rsi
			mq phdr-align-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq elfc rdi
			lent krtype rcx
			mov 5 r10
			lent kph rsi
			mov 2 r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent ktype rcx
			mov 4 r10
			mq phdr-type rsi
			mq phdr-type-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kfsite rcx
			mov 5 r10
			mq phdr-type rsi
			mq phdr-type-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kfsite rcx
			mov 5 r10
			mq phdr-vsite rsi
			mq phdr-vsite-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent knaof-fsecs rcx
			mov a r10
			mq phdr-naof-fsecs rsi
			mq phdr-naof-fsecs-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			ent knaof-vsecs naof-vsecs
			mq elfc rdi
			lent knaof-vsecs rcx
			mov a r10
			mq phdr-naof-vsecs rsi
			mq phdr-naof-vsecs-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kflags rcx
			mov 5 r10
			mq phdr-flags rsi
			mq phdr-flags-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			lent kalign rcx
			mov 5 r10
			mq phdr-align rsi
			mq phdr-align-site r11
			mov 1 r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc

			mq elfc rdi
			mq elffn rsi
			mq cf r11
			addc cf ac r11
			dct r11
			mq elfc rdi
			nao r9
			mov r9 0 rdi
		s mode-6-mode-1-com
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
	s each-section-mode-6-com

	mq mode r8
	cmp 8 r8
	st jne each-section-mode-8-com

	aqs omode-site
	s each-section-mode-8-init
		mq mode-site r8
		mq r8 omode-site
		mov r8 r9
		add 1 r8
		mq r8 mode-site
		cmp 0 r9
		st je each-section-mode-8-com
		aqs dyn-code
		aqs dyn-code-site
		lq cs rsi
		add 3 rsi
		nao r8
		s seek-dyn-code-init-init
			movs 0 rsi r9
			cmp 20 r9
			st je each-section-mode-8-com
			cmp 30 r9
			st jne seek-dyn-code-init-com
			add 1 rsi
			st jmp seek-dyn-code-init-init
		s seek-dyn-code-init-com
		mq rsi dyn-code
		mov rsi rdi
		s seek-dyn-code-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dyn-code-com-com
			add 1 rsi
			st jmp seek-dyn-code-com-init
		s seek-dyn-code-com-com
		sub rdi rsi
		mq rsi dyn-code-site

		mov 1 rdi
		lent vdyn-code rsi
		mov b rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dyn-code rsi
		mq dyn-code-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dyn-type
		aqs dyn-type-site
		mq dyn-code rsi
		mq dyn-code-site r10
		add r10 rsi
		add 2 rsi
		mq rsi dyn-type
		mov rsi rdi
		s seek-dyn-type-com-init
			movs 0 rsi r9
			cmp 29 r9
			st je seek-dyn-type-com-com
			add 1 rsi
			st jmp seek-dyn-type-com-init
		s seek-dyn-type-com-com
		sub rdi rsi
		mq rsi dyn-type-site

		mov 1 rdi
		lent vdyn-type rsi
		mov b rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dyn-type rsi
		mq dyn-type-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		nao r10
		lq cs rsi
		mq sect-site r8
		mov rsi rdi
		add r8 rdi
		nao r9
		s seek-for-if-bracin-init
			movs 0 rsi r9
			cmp 5b r9
			st je set-to-bracin-seekers-init
			add 1 rsi
			cmp rsi rdi
			st je set-to-bracin-seekers-com
			st jmp seek-for-if-bracin-init
		s seek-for-if-bracin-com
		s set-to-bracin-seekers-init
			mov 1 r10
		s set-to-bracin-seekers-com

		aqs dyn-name
		aqs dyn-name-site
		mq dyn-type rsi
		mq dyn-type-site r8
		add r8 rsi
		add 1 rsi
		nao r9
		cmp 1 r10
		st je seek-dyn-name-init-init-0

		s seek-dyn-name-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dyn-name-init-com
			add 1 rsi
			st jmp seek-dyn-name-init-init
		s seek-dyn-name-init-com
		mq rsi dyn-name
		mov rsi rdi
		s seek-dyn-name-com-init
			movs 0 rsi r9
			cmp a r9
			st je seek-dyn-name-com-com
			add 1 rsi
			st jmp seek-dyn-name-com-init
		s seek-dyn-name-com-com
		sub rdi rsi
		mq rsi dyn-name-site
		st jmp seek-dyn-name-com-com-com-0

		s seek-dyn-name-init-init-0
			movs 0 rsi r9
			cmp 5b r9
			st je seek-dyn-name-init-com-0
			add 1 rsi
			st jmp seek-dyn-name-init-init-0
		s seek-dyn-name-init-com-0
		add 1 rsi
		mq rsi dyn-name
		mov rsi rdi
		s seek-dyn-name-com-init-0
			movs 0 rsi r9
			cmp 5d r9
			st je seek-dyn-name-com-com-0
			add 1 rsi
			st jmp seek-dyn-name-com-init-0
		s seek-dyn-name-com-com-0
		sub rdi rsi
		mq rsi dyn-name-site
		s seek-dyn-name-com-com-com-0

		mov 1 rdi
		lent vdyn-name rsi
		mov b rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dyn-name rsi
		mq dyn-name-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq elfc rdi
		lent krtype rcx
		mov 5 r10
		lent kdynamic rsi
		mov 7 r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kname rcx
		mov 4 r10
		mq dyn-name rsi
		mq dyn-name-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kcode rcx
		mov 4 r10
		mq dyn-code rsi
		mq dyn-code-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent ktype rcx
		mov 4 r10
		mq dyn-type rsi
		mq dyn-type-site r11
		nao r12
		mov 1 r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		mq elffn rsi
		mq cf r11
		addc cf ac r11
		dct r11
		mq elfc rdi
		nao r9
		mov r9 0 rdi
	s each-section-mode-8-com

	mq mode r8
	cmp a r8
	st jne each-section-mode-a-com
	s each-section-mode-a-init
		mq mode-site r8
		mov r8 r9
		add 1 r9
		mq r9 mode-site
		cmp 1 r8
		st jb each-section-mode-a-com

		aqs rela-dyn-vsite
		aqs rela-dyn-vsite-site
		lq cs rsi
		nao r9
		s seek-rela-dyn-vsite-init-init
			movs 0 rsi r9
			cmp 30 r9
			st jne seek-rela-dyn-vsite-init-com
			add 1 rsi
			st jmp seek-rela-dyn-vsite-init-init
		s seek-rela-dyn-vsite-init-com
		mq rsi rela-dyn-vsite
		mov rsi rdi
		s seek-rela-dyn-vsite-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-dyn-vsite-com-com
			add 1 rsi
			st jmp seek-rela-dyn-vsite-com-init
		s seek-rela-dyn-vsite-com-com
		sub rdi rsi
		mq rsi rela-dyn-vsite-site

		mov 1 rdi
		lent vvsite rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-dyn-vsite rsi
		mq rela-dyn-vsite-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rela-dyn-flags
		aqs rela-dyn-flags-site
		mq rela-dyn-vsite rsi
		mq rela-dyn-vsite-site r8
		add r8 rsi
		add 2 rsi
		nao r9
		mq rsi rela-dyn-flags
		mov rsi rdi
		s seek-rela-dyn-flags-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-dyn-flags-com-com
			add 1 rsi
			st jmp seek-rela-dyn-flags-com-init
		s seek-rela-dyn-flags-com-com
		sub rdi rsi
		mq rsi rela-dyn-flags-site

		mov 1 rdi
		lent vflags rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-dyn-flags rsi
		mq rela-dyn-flags-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rela-dyn-type
		aqs rela-dyn-type-site
		mq rela-dyn-flags rsi
		mq rela-dyn-flags-site r8
		add r8 rsi
		add 1 rsi
		mq rsi rela-dyn-type
		nao r9
		mov rsi rdi
		s seek-rela-dyn-type-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-dyn-type-com-com
			add 1 rsi
			st jmp seek-rela-dyn-type-com-init
		s seek-rela-dyn-type-com-com
		sub rdi rsi
		mq rsi rela-dyn-type-site

		mov 1 rdi
		lent vtype rsi
		mov 7 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-dyn-type rsi
		mq rela-dyn-type-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mov 1 rdi
		lent vflags rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-dyn-flags rsi
		mq rela-dyn-flags-site r8
		add r8 rsi
		sub 1 rsi
		mov 1 rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rdyn-alias
		aqs rdyn-alias-site
		nao r8
		mq r8 rdyn-alias-site
		aqs dyn-sym-link
		mq rela-dyn-flags rsi
		mq rela-dyn-flags-site r8
		add r8 rsi
		sub 1 rsi
		nao r9
		movs 0 rsi r9
		cmp 36 r9
		st je named-dyn-init
		cmp 31 r9
		st je named-dyn-init
		st jmp anon-dyn-init
		s named-dyn-init
			mq rela-dyn-flags rsi
			mov 4 rcx
			mov 10 rbx
			mq equations r12
			addc equations entree-to-number r12
			dct r12
			mq rax dyn-sym-link

			lent rdyn-sym-link rsi
			mq dyn-sym-link rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mq dyn-sym-link r11
			factq naof-dsr-secs r11
			# lseek
			mq binf rdi
			mq dynsym-site rsi
			add r11 rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 18 rdx
			lq cs0 rsi
			mov 0 rax
			sys
			mq rax cs0-site

			lent rcs0 rsi
			lq cs0 rdi
			mq cs0-site rcx
			mov a rbx
			nao r10
			mq equations rdx
			mq views r11
			addc views view-space r11
			dct r11

			mq cs0 r8
			mov ffffffff r9
			and r9 r8
			mq r8 rela-rname-esite

			# lseek
			mq binf rdi
			mq dynstr-site rsi
			mq rela-rname-esite r8
			add r8 rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 200 rdx
			lq cs1 rsi
			mov 0 rax
			sys
			mq rax cs1-site
			lq cs1 rsi
			mq rsi rela-rname
			mov rsi rdi
			nao r9
			s seek-rela-rname-com-init
				movs 0 rsi r9
				cmp 0 r9
				st je seek-rela-rname-com-com
				add 1 rsi
				st jmp seek-rela-rname-com-init
			s seek-rela-rname-com-com
			sub rdi rsi
			mq rsi rela-rname-site

			ent rrela-rname-site rela-rname-site
			lent rrela-rname-site rsi
			mq rela-rname-site rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mov 1 rdi
			lent vname rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq rela-rname rsi
			mq rela-rname-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			st jmp anon-dyn-com
		s named-dyn-com
		s anon-dyn-init
			mq rela-dyn-type rsi
			mq rela-dyn-type-site r8
			add r8 rsi
			nao r9
			s seek-rdyn-alias-init-init
				nao r10
				movs 0 rsi r9
				cmp 20 r9
				st jne set-for-20-seek-rdyn-alias-init-init-com
					add 1 r10
				s set-for-20-seek-rdyn-alias-init-init-com
				cmp 30 r9
				st jne set-for-30-seek-rdyn-alias-init-init-com
					add 1 r10
				s set-for-30-seek-rdyn-alias-init-init-com

				cmp 0 r10
				st je seek-rdyn-alias-init-com

				s cont-seek-rdyn-alias-init-init
				add 1 rsi
				st jmp seek-rdyn-alias-init-init
			s seek-rdyn-alias-init-com
			mq rsi rdyn-alias
			mov rsi rdi
			s seek-rdyn-alias-com-init
				movs 0 rsi r9
				cmp a r9
				st je seek-rdyn-alias-com-com
				add 1 rsi
				st jmp seek-rdyn-alias-com-init
			s seek-rdyn-alias-com-com
			sub rdi rsi
			mq rsi rdyn-alias-site

			mov 1 rdi
			lent vname rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq rdyn-alias rsi
			mq rdyn-alias-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
		s anon-dyn-com

		mq elfc rdi
		lent krtype rcx
		mov 5 r10
		lent krela-dyn rsi
		mov 8 r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		ent rrdyn-alias-site rdyn-alias-site
		mq rdyn-alias-site r8
		cmp 0 r8
		st jne rdyn-write-alias-name-to-chart-init
		s rdyn-write-name-to-chart-init

			lent rrela-rname rsi
			mq rela-rname rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mq elfc rdi
			lent kname rcx
			mov 4 r10
			mq rela-rname rsi
			mq rela-rname-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc
			st jmp rdyn-write-alias-name-to-chart-com
		s rdyn-write-name-to-chart-com
		s rdyn-write-alias-name-to-chart-init

			lent rrdyn-alias-site rsi
			mq rdyn-alias-site rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mq elfc rdi
			lent kname rcx
			mov 4 r10
			mq rdyn-alias rsi
			mq rdyn-alias-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc
		s rdyn-write-alias-name-to-chart-com

		mq elfc rdi
		lent ktype rcx
		mov 4 r10
		mq rela-dyn-type rsi
		mq rela-dyn-type-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kvsite rcx
		mov 5 r10
		mq rela-dyn-vsite rsi
		mq rela-dyn-vsite-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kflags rcx
		mov 5 r10
		mq rela-dyn-flags rsi
		mq rela-dyn-flags-site r11
		nao r12
		mov 1 r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		mq elffn rsi
		mq cf r11
		addc cf ac r11
		dct r11
		mq elfc rdi
		nao r9
		mov r9 0 rdi
	s each-section-mode-a-com

	mq mode r8
	cmp b r8
	st jne each-section-mode-b-com
	s each-section-mode-b-init
		mq mode-site r8
		mov r8 r9
		add 1 r9
		mq r9 mode-site
		cmp 1 r8
		st jb each-section-mode-b-com

		aqs rela-plt-vsite
		aqs rela-plt-vsite-site
		lq cs rsi
		nao r9
		s seek-rela-plt-vsite-init-init
			movs 0 rsi r9
			cmp 30 r9
			st jne seek-rela-plt-vsite-init-com
			add 1 rsi
			st jmp seek-rela-plt-vsite-init-init
		s seek-rela-plt-vsite-init-com
		mq rsi rela-plt-vsite
		mov rsi rdi
		s seek-rela-plt-vsite-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-plt-vsite-com-com
			add 1 rsi
			st jmp seek-rela-plt-vsite-com-init
		s seek-rela-plt-vsite-com-com
		sub rdi rsi
		mq rsi rela-plt-vsite-site

		mov 1 rdi
		lent vvsite rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-plt-vsite rsi
		mq rela-plt-vsite-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rela-plt-flags
		aqs rela-plt-flags-site
		mq rela-plt-vsite rsi
		mq rela-plt-vsite-site r8
		add r8 rsi
		add 2 rsi
		nao r9
		mq rsi rela-plt-flags
		mov rsi rdi
		s seek-rela-plt-flags-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-plt-flags-com-com
			add 1 rsi
			st jmp seek-rela-plt-flags-com-init
		s seek-rela-plt-flags-com-com
		sub rdi rsi
		mq rsi rela-plt-flags-site

		mov 1 rdi
		lent vflags rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-plt-flags rsi
		mq rela-plt-flags-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rela-plt-type
		aqs rela-plt-type-site
		mq rela-plt-flags rsi
		mq rela-plt-flags-site r8
		add r8 rsi
		add 1 rsi
		mq rsi rela-plt-type
		nao r9
		mov rsi rdi
		s seek-rela-plt-type-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-rela-plt-type-com-com
			add 1 rsi
			st jmp seek-rela-plt-type-com-init
		s seek-rela-plt-type-com-com
		sub rdi rsi
		mq rsi rela-plt-type-site

		mov 1 rdi
		lent vtype rsi
		mov 7 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-plt-type rsi
		mq rela-plt-type-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mov 1 rdi
		lent vflags rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq rela-plt-flags rsi
		mq rela-plt-flags-site r8
		add r8 rsi
		sub 1 rsi
		mov 1 rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs rplt-alias
		aqs rplt-alias-site
		nao r8
		mq r8 rplt-alias-site
		aqs plt-sym-link
		mq rela-plt-flags rsi
		mq rela-plt-flags-site r8
		add r8 rsi
		sub 1 rsi
		nao r9
		movs 0 rsi r9
		cmp 37 r9
		st je named-plt-init
		st jmp anon-plt-init
		s named-plt-init
			mq rela-plt-flags rsi
			mov 4 rcx
			mov 10 rbx
			mq equations r12
			addc equations entree-to-number r12
			dct r12
			mq rax plt-sym-link

			lent rdyn-sym-link rsi
			mq plt-sym-link rdi
			mov 10 rbx
			mq equations rdx
			mq views r11
			addc views view-number r11
			dct r11

			mq plt-sym-link r11
			factq naof-dsr-secs r11
			# lseek
			mq binf rdi
			mq dynsym-site rsi
			add r11 rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 18 rdx
			lq cs0 rsi
			mov 0 rax
			sys
			mq rax cs0-site

			lent rcs0 rsi
			lq cs0 rdi
			mq cs0-site rcx
			mov a rbx
			nao r10
			mq equations rdx
			mq views r11
			addc views view-space r11
			dct r11

			lq cs0 r8
			mov 0 r8 r8
			mov ffffffff r9
			and r9 r8
			mq r8 rela-rname-esite

			# lseek
			mq binf rdi
			mq dynstr-site rsi
			mq rela-rname-esite r8
			add r8 rsi
			nao rdx
			mov 8 rax
			sys

			aqs str-site
			# read
			mq binf rdi
			mov 200 rdx
			lq cs1 rsi
			mov 0 rax
			sys
			mq rax cs1-site
			lq cs1 rsi
			mq rsi rela-rname
			mov rsi rdi
			nao r9
			s seek-rela-rname-com-init-1
				movs 0 rsi r9
				cmp 0 r9
				st je seek-rela-rname-com-com-1
				add 1 rsi
				st jmp seek-rela-rname-com-init-1
			s seek-rela-rname-com-com-1
			sub rdi rsi
			mq rsi rela-rname-site

			mov 1 rdi
			lent vname rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq rela-rname rsi
			mq rela-rname-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			st jmp anon-plt-com
		s named-plt-com
		s anon-plt-init
			mq rela-plt-type rsi
			mq rela-plt-type-site r8
			add r8 rsi
			nao r9
			s seek-rplt-alias-init-init
				nao r10
				movs 0 rsi r9
				cmp 20 r9
				st jne set-for-20-seek-rplt-alias-init-init-com
					add 1 r10
				s set-for-20-seek-rplt-alias-init-init-com
				cmp 30 r9
				st jne set-for-30-seek-rplt-alias-init-init-com
					add 1 r10
				s set-for-30-seek-rplt-alias-init-init-com

				cmp 0 r10
				st je seek-rplt-alias-init-com

				s cont-seek-rplt-alias-init-init
				add 1 rsi
				st jmp seek-rplt-alias-init-init
			s seek-rplt-alias-init-com
			mq rsi rplt-alias
			mov rsi rdi
			s seek-rplt-alias-com-init
				movs 0 rsi r9
				cmp a r9
				st je seek-rplt-alias-com-com
				add 1 rsi
				st jmp seek-rplt-alias-com-init
			s seek-rplt-alias-com-com
			sub rdi rsi
			mq rsi rplt-alias-site

			mov 1 rdi
			lent vname rsi
			mov 7 rdx
			mov 1 rax
			sys
			mov 1 rdi
			mq rplt-alias rsi
			mq rplt-alias-site rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys
		s anon-plt-com

		mq elfc rdi
		lent krtype rcx
		mov 5 r10
		lent krela-plt rsi
		mov 8 r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq rplt-alias-site r8
		cmp 0 r8
		st jne write-rela-plt-aname-init
		s write-rela-plt-fname-init
			mq elfc rdi
			lent kname rcx
			mov 4 r10
			mq rela-rname rsi
			mq rela-rname-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc
		s write-rela-plt-fname-com
		st jmp write-rela-plt-aname-com
		s write-rela-plt-aname-init
			mq elfc rdi
			lent kname rcx
			mov 4 r10
			mq rplt-alias rsi
			mq rplt-alias-site r11
			nao r12
			lq cfcs rbx
			mq equations rdx
			mq cf r13
			mq cf r14
			addc cf atc r14
			dct r14
			mq rax elfc
		s write-rela-plt-aname-com

		mq elfc rdi
		lent kvsite rcx
		mov 5 r10
		mq rela-plt-vsite rsi
		mq rela-plt-vsite-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kflags rcx
		mov 5 r10
		mq rela-plt-flags rsi
		mq rela-plt-flags-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent ktype rcx
		mov 4 r10
		mq rela-plt-type rsi
		mq rela-plt-type-site r11
		nao r12
		mov 1 r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		mq elffn rsi
		mq cf r11
		addc cf ac r11
		dct r11
		mq elfc rdi
		nao r9
		mov r9 0 rdi
	s each-section-mode-b-com

	mq mode r8
	cmp c r8
	st jne each-section-mode-c-com
	s each-section-mode-c-init
		mq mode-site r8
		cmp 1 r8
		st jb each-section-mode-c-init-incr-mode-site-init

		nao r8
		mq r8 aon
		aqs dynsym-value
		aqs dynsym-value-site
		lq cs rsi
		nao r9
		s seek-dynsym-value-init-init
			movs 0 rsi r9
			cmp 3a r9
			st je seek-dynsym-value-init-com
			add 1 rsi
			st jmp seek-dynsym-value-init-init
		s seek-dynsym-value-init-com
		add 2 rsi
		s seek-dynsym-value-init-init-0
			movs 0 rsi r9
			cmp 30 r9
			st je seek-dynsym-value-init-init-0-cont
			cmp 20 r9
			st je seek-dynsym-value-init-com-0-aon-init
			st jmp seek-dynsym-value-init-com-0
			s seek-dynsym-value-init-init-0-cont
			add 1 rsi
			st jmp seek-dynsym-value-init-init-0
		s seek-dynsym-value-init-com-0
		st jmp seek-dynsym-value-init-com-0-aon-com
		s seek-dynsym-value-init-com-0-aon-init
			mq rsi aon
			lent b16-nao rsi
			mq rsi dynsym-value
			mov 1 r8
			mq r8 dynsym-value-site
			st jmp seek-dynsym-value-com-com-com
		s seek-dynsym-value-init-com-0-aon-com
		mq rsi dynsym-value
		mov rsi rdi
		s seek-dynsym-value-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-value-com-com
			add 1 rsi
			st jmp seek-dynsym-value-com-init
		s seek-dynsym-value-com-com
		sub rdi rsi
		mq rsi dynsym-value-site
		s seek-dynsym-value-com-com-com

		mov 1 rdi
		lent vvalue rsi
		mov 8 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-value rsi
		mq dynsym-value-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dynsym-naof-secs
		aqs dynsym-naof-secs-site
		mq aon rsi
		cmp 0 rsi
		st jne init-from-dynsym-value-com
			mq dynsym-value rsi
			mq dynsym-value-site r8
			add r8 rsi
		s init-from-dynsym-value-com
		nao r9
		s seek-dynsym-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dynsym-init-com
			add 1 rsi
			st jmp seek-dynsym-init-init
		s seek-dynsym-init-com
		mq rsi dynsym-naof-secs
		mov rsi rdi
		s seek-dynsym-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-com-com
			add 1 rsi
			st jmp seek-dynsym-com-init
		s seek-dynsym-com-com
		sub rdi rsi
		mq rsi dynsym-naof-secs-site

		mov 1 rdi
		lent vnaof-secs rsi
		mov c rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-naof-secs rsi
		mq dynsym-naof-secs-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dynsym-type
		aqs dynsym-type-site
		mq dynsym-naof-secs rsi
		mq dynsym-naof-secs-site r8
		add r8 rsi
		nao r9
		s seek-dynsym-type-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dynsym-type-init-com
			add 1 rsi
			st jmp seek-dynsym-type-init-init
		s seek-dynsym-type-init-com
		mq rsi dynsym-type
		mov rsi rdi
		s seek-dynsym-type-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-type-com-com
			add 1 rsi
			st jmp seek-dynsym-type-com-init
		s seek-dynsym-type-com-com
		sub rdi rsi
		mq rsi dynsym-type-site

		mov 1 rdi
		lent vtype rsi
		mov 7 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-type rsi
		mq dynsym-type-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dynsym-bind
		aqs dynsym-bind-site
		mq dynsym-type rsi
		mq dynsym-type-site r8
		add r8 rsi
		nao r9
		s seek-dynsym-bind-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dynsym-bind-init-com
			add 1 rsi
			st jmp seek-dynsym-bind-init-init
		s seek-dynsym-bind-init-com
		mq rsi dynsym-bind
		mov rsi rdi
		s seek-dynsym-bind-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-bind-com-com
			add 1 rsi
			st jmp seek-dynsym-bind-com-init
		s seek-dynsym-bind-com-com
		sub rdi rsi
		mq rsi dynsym-bind-site

		mov 1 rdi
		lent vbind rsi
		mov 7 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-bind rsi
		mq dynsym-bind-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dynsym-loc
		aqs dynsym-loc-site
		mq dynsym-bind rsi
		mq dynsym-bind-site r8
		add r8 rsi
		nao r9
		s seek-dynsym-loc-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dynsym-loc-init-com
			add 1 rsi
			st jmp seek-dynsym-loc-init-init
		s seek-dynsym-loc-init-com
		mq rsi dynsym-loc
		mov rsi rdi
		s seek-dynsym-loc-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-loc-com-com
			add 1 rsi
			st jmp seek-dynsym-loc-com-init
		s seek-dynsym-loc-com-com
		sub rdi rsi
		mq rsi dynsym-loc-site

		mov 1 rdi
		lent vloc rsi
		mov 6 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-loc rsi
		mq dynsym-loc-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		aqs dynsym-sect-site
		aqs dynsym-sect-site-site
		mq dynsym-loc rsi
		mq dynsym-loc-site r8
		add r8 rsi
		nao r9
		s seek-dynsym-sect-site-init-init
			movs 0 rsi r9
			cmp 20 r9
			st jne seek-dynsym-sect-site-init-com
			add 1 rsi
			st jmp seek-dynsym-sect-site-init-init
		s seek-dynsym-sect-site-init-com
		mq rsi dynsym-sect-site
		mov rsi rdi
		s seek-dynsym-sect-site-com-init
			movs 0 rsi r9
			cmp 20 r9
			st je seek-dynsym-sect-site-com-com
			add 1 rsi
			st jmp seek-dynsym-sect-site-com-init
		s seek-dynsym-sect-site-com-com
		sub rdi rsi
		mq rsi dynsym-sect-site-site

		mov 1 rdi
		lent vsect-site rsi
		mov c rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-sect-site rsi
		mq dynsym-sect-site-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq mode-site r11
		sub 1 r11
		factq naof-dsr-secs r11
		# lseek
		mq binf rdi
		mq dynsym-site rsi
		add r11 rsi
		nao rdx
		mov 8 rax
		sys

		# read
		mq binf rdi
		mov 18 rdx
		lq cs0 rsi
		mov 0 rax
		sys
		mq rax cs0-site

		lent rcs0 rsi
		lq cs0 rdi
		mq cs0-site rcx
		mov a rbx
		nao r10
		mq equations rdx
		mq views r11
		addc views view-space r11
		dct r11

		mq cs0 r8
		mov ffffffff r9
		and r9 r8
		mq r8 rela-rname-esite

		# lseek
		mq binf rdi
		mq dynstr-site rsi
		mq rela-rname-esite r8
		add r8 rsi
		nao rdx
		mov 8 rax
		sys

		# read
		mq binf rdi
		mov 200 rdx
		lq cs1 rsi
		mov 0 rax
		sys
		aqs dynsym-name
		aqs dynsym-name-site
		lq cs1 rsi
		mq rsi dynsym-name
		mov rsi rdi
		nao r9
		s seek-dynsym-name-com-init
			movs 0 rsi r9
			cmp 0 r9
			st je seek-dynsym-name-com-com
			add 1 rsi
			st jmp seek-dynsym-name-com-init
		s seek-dynsym-name-com-com
		sub rdi rsi
		mq rsi dynsym-name-site

		mov 1 rdi
		lent vname rsi
		mov 7 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq dynsym-name rsi
		mq dynsym-name-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq elfc rdi
		lent krtype rcx
		mov 5 r10
		lent kdynsym rsi
		mov 6 r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kname rcx
		mov 4 r10
		mq dynsym-name rsi
		mq dynsym-name-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kvalue rcx
		mov 5 r10
		mq dynsym-value rsi
		mq dynsym-value-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent knaof-secs rcx
		mov 9 r10
		mq dynsym-naof-secs rsi
		mq dynsym-naof-secs-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent ktype rcx
		mov 4 r10
		mq dynsym-type rsi
		mq dynsym-type-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kbind rcx
		mov 4 r10
		mq dynsym-bind rsi
		mq dynsym-bind-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent kloc rcx
		mov 3 r10
		mq dynsym-loc rsi
		mq dynsym-loc-site r11
		nao r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		lent ksect-site rcx
		mov 9 r10
		mq dynsym-sect-site rsi
		mq dynsym-sect-site-site r11
		nao r12
		mov 1 r12
		lq cfcs rbx
		mq equations rdx
		mq cf r13
		mq cf r14
		addc cf atc r14
		dct r14
		mq rax elfc

		mq elfc rdi
		mq elffn rsi
		mq cf r11
		addc cf ac r11
		dct r11
		mq elfc rdi
		nao r9
		mov r9 0 rdi
		s each-section-mode-c-init-incr-mode-site-init
		mq mode-site r8
		add 1 r8
		mq r8 mode-site
	s each-section-mode-c-com

	s drive-esite-init
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mq esite r8
	mq sect-site r9
	add r9 r8
	add 1 r8
	mq r8 esite
	st jmp each-elf-section-init
s each-elf-section-com

mov 1 rdi
lent i-sim rsi
mov 1b rdx
mov 1 rax
sys
mov 1 rdi
mq elffn rsi
mov 10 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mq equations r11
addc equations task r11
#dct r11

mov 1 rdi
mq elffn rsi
mov 10 rdx
mov 1 rax
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax

mq elffn rdi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ic r11
dct r11

##########################################################################################################
# com
##########################################################################################################
# close
mq binf rdi
mov 3 rax
sys
# close
mq elff rdi
mov 3 rax
sys

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
