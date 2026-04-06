##########################################################################################################
# gcas | get-chart-record-at-site
##########################################################################################################
# rdi | chart-file
# rsi | get-site
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
aqs gsite
mq rsi gsite
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
aqs fsite
nao r8
mq r8 fsite
aqs nao
nao r8
mq r8 nao

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

		mq naof-records r8
		mq gsite r9
		cmp r8 r9
		st je set-string-init
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
#com
