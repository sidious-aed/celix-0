##########################################################################################################
# add-to-entree
##########################################################################################################
# rsi | entree
# rdi | destination
# rcx | naof-secs
# rbx | site
# rdx | equations
% equations
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs entree
mqb rsi entree
aqs destination
mqb rdi destination
aqs naof-secs
mqb rcx naof-secs
aqs site
mqb rbx site
aqs equations
mqb rdx equations
aqs sret
mqb r13 sret
aqs at
mqb site r8
mov 0 r8 r10
mqb r10 at

mqb entree rsi
mqb destination rdi
mqb at r11
add r11 rdi
mqb naof-secs rcx
mqb equations r11
addc equations com r11
dct r11

mqb site r8
mov 0 r8 r10
mqb naof-secs r11
add r11 r10
mov r10 0 r8
#mov r10 rax
#init
#com

##########################################################################################################
# com-com
##########################################################################################################
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
