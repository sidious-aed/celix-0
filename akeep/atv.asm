##########################################################################################################
# atv
##########################################################################################################
# rdi | vect
# rsi | element
# rdx | equations
% equations
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs vect
mqb rdi vect
aqs element
mqb rsi element
aqs equations
mqb rdx equations
aqs vsite
aqs naof-esecs
aqs breadth
mqb vect r8
mov 0 r8 r9
mqb r9 vsite
mov 8 r8 r9
mqb r9 naof-esecs
mov 10 r8 r9
mqb r9 breadth
entb rexpansion expanding vect.\n
entb rae adding element.\n

entb fn droid/clerk-com1.secs
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
lqb vect rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys

mqb vsite r10
add 1 r10
mqb breadth r11
cmp r10 r11
st ja expansion-com
mov 1 rdi
lentb rexpansion rsi
mov 10 rdx
mov 1 rax
sys

aqs naof-gsecs
mqb vsite r10
factqb naof-esecs r10
add 10 r10
mqb r10 naof-gsecs
aqs naof-bsecs
mqb vsite r10
factqb breadth r10
add 10 r10
mqb r10 naof-bsecs

aqs nvect
nao rbx
mqb naof-bsecs rdi
mqb equations r11
addc equations cr r11
dct r11
mqb rax nvect

mqb vect rsi
mqb nvect rdi
mqb naof-gsects rcx
mqb equations r11
addc equations com r11
dct r11
s expansion-com

##########################################################################################################
# add-element
##########################################################################################################
mov 1 rdi
lentb rae rsi
mov 10 rdx
mov 1 rax
sys

aqs naof-csecs
mqb element rsi
mqb vect rdi
add 10 rdi
mqb vsite r10
factqb naof-esecs r10
mqb r10 naof-csecs
add r10 rdi
mqb naof-esecs rcx
mqb equations r11
addc equations com r11
dct r11

##########################################################################################################
# update-meta
##########################################################################################################
mqb vsite r10
add 1 r10
mqb r10 vsite
mqb vect r8
mov r10 0 r8

##########################################################################################################
# com
##########################################################################################################
mqb vect rax
mqb naof-esecs r13
add 1000 rsp
pop rbp
ret

#init
#com
