##########################################################################################################
# view-number
##########################################################################################################
# rsi | relay
# rdi | number
# rbx | base
# rdx | equations
% equations
##########################################################################################################
# view-number-init
##########################################################################################################
sub 1000 rsp
aqs relay
mq rsi relay
aqs number
mq rdi number
aqs base
mq rbx base
aqs equations
mq rdx equations
aqs vn-entree
isr 500
aqs vn-entree-site
nao r8
mq r8 vn-entree-site

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
lq vn-entree rsi
add r8 rsi
mov a r9
movs r9 0 rsi
add 1 r8
mq r8 vn-entree-site

mov 1 rdi
lq vn-entree rsi
mq vn-entree-site rdx
mov 1 rax
sys
#init
#com

##########################################################################################################
# view-number-com
##########################################################################################################
add 1000 rsp
ret
#init
#com
