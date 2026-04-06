##########################################################################################################
# gcbk | get-chart-record-by-key
##########################################################################################################
# rdi | chart-file
# r9  | get-key
# r10 | naof-key-secs
# rsi | get-value
# rcx | naof-value-secs
# r12 | return-string
# rbx | cs
# rdx | equations
# r13 | views
# r14 | cf
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs chf
mq rdi chf
aqs get-key
mq r9 get-key
aqs naof-key-secs
mq r10 naof-key-secs
aqs get-value
mq rsi get-value
aqs naof-value-secs
mq rcx naof-value-secs
aqs string
mq r12 string
aqs bcs
mq rbx bcs
aqs equations
mq rdx equations
aqs views
mq r13 views
aqs cf
mq r14 cf
aqs naof-records
nao r8
mq r8 naof-records
aqs cs
isr 500
ent jsect \n
ent jauxsect |
aqs fsite
nao r8
mq r8 fsite
aqs nao
nao r8
mq r8 nao
ent rnaof-secs naof-secs
ent rnaof-seek-secs naof-seek-secs
ent rksite ksite
ent rcmp cmp

# lseek
mq chf rdi
nao rsi
nao rdx
mov 8 rax
sys

ent rnrs nrs
ent rseek-site seek-site

aqs mode
mov 1 r8
mq r8 mode
aqs nrs
aqs seek-site
aqs site
aqs ksite
aqs at-key
aqs naof-at-key-secs
aqs oat-key
aqs at-value
aqs naof-at-value-secs
aqs cmpv
s calc-naof-records-init
	# lseek
	mq chf rdi
	mq fsite rsi
	nao rdx
	mov 8 rax
	sys
	# read
	mq chf rdi
	mov 50 rdx
	lq cs rsi
	mov 0 rax
	sys
	mq rax nrs

	mq nrs rax
	cmp 0 rax
	st je set-non-init
	nao r8
	mq r8 site
	s seek-jsecs-init
		lq cs rdi
		mq site r8
		add r8 rdi
		mq nrs rdx
		sub r8 rdx
		lent jsect rsi
		mov 1 rcx
		mq equations r11
		addc equations seek-space r11
		dct r11
		mq rax seek-site

		mq seek-site rax
		mov ffffffffffffffff r8
		cmp r8 rax
		st je seek-jsecs-com
		cmp 0 rax
		st jl seek-jsecs-com

		nao r8
		mq r8 ksite
		lq cs rsi
		mq site r8
		add r8 rsi
		mq rsi at-key
		s calc-through-keys-init
			mq ksite r10
			mq seek-site r11
			cmp r10 r11
			st jbe calc-through-keys-com

			mq at-key rdi
			mq ksite r8
			mq seek-site rdx
			sub r8 rdx
			lent jauxsect rsi
			mov 1 rcx
			mq equations r11
			addc equations seek-space r11
			dct r11
			mq rax naof-at-key-secs
			mov ffffffffffffffff r8
			cmp r8 rax
			st je calc-through-keys-com
			add 1 rax
			mq ksite r8
			add rax r8
			mq r8 ksite

			mq at-key rsi
			mq naof-at-key-secs rcx
			mq at-key rdi
			add rcx rdi
			add 1 rdi
			mq rdi at-key
			mov 24 rbx
			mq equations r11
			addc equations entree-to-number r11
			dct r11
			mq rax naof-at-key-secs
			mq ksite r8
			add rax r8
			add 1 r8
			mq r8 ksite
			mq at-key rsi
			mq rsi oat-key

			mq at-key rsi
			mq naof-at-key-secs r8
			add r8 rsi
			add 1 rsi
			mq rsi at-key

			mq ksite r10
			mq seek-site r11
			cmp r10 r11
			st jbe calc-through-keys-com

			mq at-key rdi
			mq rdi at-value
			mq ksite r8
			mq seek-site rdx
			sub r8 rdx
			lent jauxsect rsi
			mov 1 rcx
			mq equations r11
			addc equations seek-space r11
			dct r11
			mq rax naof-at-value-secs
			mov ffffffffffffffff r8
			cmp r8 rax
			st je calc-through-keys-com
			add 1 rax
			mq ksite r8
			add rax r8
			mq r8 ksite

			mq at-value rsi
			mq naof-at-value-secs rcx
			mq at-key rdi
			add rcx rdi
			add 1 rdi
			mq rdi at-value
			mov 24 rbx
			mq equations r11
			addc equations entree-to-number r11
			dct r11
			mq rax naof-at-value-secs
			mq ksite r8
			add rax r8
			add 1 r8
			mq r8 ksite

			mov 1 rdi
			mq oat-key rsi
			mq naof-at-key-secs rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mov 1 rdi
			mq at-value rsi
			mq naof-at-value-secs rdx
			mov 1 rax
			sys
			mov 1 rdi
			lent jsect rsi
			mov 1 rdx
			mov 1 rax
			sys

			mq get-key rdi
			mq naof-key-secs rdx
			mq oat-key rsi
			mq naof-at-key-secs rcx
			mq equations r11
			addc equations compair-spaces r11
			dct r11
			mq rax cmpv

			mq cmpv rax
			cmp 1 rax
			st jne compair-values-com

			mq get-value rdi
			mq naof-value-secs rdx
			mq at-value rsi
			mq naof-at-value-secs rcx
			mq equations r11
			addc equations compair-spaces r11
			dct r11
			mq rax cmpv

			mq cmpv rax
			cmp 1 rax
			st je set-string-init
			s compair-values-com

			mq at-value rsi
			mq naof-at-value-secs r8
			add r8 rsi
			add 1 rsi
			mq rsi at-key
			st jmp calc-through-keys-init
		s calc-through-keys-com
		st jmp set-string-com

		s set-string-init
			mq string rdi
			lq cs rsi
			mq site r8
			add r8 rsi
			mq seek-site rcx
			mq bcs rbx
			mq equations rdx
			mq cf r11
			addc cf astr r11
			dct r11
			st jmp calc-naof-records-com
		s set-string-com

		mq seek-site rax
		mq site r8
		add rax r8
		add 1 r8
		mq r8 site
		add 1 rax
		mq fsite r8
		add r8 rax
		mq rax fsite

		mq naof-records r10
		add 1 r10
		mq r10 naof-records

		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq site r8
		mq nrs r9
		cmp r8 r9
		st je seek-jsecs-com
		st jmp seek-jsecs-init

	s seek-jsecs-com
	st jmp calc-naof-records-init
s calc-naof-records-com
st jmp set-non-com

s set-non-init
nao r8
mq r8 mode
s set-non-com

##########################################################################################################
# com
##########################################################################################################
mq mode rax
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
lq nrs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
lent rcmp rsi
mq cmpv rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com
