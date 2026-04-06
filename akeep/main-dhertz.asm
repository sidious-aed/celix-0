##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
dslr 1e8480
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
aqs equations
mqb r9 equations
aqs views
mqb r10 views

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

entb libc-name /home/tyrel/celix-dst/libc.so.6
mov 1 rdi
lentb libc-name rsi
mov 1f rdx
mov 1 rax
sys

mov 1 rdi
lentb jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# com
##########################################################################################################
aqs i-sim-2
isr 100
lentb i-sim rsi
lqb i-sim-2 rdi
mqb naof-i-sim-secs rcx
mqb equations r11
addc equations com r11
dct r11

mov 1 rdi
lqb i-sim-2 rsi
mov 2a rdx
mov 1 rax
sys

##########################################################################################################
# number-to-entree
##########################################################################################################
aqs general-code
mov aedaed r8
mqb r8 general-code
aqs b16-entree
isr 100
aqs naof-secs

#mov aedaed rdi
mqb general-code rdi
lqb b16-entree rsi
mov 10 rbx
mqb equations r8
addc equations number-to-entree r8
dct r8
mqb rax naof-secs

mov 1 rdi
lqb b16-entree rsi
mqb naof-secs rdx
mov 1 rax
sys

mov 1 rdi
lentb sectioner rsi
mqb naof-sectioner-secs rdx
mov 1 rax
sys

##########################################################################################################
# entre-to-number
##########################################################################################################
aqs b16-number
ent b16-nentree aed27
lentb b16-nentree rsi
mov 5 rcx
mov 10 rbx
mqb equations r12
addc equations entree-to-number r12
dct r12
mqb rax b16-number

aqs b16-number-entree
isr 100
mqb b16-number rdi
lqb b16-number-entree rsi
mov 24 rbx
mqb equations r8
addc equations number-to-entree r8
dct r8
mqb rax naof-secs

aqs clerical-space
isr 200
aqs clerical-space-site
mqb rax clerical-space-site

lqb b16-number-entree rsi
lqb clerical-space rdi
mqb naof-secs rcx
mqb equations r11
addc equations com r11
dct r11
lqb clerical-space rsi
mqb clerical-space-site r8
add r8 rsi
mov a r9
mov r9 0 rsi
add 1 rsi
nao r9
mov r9 0 rsi
add 1 r8
mqb r8 clerical-space-site

mov 1 rdi
lqb clerical-space rsi
mqb clerical-space-site rdx
mov 1 rax
sys

##########################################################################################################
# get-naof-secs
##########################################################################################################
entb russian-breadth talkei talkei. airgo vah nah goo trim bradder.\n
aqs naof-russian-breadth-secs
lentb russian-breadth rdi
mqb equations r15
addc equations get-naof-secs r15
dct r15
mqb rax naof-russian-breadth-secs

mov 1 rdi
lentb russian-breadth rsi
mqb naof-russian-breadth-secs rdx
mov 1 rax
sys
mqb rax naof-russian-breadth-secs

mqb naof-russian-breadth-secs rdi
mqb equations rdi
lqb clerical-space rsi
mov 10 rbx
mqb equations r11
addc equations number-to-entree r11
dct r11
mqb rax clerical-space-site
lqb clerical-space rsi
add rax rsi
mov a r8
movs r8 0 rsi
nao r8
add 1 rsi
movs r8 0 rsi
add 1 rax

mov 1 rdi
lqb clerical-space rsi
mov rax rdx
mov 1 rax
sys

mqb naof-russian-breadth-secs rdi
mqb views rdi
lqb clerical-space rsi
mov 10 rbx
mqb equations r11
addc equations number-to-entree r11
dct r11
mqb rax clerical-space-site
lqb clerical-space rsi
add rax rsi
mov a r8
movs r8 0 rsi
nao r8
add 1 rsi
movs r8 0 rsi
add 1 rax

mov 1 rdi
lqb clerical-space rsi
mov rax rdx
mov 1 rax
sys

