##########################################################################################################
# get-libc-site
##########################################################################################################
# rdx | equations
# rbx | vecters
# r12 | views
# r13 | sret
% equations
% vecters
% views
##########################################################################################################
# init
##########################################################################################################
sub 20000 rsp
aqs equations
mq rdx equations
aqs vecters
mq rbx vecters
aqs views
mq r12 views
ent relay0 maps-name-site
ent i-sim i sim.\n
aqs maps-name
isr 200
aqs maps-name-site
nao r8
mq r8 maps-name-site
ent jsec \n
ent libc-name libc.so.6
aqs naof-libc-name-secs
mov 9 r8
mq r8 naof-libc-name-secs

ent cmp0 /proc/
aqs naof-cmp0-secs
mov 6 r8
mq r8 naof-cmp0-secs

ent cmp1 /maps
aqs naof-cmp1-secs
mov 5 r8
mq r8 naof-cmp1-secs

aqs pid
mov 27 rax
sys
mq rax pid

mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
#sys

lent cmp0 rsi
lq maps-name rdi
mq naof-cmp0-secs rcx
mq equations r11
addc equations com r11
dct r11
mq maps-name-site r8
add rax r8
mq r8 maps-name-site

ent relay0 maps-name-site
lent relay0 rsi
mq maps-name-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

nao rax
mq pid rdi
lq maps-name rsi
mq maps-name-site r8
add r8 rsi
mov a rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq maps-name-site r8
add rax r8
mq r8 maps-name-site

lent cmp1 rsi
lq maps-name rdi
mq maps-name-site r8
add r8 rdi
mq naof-cmp1-secs rcx
mq equations r11
addc equations com r11
dct r11
mq maps-name-site r8
add rax r8
mq r8 maps-name-site

mov 1 rdi
lq maps-name rsi
mq maps-name-site rdx
mov 1 rax
sys

ent nao-relay \nspace
lent nao-relay rsi
lq maps-name rdi
mq maps-name-site rcx
mov 10 rbx
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent jedao-sectioner \n
mov 1 rdi
lent jedao-sectioner rsi
mov 1 rdx
mov 1 rax
sys

mq equations r11
addc equations task r11
#dct r11

aqs file
# open-read
nao rsi
lq maps-name rdi
mov 2 rax
sys
mq rax file
# <--> | seems proc has stagings of ratches. seems we must, in one read, read to our space.
#                         <--> seems they want to president they understand stagings for this.
aqs maps
isr 10000
aqs maps-site
# read
mq file rdi
mov 10000 rdx
lq maps rsi
mov 0 rax
sys
mq rax maps-site
# close
mq file rdi
mov 3 rax
sys

mov 1 rdi
lq maps rsi
mq maps-site rdx
mov 1 rax
sys

ent fn droid/clerk-com.secs
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
lq maps-site rsi
mov 1 rax
sys

aqs msite
aqs omsite
nao r8
mq r8 msite
aqs sec-site
mq r8 sec-site
aqs name
aqs naof-name-secs
aqs origin

s seek-libc-init

mq msite r8
mq r8 omsite
mq maps-site r9
secs 90 90 90
cmp r9 r8
st jae seek-libc-com

mq omsite r8
lq maps rdi
add r8 rdi
mq maps-site rdx
#sub r8 rdx
lent jsec rsi
mov 1 rcx
mq equations r11
addc equations seek-space r11
dct r11
mq rax sec-site

mq sec-site rax
cmp 0 rax
st jle seek-libc-com
#init
mq maps-site r9
cmp r9 rax
st jb is-above-com
mov r9 rax
sub 100 rax
s is-above-com
#com
mq rax sec-site
mq msite r8
add rax r8
add 1 r8
mq r8 msite

# write
mq file rdi
mov 8 rdx
lq sec-site rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq msite rsi
mov 1 rax
sys

mov 1 rdi
lq maps rsi
mq omsite r8
add r8 rsi
mq sec-site rdx
mov 1 rax
sys

mov 1 rdi
lent jedao-sectioner rsi
mov 1 rdx
mov 1 rax
sys


st jmp seek-libc-init
s seek-libc-com
#init
#com

# write
mq file rdi
mov 8 rdx
lq maps-site rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq msite rsi
mov 1 rax
sys

# close
mq file rdi
mov 3 rax
sys

##########################################################################################################
# com-com
##########################################################################################################
add 20000 rsp
ret

#init
aqs sampler
mqb rbp sampler
ent fn droid/clerk-com.secs
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
lqb naof-secs rdx
mqb entree rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
