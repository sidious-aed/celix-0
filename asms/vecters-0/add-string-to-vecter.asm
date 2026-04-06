##########################################################################################################
# com
##########################################################################################################
# rdi | v
# rsi | string
# rcx | naof-string-secs
# rdx | equations
# rbx | libc
% equations
% libc
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs v
mqb rdi v
aqs string
mqb rsi string
aqs naof-string-secs
mqb rcx naof-string-secs
aqs equations
mqb rdx equations
aqs libc-site
mqb rbx libc-site
aqs naof-esecs
mov 1 r8
mqb r8 naof-esecs
aqs breadth
mov 8 rdi r8
mqb r8 breadth
aqs site
mov 10 rdi r8
mqb r8 site
aqs ometa
nao r8
mqb r8 ometa
aqs expansionf
mov 2 r8
mqb r8 expansionf

##########################################################################################################
# expansion
##########################################################################################################
entb rexpansion expanding string.\n

mqb site r8
mqb naof-string-secs r9
add r9 r8
mqb breadth r10
cmp r8 r10
st ja expansion-com

mov 1 rdi
lentb rexpansion rsi
mov 12 rdx
mov 1 rax
sys

mqb breadth r9
factqb expansionf r9
mqb naof-string-secs r8
add r8 r9
mqb r9 breadth

mqb breadth rdi
add 19 rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11

mqb v rsi
mov rax rdi
mqb rax v
mqb site rcx
add 18 rcx
mqb equations r11
addc equations com r11
dct r11

mqb v r8
mqb breadth r11
mov r11 8 r8
#init
#com
s expansion-com

##########################################################################################################
# add-to-vecter
##########################################################################################################
aqs at
mqb site r8
add 18 r8
mqb r8 at

mqb string rsi
mqb v rdi
mqb at r8
add r8 rdi
mqb naof-string-secs rcx
mqb equations r11
addc equations com r11
dct r11

##########################################################################################################
# vmeta
##########################################################################################################
mqb v r8
mov 10 r8 r9
mqb naof-string-secs r10
add r10 r9
mov r9 10 r8
mqb r9 ometa
mqb r9 site

##########################################################################################################
# naoify-com
##########################################################################################################
mqb v rsi
mqb site r8
add r8 rsi
add 18 rsi
nao r9
movs r9 0 rsi

##########################################################################################################
# com
##########################################################################################################
mqb v rax
mqb ometa rbx
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
