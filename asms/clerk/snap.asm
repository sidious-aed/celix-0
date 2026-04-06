##########################################################################################################
# snap
##########################################################################################################
# rdi | file-name
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 40000 rsp
aqs file-name
mqb rdi file-name
aqs file
aqs naof-file-secs
aqs snaped-space
aqs rspace
isr 30000
aqs naof-file-secs2

##########################################################################################################
# obtain-file-meta
##########################################################################################################
aqs file
# open-read
nao rsi
mqb file-name rdi
mov 2 rax
sys
mqb rax file

#init
nao r8
mqb r8 naof-file-secs
s seek-com-init
# read
mqb file rdi
mov 30000 rdx
lqb rspace rsi
mov 0 rax
sys
cmp 0 rax
st je seek-com-com
mqb naof-file-secs r8
add rax r8
mqb r8 naof-file-secs
st jmp seek-com-init
s seek-com-com
mqb naof-file-secs r8
mqb r8 naof-file-secs2
#com

# lseek
mqb file rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mqb rax naof-file-secs

##########################################################################################################
# snap-file
##########################################################################################################
# file-mmap
nao rdi
mqb naof-file-secs rsi
mov 7 rdx
mov 2 r10
mqb file r8
nao r9
mov 9 rax
sys
mqb rax snaped-space

# close
mqb file rdi
mov 3 rax
sys
#init
#com

##########################################################################################################
# com-com
##########################################################################################################
mqb naof-file-secs rcx
mqb snaped-space rax
add 40000 rsp
pop rbp
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
mq naof-secs rdx
mq entree rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
