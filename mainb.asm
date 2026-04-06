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
aqs space0
isr 18
lqb space0 r9
mov aedaed r8
mov r8 0 r9
mov aed r8
mov r8 8 r9
mov aedaedaed r8
mov r8 10 r9

entb nao-relay space
lentb nao-relay rsi
lqb space0 rdi
mov 18 rcx
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-space r11
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

#init
##########################################################################################################
# naof-grid-secs
##########################################################################################################
aqs grid
isr 10
nao r9
mqb r9 grid

aqs entrea01
lqb grid rdi
mov 100 rsi
#mov 989680 rsi
mqb equations r11
addc equations naof-grid-secs r11
dct r11
mqb rax entrea01

entb relay1 grid0-site
lentb relay1 rsi
mqb entrea01 rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lentb i-sim rsi
mqb entrea01 rdi
mqb naof-i-sim-secs rcx
mqb equations r11
addc equations com r11
dct r11

mov 1 rdi
mqb entrea01 rsi
mov 2a rdx
mov 1 rax
sys

##########################################################################################################
# grid-expansion
##########################################################################################################
ent grid-i-sim talkei talkei. airgo vah nah goo trim brader.\n
aqs naof-grid-i-sim-secs
mov 2e r8
mq r8 naof-grid-i-sim-secs
aqs esite
nao r8
mq r8 esite
aqs current-memo
aqs init-current-memo
mqb r8 init-current-memo

entb i-sim-22 i sim.\n
mov 1 rdi
lentb i-sim-22 rsi
mov 7 rdx
mov 1 rax
sys

s grid-expansion-init
	mq esite r8
	cmp 67 r8
	st je grid-expansion-com
	lq grid rdi
	mov 2710 rsi
	mq equations r11
	addc equations naof-grid-secs r11
	dct r11
	mq rax current-memo

	mq init-current-memo r8
	cmp 0 r8
	st jne initcm-com
	mq rax init-current-memo
	s initcm-com

	lent grid-i-sim rsi
	mq current-memo rdi
	mq naof-grid-i-sim-secs rcx
	mq equations r11
	addc equations com r11
	dct r11

	mov 1 rdi
	mq current-memo rsi
	mq naof-grid-i-sim-secs rdx
	mov 1 rax
	#sys

	mq esite r8
	add 1 r8
	mq r8 esite
	st jmp grid-expansion-init
s grid-expansion-com

ent grid-relay grid
lent grid-relay rsi
mq grid rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent grid-at-relay grid-at
lent grid-at-relay rsi
lq grid rdi
mov 8 rdi rdi
#mov aedaed rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent grid-breadth-relay grid-breadth
lent grid-breadth-relay rsi
lq grid rdi
mov 10 rdi rdi
#mov aedaed rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq init-current-memo rsi
mq naof-grid-i-sim-secs rdx
mov 1 rax
sys

mq equations r11
addc equations task r11
dct r11
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
