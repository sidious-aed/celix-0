##########################################################################################################
# ic | index-chart
##########################################################################################################
# rsi | seek-name
# rdi | seek-value
# rbx | wspace
% equations
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs seek-name
mq rsi seek-name
aqs seek-name-site
aqs seek-value
mq rdi seek-value
aqs seek-value-site
aqs equations
mq r14 equations
aqs views
mq r15 views
aqs wspace
mq rbx wspace
aqs wspace-site
nao r8
mq r8 wspace-site
aqs bspace
isr 200
aqs bspace-site

ent jsect \n
ent rsite site
ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
#sys

mq seek-name rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax seek-name-site

lent rsite rsi
mq seek-name-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

mq seek-value rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax seek-value-site

lent rsite rsi
mq seek-value-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

mq seek-name-site rdi
lq bspace rsi
mov 24 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq rax bspace-site
mq rax wspace-site

mov 1 rdi
lq bspace rsi
mq bspace-site rdx
mov 1 rax
#sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys

lq bspace rsi
mq wspace rdi
mq bspace-site rcx
mq equations r11
addc equations com r11
dct r11
mq wspace rsi
mq wspace-site r8
add r8 rsi
add 1 r8
mq r8 wspace-site
mov 7c r9
movs r9 0 rsi

mq seek-name rsi
mq wspace rdi
mq wspace-site r8
add r8 rdi
mq seek-name-site rcx
add rcx r8
mq r8 wspace-site
mq equations r11
addc equations com r11
dct r11
mq wspace rsi
mq wspace-site r8
add r8 rsi
add 1 r8
mq r8 wspace-site
mov 7c r9
movs r9 0 rsi

mq seek-value-site rdi
lq bspace rsi
mov 24 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq rax bspace-site

lq bspace rsi
mq wspace rdi
mq wspace-site r8
add r8 rdi
mq bspace-site rcx
add rcx r8
mq r8 wspace-site
mq equations r11
addc equations com r11
dct r11
mq wspace rsi
mq wspace-site r8
add r8 rsi
add 1 r8
mq r8 wspace-site
mov 7c r9
movs r9 0 rsi

mq seek-value rsi
mq wspace rdi
mq wspace-site r8
add r8 rdi
mq seek-value-site rcx
add rcx r8
mq r8 wspace-site
mq equations r11
addc equations com r11
dct r11
mq wspace rsi
mq wspace-site r8
add r8 rsi
nao r9
movs r9 0 rsi

mov 1 rdi
mq wspace rsi
mq wspace-site rdx
mov 1 rax
#sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys

##########################################################################################################
# com
##########################################################################################################
mq wspace-site rax
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