##########################################################################################################
# view-number
##########################################################################################################
entb relay0 number
lentb relay0 rsi
mov aedaed rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# view-space
##########################################################################################################
entb rview-space view-space\n
entb rspace space
mov 1 rdi
lentb rview-space rsi
mov b rdx
mov 1 rax
sys

aqs space0
isr 18
lqb space0 r9
mov aedaed r8
mov r8 0 r9
mov aed r8
mov r8 8 r9
mov aedaedaed r8
mov r8 10 r9

lentb rspace rsi
lqb space0 rdi
mov 20 rcx
mov 10 rbx
nao r10
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

lentb rspace rsi
lqb space0 rdi
mov 20 rcx
mov a rbx
nao r10
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

lentb rspace rsi
lqb space0 rdi
mov 20 rcx
mov 24 rbx
nao r10
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11
#init
#com

##########################################################################################################
# compair-space
##########################################################################################################
entb rcompair-spaces compair-spaces
entb cent00 i sim.\n
entb cent01 i sim.\n
lentb cent00 rdi
mov 7 rdx
lentb cent01 rsi
mov 7 rcx
mqb equations r11
addc equations compair-spaces r11
dct r11

lentb rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb cent10 x sim.\n
entb cent11 g sim.\n
lentb cent10 rdi
mov 7 rdx
lentb cent11 rsi
mov 7 rcx
mqb equations r11
addc equations compair-spaces r11
dct r11

lentb rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lentb cent00 rdi
mov 6 rdx
lentb cent01 rsi
mov 7 rcx
mqb equations r11
addc equations compair-spaces r11
dct r11

lentb rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb cent20 talkei talkei. airgo vah nah goo trim brader.\n
entb cent21 talkei talkei. airgo vah nah goo trim brader.\n
lentb cent20 rdi
mov 2e rdx
lentb cent21 rsi
mov 2e rcx
mqb equations r11
addc equations compair-spaces r11
dct r11

lentb rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# seek-space
##########################################################################################################
entb space1 talkei talkei. airgo vah nah goo trim brader.\n
aqs naof-space1-secs
mov 2e r8
mqb r8 naof-space1-secs
entb seek1 airgo
aqs naof-seek1-secs
mov 5 r8
mqb r8 naof-seek1-secs

mov 1 rdi
lent space1 rsi
mqb naof-space1-secs rdx
mov 1 rax
#sys

aqs naof-seeks
aqs seek-site
lentb space1 rdi
mqb naof-space1-secs rdx
lentb seek1 rsi
mqb naof-seek1-secs rcx
mqb equations r11
addc equations seek-space r11
dct r11
mqb r10 naof-seeks
mqb rax seek-site

entb rnaof-seeks naof-seeks
lentb rnaof-seeks rsi
mqb naof-seeks rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb rseek-site seek-site
lentb rseek-site rsi
mqb seek-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb libc-name0 /home/tyrel/celix-dst/libc.so.6
entb libc-name1 /home/tyrel/celix-dst/libc.so.6
aqs naof-libc-name-secs
mov 1f r8
mqb r8 naof-libc-name-secs

lentb libc-name0 rdi
mqb naof-libc-name-secs rdx
lentb libc-name0 rsi
mqb naof-libc-name-secs rcx
mqb equations r11
addc equations seek-space r11
dct r11
mqb rax seek-site

lentb rseek-site rsi
mqb seek-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# cr
##########################################################################################################
entb rrule rule
aqs rule

# anonomous-mmap
nao rdi
mov 3d0910 rsi
mov 7 rdx
mov 22 r10
nao r9
nao r8
mov 9 rax
sys

lentb rrule rsi
mov rax rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11
mqb rax rule

#nao rbx
nao rax
mov 1 rbx
mqb equations r11
addc equations cr r11
dct r11
mqb rax rule

lentb rrule rsi
mqb rule rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

aqs large-space
isr 20000

lentb rrule rsi
mqb rule rdi
mov 8 rdi rcx
#lqb large-space rdi
mov 10000 rcx
mov 10 rbx
mov aed r11
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11
#init
#com

##########################################################################################################
# com
##########################################################################################################
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
