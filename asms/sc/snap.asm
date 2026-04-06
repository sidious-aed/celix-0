##########################################################################################################
# gn | get-next
##########################################################################################################
# rdi | chart-name
# rsi | snapci
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs chart-name
mq rdi chart-name
aqs snapci
mq rsi snapci
aqs chart-name-site
aqs fsite
aqs equations
mq rdx equations
aqs index-name
isr 400
aqs index-name-site
ent jsect \n
ent rsite site
ent index-com .index
ent jsect \n
aqs chartf
aqs chartf-site
aqs indexf
aqs indexf-site

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

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
lq index-name rsi
mq index-name-site r8
add r8 rsi
nao r9
movs r9 0 rsi

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

# open-read
nao rsi
mq chart-name rdi
mov 2 rax
sys
mq rax chartf

# lseek
mq chartf rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mq rax chartf-site
mq snapci r8
mov rax 8 r8

# file-mmap
nao rdi
mq chartf-site rsi
mov 7 rdx
mov 2 r10
mq chartf r8
nao r9
mov 9 rax
sys
mq snapci r8
mov rax 0 r8

# close
mq chartf rdi
mov 3 rax
sys

# open-read
nao rsi
lq index-name rdi
mov 2 rax
sys
mq rax indexf

# lseek
mq indexf rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mq rax indexf-site
mq snapci r8
mov rax 18 r8

# file-mmap
nao rdi
mq indexf-site rsi
mov 7 rdx
mov 2 r10
mq indexf r8
nao r9
mov 9 rax
sys
mq snapci r8
mov rax 10 r8

# close
mq indexf rdi
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
