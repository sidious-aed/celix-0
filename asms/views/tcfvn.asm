##########################################################################################################
# wtlrfvn | write-terminal-log-request-for-view-number
##########################################################################################################
# rsi | relay
# rdi | number
# rbx | base
% equations
##########################################################################################################
# init
##########################################################################################################
sub 2000 rsp
aqs relay
mq rsi relay
aqs number
mq rdi number
aqs base
mq rbx base
aqs equations
mq r12 equations
ent logn-init prints/
ent logn-com .print
aqs lname
isr 400
aqs lname-site
ent jsect \n
aqs vn-entree
isr 1000
aqs vn-entree-site

aqs naof-relay-secs
mq relay rdi
mq equations r15
addc equations get-naof-secs r15
dct r15
mq rax naof-relay-secs
mq rax vn-entree-site

mq relay rsi
lq vn-entree rdi
mq naof-relay-secs rcx
mq equations r11
addc equations com r11
dct r11

ent jedao-sectioner  | 
aqs naof-jedao-sectioner-secs
mov 3 r8
mq r8 naof-jedao-sectioner-secs

lent jedao-sectioner rsi
lq vn-entree rdi
mq vn-entree-site r8
add r8 rdi
mq naof-jedao-sectioner-secs rcx
add rcx r8
mq r8 vn-entree-site
mq equations r11
addc equations com r11
dct r11

mq number rdi
lq vn-entree rsi
mq vn-entree-site r8
add r8 rsi
mq base rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq vn-entree-site r8
add rax r8
mq r8 vn-entree-site
#lq vn-entree rsi
#add r8 rsi
#mov a r9
#movs r9 0 rsi
#add 1 r8
#mq r8 vn-entree-site
#init
#com
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
lq vn-entree rsi
mq vn-entree-site rdx
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
add 2000 rsp
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
