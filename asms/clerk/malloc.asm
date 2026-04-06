##########################################################################################################
# malloc
##########################################################################################################
# rdi | naof-secs
# rdx | libc-site
% libc
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs naof-secs
mqb rdi naof-secs
aqs libc-site
mqb rdx libc-site
aqs stack-site

mqb naof-secs rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax stack-site

##########################################################################################################
# com
##########################################################################################################
mqb stack-site rax
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
