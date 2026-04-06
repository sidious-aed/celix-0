##########################################################################################################
# gc | get-chart
##########################################################################################################
# rdi | chart-file
# r10 | key
# r11 | naof-key-secs
# rsi | value
# rcx | naof-value-secs
# r12 | return-string
# rdx | equations
# rbx | views
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs cf
mq rdi cf
aqs key
mq r10 key
aqs naof-key-secs
mq r11 naof-key-secs
aqs value
mq rsi value
aqs naof-value-secs
mq rcx naof-value-secs
aqs string
mq r12 string
aqs equations
mq rdx equations
aqs views
mq rbx views

# lseek
mq cf rdi
nao rsi
# 0 | seek-origin
# 2 | seek-completion
mov 2 rdx
mov 8 rax
sys

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
