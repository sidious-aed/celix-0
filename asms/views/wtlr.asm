##########################################################################################################
# wtlr | write-terminal-log-request
##########################################################################################################
# rsi | string
# rcx | string-site
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs string
mq rsi string
aqs string-site
mq rcx string-site
aqs equations
mq r12 equations
ent logn-init prints/
ent logn-com .print
aqs lname
isr 400
aqs lname-site

##########################################################################################################
# generate-nonce-name
##########################################################################################################
aqs time-seconds
aqs time-micro-seconds
aqs zones0
aqs zones1

# gettimeofday
lq time-seconds rdi
lq zones0 rsi
mov 60 rax
sys

lent logn-init rsi
lq lname rdi
mov 7 rcx
mq rcx lname-site
mq equations r11
addc equations com r11
dct r11

mq time-seconds rdi
lq lname rsi
mq lname-site r8
add r8 rsi
mov 24 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq lname-site r8
add rax r8
lq lname rsi
add r8 rsi
mov 2e r9
movs r9 0 rsi
add 1 r8
mq r8 lname-site

mq time-micro-seconds rdi
lq lname rsi
mq lname-site r8
add r8 rsi
mov 24 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq lname-site r8
add rax r8
mq r8 lname-site

lent logn-com rsi
lq lname rdi
mq lname-site r8
add r8 rdi
mov 6 rcx
add rcx r8
mq r8 lname-site
mq equations r11
addc equations com r11
dct r11
lq lname rsi
mq lname-site r8
add r8 rsi
nao r9
movs r9 0 rsi
#init
#com

##########################################################################################################
# write-print-file-request
##########################################################################################################
aqs pf
# unlink
lq lname rdi
mov 57 rax
sys

# open-write
mov 1f8 rdx
mov 41 rsi
lq lname rdi
mov 2 rax
sys
mq rax pf

# write
mq pf rdi
mq string rsi
mq string-site rdx
mov 1 rax
sys

# close
mq pf rdi
mov 3 rax
sys
#init
#com
##########################################################################################################
# com
##########################################################################################################
add 1000 rsp
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
mov 441 rsi
lent fn rdi
mov 2 rax
sys
mq rax file
# write
mq file rdi
lq lname rsi
mq lname-site rdx
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
