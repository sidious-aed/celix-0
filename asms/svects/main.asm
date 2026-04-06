##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1e8480 rsp
dslr 1e8480
aqs equations
mqb r9 equations
aqs views
mqb r10 views
aqs svects
mqb r11 svects

entb sectioner \n
entb jsect \n
aqs naof-sectioner-secs
mov 1 r8
mqb r8 naof-sectioner-secs
entb i-sim talkei talkei. i sim. ka tic boo tic but.\n
aqs naof-i-sim-secs
mov 2a r8
mqb r8 naof-i-sim-secs

mov 1 rdi
lentb i-sim rsi
mqb naof-i-sim-secs rdx
mov 1 rax
sys

##########################################################################################################
# svects
# csv
##########################################################################################################
aqs svipsm
aqs ms
aqs ms0

mov 10 rdi
mov 2 rsi
mqb svects r11
addv svects csv r11
dct r11
mqb rax svipsm

entb rsvipsm svipsm
lentb rsvipsm rsi
mqb svipsm rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

# rsi | relay
# rdi | space
# rcx | naof-secs
# rbx | base
# r10 | is-board
# rdx | equations
aqs svbreadth
lentb rsvipsm rsi
lentb rsvipsm rdi
mov 10 rcx
mov a rbx
nao r10
mqb equations rdx
mqb views r11
addc views view-space r11
#dct r11

##########################################################################################################
# com
##########################################################################################################
add 1e8480 rsp
pop rbp
ret

#init
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
lq b16-number rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com

#init
aqs time-secs
nao r8
mqb r8 time-secs
aqs time-micro-secs
mov aed r8
mqb r8 time-micro-secs
s task0-init
# nanosleep
lqb time-seconds rdi
mov 23 rax
sys
st jmp task0-init
s task0-com
#com
