##########################################################################################################
# sc | seek-chart
##########################################################################################################
# rdi | ci
# rcx | seek-name
# rsi | seek-value
# r14 | csite
# r15 | wrecord
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs ci
mq rdi ci
aqs chart
mov 0 rdi r8
mq r8 chart
aqs naof-chart-secs
mov 8 rdi r8
mq r8 naof-chart-secs
aqs seek-name
mq rcx seek-name
aqs seek-value
mq rsi seek-value
aqs csite
mq r14 csite
aqs wrecord
mq r15 wrecord
aqs equations
mq rdx equations
aqs cf
mq rbx cf
aqs views
mq r12 views
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
ent rcsite csite
ent ris-com is-com
ent rchart-at chart-at
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs is-com
aqs chart-at
aqs is-seek
nao r8
mq r8 is-seek
aqs record
aqs record-site
mq r8 record-site
aqs chart-site
aqs compr
ent rcompr compr
ent rrecord-site record-site

mq chart rdi
mq csite r8
add r8 rdi
mq rdi record

mq csite r8
mq naof-chart-secs r9
cmp r8 r9
st je fgn-non-init
s seek-each-record-init
	mq chart rdi
	mq csite r8
	add r8 rdi
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
	mq chart r9
	sub r9 r8
	mq r8 csite

	mq is-com r12
	cmp 1 r12
	st je seek-each-record-com
	st jmp seek-each-record-init
s seek-each-record-com
mq record rsi
mq chart-at rdi
sub rsi rdi
sub 1 rdi
mq rdi record-site
mq record rsi
mq wrecord rdi
mq record-site rcx
mq equations r11
addc equations com r11
dct r11
st jmp fgn-non-com

s fgn-non-init
	nao r8
	mq r8 record-site
s fgn-non-com

#init
#com
##########################################################################################################
# com
##########################################################################################################
mq record-site rax
mq csite rbx
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
