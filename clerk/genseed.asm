##########################################################################################################
# com
##########################################################################################################
# rdi | grid
# rcx | naof-secs
# rdx | equations
# r13 sret
% equations
##########################################################################################################
# com-init
##########################################################################################################
#push rbp
#mov rsp rbp
sub 1000 rsp
aqs grid
mq rdi grid
aqs naof-secs
mq rcx naof-secs
aqs equations
mq rdx equations
aqs sret
mq r13 sret
ent ss-name /dev/random
aqs ss-file
aqs grid-secs

##########################################################################################################
# get-grid-secs
##########################################################################################################
mq grid rdi
mq naof-secs rsi
mq equations r11
addc equations naof-grid-secs r11
lea 3 rip r13
dst r11
mq rax grid-secs

##########################################################################################################
# obtain-genseed
##########################################################################################################
# open-read
lent ss-name rdi
nao rsi
mov 2 rax
sys
mq rax ss-file

# read
mq ss-file rdi
mq naof-secs rdx
mq grid-secs rsi
nao rax
sys

# close
mq ss-file rdi
mov 3 rax
sys
#init
#com

##########################################################################################################
# com-com
##########################################################################################################
mq grid-secs rax
mq sret r13
add 1000 rsp
dst r13

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
mq naof-secs rdx
mq entree rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
