##########################################################################################################
# genseed
##########################################################################################################
% equations
% vecters
% views
% clerk
% libc
dslr 1e8480
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs equations
mqb r9 equations
aqs views
mqb r10 views
aqs clerk
mqb r11 clerk
aqs naof-secs
mqb r12 naof-secs
aqs file-name
mqb r13 file-name
aqs naof-file-name-secs
entb jsect \n

entb rnaof-secs naof-secs
lentb rnaof-secs rsi
mqb naof-secs rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

mqb file-name rdi
mqb equations r15
addc equations get-naof-secs r15
dct r15
mqb rax naof-file-name-secs

mov 1 rdi
mqb file-name rsi
mqb naof-file-name-secs rdx
mov 1 rax
sys

mov 1 rdi
lentb jsect rsi
mov 1 rdx
mov 1 rax
sys

aqs libc-site
mqb equations rdx
mqb vecters rbx
mqb views r12
mqb clerk r11
addc clerk get-libc-site r11
dct r11
mqb rax libc-site

entb rlibc-site libc-site
lentb rlibc-site rsi
mqb libc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# obtain-genseed
##########################################################################################################
entb seedfn /dev/random
aqs drf
# open-read
nao rsi
lentb seedfn rdi
mov 2 rax
sys
mqb rax drf

entb rdrf drf
lentb rdrf rsi
mqb libc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lqb equations rdi
aqs sseed
mqb naof-secs rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax sseed

# read
mqb drf rdi
mqb naof-secs rdx
mqb sseed rsi
mov 0 rax
sys

entb rsseed sseed
lentb rsseed rsi
mqb sseed rdi
mqb naof-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

##########################################################################################################
# stage-genseed
##########################################################################################################
# unlink
mq file-name rdi
mov 57 rax
sys

##########################################################################################################
# write-genseed
##########################################################################################################
aqs file
# open-write
mov 1f8 rdx
mov 41 rsi
mqb file-name rdi
mov 2 rax
sys
mqb rax file

# write
mqb file rdi
mqb naof-secs rdx
mqb sseed rsi
mov 1 rax
sys

# close
mqb file rdi
mov 3 rax
sys
#com

# close
mqb drf rdi
mov 3 rax
sys

##########################################################################################################
# com
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
lq b16-number rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
