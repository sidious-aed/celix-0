##########################################################################################################
# xstr | expand-string
##########################################################################################################
# rdi | vect
# rcx | naof-string-secs
# rbx | cs
# rdx | equations
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs vect
mq rdi vect
aqs naof-string-secs
mq rcx naof-string-secs
aqs cs
mq rbx cs
aqs equations
mq rdx equations
aqs vsite
aqs vnaof-esecs
aqs vscope
mq vect rdi
mov 0 rdi r8
mq r8 vsite
mov 8 rdi r8
mq r8 vnaof-esecs
mov 10 rdi r8
mq r8 vscope

##########################################################################################################
# expansion
##########################################################################################################
aqs naof-gsecs
aqs vspancef
mov 2 r8
mq r8 vspancef

mq vsite r11
mq naof-string-secs r12
add r12 r11
mq vscope r12
cmp r11 r12
st jae expansion-com

ent rexpansion avect preexpansion.\n
mov 1 rdi
lent rexpansion rsi
mov 14 rdx
mov 1 rax
sys

mq vect r10
aqs naof-csecs
mq vsite r11
add 18 r11
mq r11 naof-csecs

mq vscope r11
mq naof-string-secs r12
add r12 r11
factq vspancef r11
mq r11 vscope
mov r11 10 r10
add 18 r11
mq r11 naof-gsecs

aqs ovect
mq vect r8
mq r8 ovect
mq cs rdi
mq naof-gsecs rsi
mq equations r11
addc equations cr r11
dct r11
mq rax vect

mq ovect rsi
mq vect rdi
mq naof-csecs rcx
mq equations r11
addc equations com r11
dct r11

s expansion-com
##########################################################################################################
# com
##########################################################################################################
mq vect rax
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
# write
mq file rdi
mov 8 rdx
lq vnaof-esecs rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq naof-csecs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
