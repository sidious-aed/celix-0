##########################################################################################################
# ic | index-chart
##########################################################################################################
# rdi | chart-name
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs chart-name
mq rdi chart-name
aqs chart-name-site
aqs equations
mq rdx equations
aqs cf
mq rbx cf
aqs views
mq r12 views
aqs cs
isr 5000
aqs fsite
nao r8
mq r8 fsite
aqs index-name
isr 400
aqs index-name-site
ent index-com .index
ent jsect \n
aqs chartf
aqs indexf

#init
ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys
#com

mq chart-name rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax chart-name-site

mq chart-name rsi
lq index-name rdi
mq chart-name-site rcx
mq equations r11
addc equations com r11
dct r11

lent index-com rsi
lq index-name rdi
mq chart-name-site r8
add r8 rdi
mov 6 rcx
add rcx r8
mq r8 index-name-site
mq equations r11
addc equations com r11
dct r11

mov 1 rdi
lq index-name rsi
mq index-name-site rdx
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

# unlink
lq index-name rdi
mov 57 rax
sys

# open-write
mov 1f8 rdx
mov 41 rsi
lq index-name rdi
mov 2 rax
sys
mq rax indexf

# open-read
nao rsi
mq chart-name rdi
mov 2 rax
sys
mq rax chartf

aqs chart-site
s index-chart-init
	# lseek
	mq chartf rdi
	mq fsite rsi
	nao rdx
	mov 8 rax
	sys

	# read
	mq chartf rdi
	mov 5000 rdx
	lq cs rsi
	mov 0 rax
	sys
	mq rax nrs

	lent rnrs rsi
	mq nrs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rnrs rsi
	mq nrs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq nrs rax
	cmp 0 rax
	st je index-chart-com

	nao r8
	mq r8 chart-site
	s seek-each-record-init
		mq chart-site r8
		lq cs rdi
		add r8 rdi
		mq r8 chart-at
		mq equations r12
		mq cf r11
		addc cf jp r11
		dct r11
		mq rax is-com
		mq rbx chart-at

		mq chart-at r8
		lq cs r9
		sub r9 r8
		mq r8 chart-site

		mq is-com r12
		cmp 1 r12
		st je seek-each-record-com
		st jmp seek-each-record-init
	s seek-each-record-com

	aqs chart-site0
	mq chart-site r8
	mq fsite r9
	add r9 r8
	mq r8 chart-site0

	mq chart-site r8
	mq fsite r9
	add r8 r9
	#mov r9 r10
	mq r9 fsite

	lent rfsite rsi
	mq fsite rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	# write
	mq indexf rdi
	mov 8 rdx
	lq chart-site0 rsi
	mov 1 rax
	sys

	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys

	st jmp index-chart-init
s index-chart-com
#init
#com

# close
mq indexf rdi
mov 3 rax
sys

# close
mq chartf rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
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
