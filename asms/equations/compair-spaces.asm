##########################################################################################################
# get-naof-secs
# rdi | entree
# rdx | naof-entree-secs
# rsi | seek
# rcx | naof-seek-secs
##########################################################################################################
# com-init
##########################################################################################################6push rbp
sub 1000 rsp
aqs entree
mq rdi entree
aqs naof-entree-secs
mq rdx naof-entree-secs
aqs seek
mq rsi seek
aqs naof-seek-secs
mq rcx naof-seek-secs
aqs is-equal
nao r8
mq r8 is-equal
#st jmp compair-spaces-com

#init
ent jsecs \n
mov 1 rdi
mq entree rsi
mq naof-entree-secs rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

##########################################################################################################
# not-if-not-equal-naof-secs
##########################################################################################################
mq naof-entree-secs r8
mq naof-seek-secs r9
cmp r8 r9
st jne compair-spaces-com

##########################################################################################################
# seek-space
##########################################################################################################
mq entree rsi
mq seek rdi
mq naof-entree-secs rcx
nao rdx
rcmp
st jne compair-spaces-com
mov 1 r8
mq r8 is-equal
s compair-spaces-com
##########################################################################################################
# com
##########################################################################################################
mq is-equal rax
add 1000 rsp
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
mq file rdi
mov 8 rdx
lq seek-site rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
