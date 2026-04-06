##########################################################################################################
# com
##########################################################################################################
# rdi | fn
# rsi | stack-pad
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs fn
mqb rdi fn
aqs file

# open-read
nao rsi
lent fn rdi
mov 2 rax
sys
mq rax file
aqs naof-fsecs
# lseek
mq file rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mqb rax naof-fsecs
# lseek
mq file rdi
nao rsi
nao rdx
mov 8 rax
sys
# read
mq file rdi
mov 8 rdx
lq space rsi
mov 0 rax
sys
# close
mq file rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
add 1000 rsp
ret

#init
entb fn droid/clerk-com.secs
aqs file
# unlink
lentb fn rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 41 rsi
lentb fn rdi
mov 2 rax
sys
mqb rax file
# write
mqb file rdi
mov 8 rdx
lqb naof-entree-secs rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
