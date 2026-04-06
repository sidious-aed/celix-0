##########################################################################################################
# com
##########################################################################################################
# rdi | naof-esecs
# rsi | breadth
# rbx | equations
% equations
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs naof-esecs
mqb rdi naof-esecs
aqs breadth
mqb rsi breadth
aqs equations
mqb rdx equations

aqs naof-gsecs
mqb naof-esecs r8
factqb breadth r8
add 18 r8
mqb r8 naof-gsecs

##########################################################################################################
# setup vect
##########################################################################################################
aqs vect
nao rbx
mqb naof-gsecs rdi
mqb equations r11
addc equations cr r11
dct r11
#init
mqb rax vect

mqb vect r8
nao r9
mov r9 0 r8
mqb naof-esecs r9
mov r9 8 r8
mqb breadth r9
mov r9 10 r8
#com

##########################################################################################################
# com
##########################################################################################################
mqb vect rax
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
