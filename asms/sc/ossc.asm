##########################################################################################################
# ssc | scream-seek-chart
##########################################################################################################
# rdi | ci
# rsi | seek
# r13 | csite
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
aqs chart-index
mov 10 rdi r8
mq r8 chart-index
aqs naof-chart-index-secs
mov 18 rdi r8
mq r8 naof-chart-index-secs
aqs strstr
mq r14 strstr
aqs seek
mq rsi seek
aqs csite
mq r13 csite
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
aqs tseek
isr 400
aqs tseek-site
aqs record
aqs record-site
nao r8
mq r8 record-site

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

aqs seek-site
mq seek rsi
mq chart rdi
mq csite r8
add r8 rdi
mq strstr r11
dct r11
mq rax seek-site
cmp 0 rax
st je ssc-com
aqs sfo
mq rax sfo
aqs ics
mq chart rdi
sub rdi rax
mq rax ics

#init
mov 1 rdi
mq sfo rsi
mov c rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

mq ics rdi
mq chart-index rsi
nao r10
s seek-record-from-orecle-site-init
	mov 0 rsi r11
	cmp r11 rdi
	st jb seek-record-from-orecle-site-com
	mov r11 r10
	add 8 rsi
	st jmp seek-record-from-orecle-site-init
s seek-record-from-orecle-site-com
sub r10 r11
#sub 1 r11
mq r11 record-site
mq chart r11
add r11 r10
mq r10 sfo

#init
mov 1 rdi
mq chart rsi
mq chart-index r8
mov 10 r8 r8
add r8 rsi
mov a rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

#init
mov 1 rdi
mq sfo rsi
mq record-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

ent rrcs rcs
lent rrcs rsi
mq rcs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent rrcs-site rcs-site
lent rrcs-site rsi
mq rcs-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent rcsite csite
lent rcsite rsi
mq csite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com

mq sfo rsi
mq wrecord rdi
mq record-site rcx
mq equations r11
addc equations com r11
dct r11

s ssc-com
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
