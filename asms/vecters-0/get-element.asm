##########################################################################################################
# com
##########################################################################################################
# rdi | vecter
# rsi | element-site
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs vecter
mqb rdi vecter
aqs element-site
mqb rsi element-site

aqs at
mqb vecter rsi
mov 0 rsi r8
factqb element-site r8
add 18 r8
add rsi r8
mqb r8 at

##########################################################################################################
# com
##########################################################################################################
mqb at rax
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
