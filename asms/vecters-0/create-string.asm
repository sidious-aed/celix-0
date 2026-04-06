##########################################################################################################
# com
##########################################################################################################
# rdi | breadth
# rdx | libc-site
% libc
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs breadth
mqb rdi breadth
aqs libc-site
mqb rdx libc-site
aqs naof-vsecs
mqb breadth r8
add 19 r8
mqb r8 naof-vsecs

aqs v
mqb naof-vsecs rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax v

##########################################################################################################
# meta
##########################################################################################################
mqb v r8
# nesecs
mov 1 r9
mov r9 0 r8
# nes
mqb breadth r9
mov r9 8 r8
# site
nao r9
mov r9 10 r8

##########################################################################################################
# com-com
##########################################################################################################
mov r9 rbx
mqb v rax
#mqb naof-vsecs rcx
add 1000 rsp
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
