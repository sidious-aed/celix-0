##########################################################################################################
# gc | get-chart
##########################################################################################################
# rdi | chart-name
# rdx | equations
# rbx | views
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs chart-name
mq rdi chart-name
aqs equations
mq rdx equations
aqs views
mq rbx views
# elements can be a nice alias for records, speaking with of course regards to many vantages.
aqs cf
aqs naof-records
nao r8
mq r8 naof-records
aqs cs
isr 500
ent jsect \n

# open-read
nao rsi
mq chart-name rdi
mov 2 rax
sys
mq rax cf

ent rnrs nrs
ent rseek-site seek-site

aqs nrs
aqs seek-site
aqs site
s calc-naof-records-init
	# read
	mq cf rdi
	mov 50 rdx
	lq cs rsi
	mov 0 rax
	sys
	mq rax nrs

	mq nrs rax
	cmp 0 rax
	st je calc-naof-records-com
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
		mov ffffffffffffffff r8
		cmp r8 rax
		st je seek-jsecs-com
		cmp 0 rax
		st jl seek-jsecs-com

		mq seek-site rax
		mq site r8
		add rax r8
		add 1 r8
		mq r8 site

		mq naof-records r10
		add 1 r10
		mq r10 naof-records

		mq nrs r9
		cmp r8 r9
		st je seek-jsecs-com
		st jmp seek-jsecs-init

	s seek-jsecs-com
	st jmp calc-naof-records-init
s calc-naof-records-com

# lseek
mq cf rdi
nao rsi
nao rdx
mov 8 rax
sys

##########################################################################################################
# com
##########################################################################################################
mq cf rax
mq naof-records rdx
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
