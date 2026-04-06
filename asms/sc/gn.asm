##########################################################################################################
# gn | get-next
##########################################################################################################
# rdi | chart-name
# r14 | fsite
# r15 | wrecord
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs chart-name
mq rdi chart-name
aqs fsite
mq r14 fsite
aqs wrecord
mq r15 wrecord
aqs equations
mq rdx equations
aqs cf
mq rbx cf
aqs views
mq r12 views
aqs cs
isr 5000
ent jsect \n
aqs chartf
aqs indexf
ent rsite site

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
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
aqs is-seek
nao r8
mq r8 is-seek
aqs record
aqs record-site
aqs chart-site
aqs compr
ent rcompr compr
ent rrecord-site record-site

# open-read
nao rsi
mq chart-name rdi
mov 2 rax
sys
mq rax chartf

lent rfsite rsi
mq fsite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

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
cmp 0 rax
st je set-as-non-seek-init

lent rnrs rsi
mq nrs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

lq cs rsi
mq rsi record
mq rsi chart-at

mq nrs rax
cmp 0 rax
st je index-chart-com

nao r8
mq r8 chart-site
s seek-each-record-init
	mov 1 rdi
	lq tseek rsi
	mq tseek-site rdx
	mov 1 rax
	#sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys
	mov 1 rdi
	mq chart-at rsi
	mq tseek-site rdx
	mov 1 rax
	#sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys

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
	mq rsi ckey
	mq rcx ckey-site
	mq rdi cvalue
	mq rdx cvalue-site

	mq chart-at r8
	lq cs r9
	sub r9 r8
	mq r8 chart-site

	mq is-com r12
	cmp 1 r12
	st je seek-each-record-com
	st jmp seek-each-record-init
s seek-each-record-com

mq chart-at r8
lq cs r9
sub r9 r8
sub 1 r8
mq r8 record-site

mq record rsi
mq wrecord rdi
mq record-site rcx
mq equations r11
addc equations com r11
dct r11

mq chart-site r8
mq fsite r9
add r8 r9
mq r9 fsite

lent rfsite rsi
mq fsite rdi
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

# close
mq chartf rdi
mov 3 rax
sys

st jmp set-as-non-seek-com
s set-as-non-seek-init
	nao r8
	mq r8 record-site
s set-as-non-seek-com

#init
#com
##########################################################################################################
# com
##########################################################################################################
mq record-site rax
mq fsite rbx
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
