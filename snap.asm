##########################################################################################################
# snap
##########################################################################################################
# rdi | file-name
# r13 | sret
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs file-name
mq rdi file-name
aqs file
aqs naof-file-secs
aqs snaped-space
aqs sret
mq r13 sret

##########################################################################################################
# obtain-file-meta
##########################################################################################################
aqs file
# open-read
nao rsi
mq file-name rdi
mov 2 rax
sys
mq rax file

# lseek
mq file rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mq rax naof-file-secs

##########################################################################################################
# snap-file
##########################################################################################################
# file-mmap
nao rdi
mq naof-file-secs rsi
mov 7 rdx
mov 2 r10
mq file r8
nao r9
mov 9 rax
sys
mq rax snaped-space

# close
mq file rdi
mov 3 rax
sys
#init
#com

##########################################################################################################
# com-com
##########################################################################################################
mq sret r13
mq snaped-space rax
mq naof-file-secs rcx
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
