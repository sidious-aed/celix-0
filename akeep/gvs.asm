##########################################################################################################
# atv
##########################################################################################################
# rdi | vect
# rsi | site
% equations
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs vect
mqb rdi vect
aqs site
mqb rsi site

aqs naof-esecs
mqb vect r8
mov 8 r8 r9
mqb r9 naof-esecs

aqs at-e
mqb site r10
factqb naof-esecs r10
mqb vect r11
add 10 r11
add r10 r11
mqb r11 at-e

##########################################################################################################
# com
##########################################################################################################
mqb at-e rax
add 1000 rsp
pop rbp
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
lqb naof-esecs rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
