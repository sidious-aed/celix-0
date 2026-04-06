##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
##########################################################################################################
# init
##########################################################################################################
#sub 4c4b40 rsp
aqs bdom
aqs this
aqs equations
aqs views

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
mov 20 rdx
lq bdom rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys

ent sectioner \n
ent jsect \n
aqs naof-sectioner-secs
mov 1 r8
mq r8 naof-sectioner-secs
ent i-sim talkei talkei. i sim. ka tic boo tic but.\n
aqs naof-i-sim-secs
mov 2a r8
mq r8 naof-i-sim-secs

mov 1 rdi
lent i-sim rsi
mq naof-i-sim-secs rdx
mov 1 rax
sys

ent libc-name /home/tyrel/celix-dst/libc.so.6
mov 1 rdi
lent libc-name rsi
mov 1f rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# com
##########################################################################################################
aqs i-sim-2
isr 100
lent i-sim rsi
lq i-sim-2 rdi
mq naof-i-sim-secs rcx
mq equations r11
addc equations com r11
dct r11

mov 1 rdi
lq i-sim-2 rsi
mov 2a rdx
mov 1 rax
sys

##########################################################################################################
# number-to-entree
##########################################################################################################
aqs general-code
mov aedaed r8
mq r8 general-code
aqs b16-entree
isr 100
aqs naof-secs

#mov aedaed rdi
mq general-code rdi
lq b16-entree rsi
mov 10 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq rax naof-secs

mov 1 rdi
lq b16-entree rsi
mq naof-secs rdx
mov 1 rax
sys

mov 1 rdi
lent sectioner rsi
mq naof-sectioner-secs rdx
mov 1 rax
sys

##########################################################################################################
# entre-to-number
##########################################################################################################
aqs b16-number
ent b16-nentree aed27
lent b16-nentree rsi
mov 5 rcx
mov 10 rbx
mq equations r12
addc equations entree-to-number r12
dct r12
mq rax b16-number

aqs b16-number-entree
isr 100
mq b16-number rdi
lq b16-number-entree rsi
mov 24 rbx
mq equations r8
addc equations number-to-entree r8
dct r8
mq rax naof-secs

aqs clerical-space
isr 200
aqs clerical-space-site
mq rax clerical-space-site

lq b16-number-entree rsi
lq clerical-space rdi
mq naof-secs rcx
mq equations r11
addc equations com r11
dct r11
lq clerical-space rsi
mq clerical-space-site r8
add r8 rsi
mov a r9
mov r9 0 rsi
add 1 rsi
nao r9
mov r9 0 rsi
add 1 r8
mq r8 clerical-space-site

mov 1 rdi
lq clerical-space rsi
mq clerical-space-site rdx
mov 1 rax
sys

##########################################################################################################
# get-naof-secs
##########################################################################################################
ent russian-breadth talkei talkei. airgo vah nah goo trim bradder.\n
aqs naof-russian-breadth-secs
lent russian-breadth rdi
mq equations r15
addc equations get-naof-secs r15
dct r15
mq rax naof-russian-breadth-secs

mov 1 rdi
lent russian-breadth rsi
mqb naof-russian-breadth-secs rdx
mov 1 rax
sys
mq rax naof-russian-breadth-secs

mq naof-russian-breadth-secs rdi
mq equations rdi
lq clerical-space rsi
mov 10 rbx
mq equations r11
addc equations number-to-entree r11
dct r11
mq rax clerical-space-site
lq clerical-space rsi
add rax rsi
mov a r8
movs r8 0 rsi
nao r8
add 1 rsi
movs r8 0 rsi
add 1 rax

mov 1 rdi
lq clerical-space rsi
mov rax rdx
mov 1 rax
sys

mq naof-russian-breadth-secs rdi
mq views rdi
lq clerical-space rsi
mov 10 rbx
mq equations r11
addc equations number-to-entree r11
dct r11
mq rax clerical-space-site
lq clerical-space rsi
add rax rsi
mov a r8
movs r8 0 rsi
nao r8
add 1 rsi
movs r8 0 rsi
add 1 rax

mov 1 rdi
lq clerical-space rsi
mov rax rdx
mov 1 rax
sys

##########################################################################################################
# view-number
##########################################################################################################
ent relay0 number
lent relay0 rsi
mov aedaed rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

##########################################################################################################
# view-space
##########################################################################################################
ent rview-space view-space\n
ent rspace space
mov 1 rdi
lent rview-space rsi
mov b rdx
mov 1 rax
sys

aqs space0
isr 18
lq space0 r9
mov aedaed r8
mov r8 0 r9
mov aed r8
mov r8 8 r9
mov aedaedaed r8
mov r8 10 r9

lent rspace rsi
lq space0 rdi
mov 20 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

lent rspace rsi
lq space0 rdi
mov 20 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

lent rspace rsi
lq space0 rdi
mov 20 rcx
mov 24 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

##########################################################################################################
# compair-spaces
##########################################################################################################
ent rcompair-spaces compair-spaces
ent cent00 i sim.\n
ent cent01 i sim.\n
lent cent00 rdi
mov 7 rdx
lent cent01 rsi
mov 7 rcx
mq equations r11
addc equations compair-spaces r11
dct r11

lent rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent cent10 x sim.\n
ent cent11 g sim.\n
lent cent10 rdi
mov 7 rdx
lent cent11 rsi
mov 7 rcx
mq equations r11
addc equations compair-spaces r11
dct r11

lent rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent cent00 rdi
mov 6 rdx
lent cent01 rsi
mov 7 rcx
mq equations r11
addc equations compair-spaces r11
dct r11

lent rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent cent20 talkei talkei. airgo vah nah goo trim brader.\n
ent cent21 talkei talkei. airgo vah nah goo trim brader.\n
lent cent20 rdi
mov 2e rdx
lent cent21 rsi
mov 2e rcx
mq equations r11
addc equations compair-spaces r11
dct r11

lent rcompair-spaces rsi
mov rax rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

##########################################################################################################
# seek-space
##########################################################################################################
ent space1 talkei talkei. airgo vah nah goo trim brader.\n
aqs naof-space1-secs
mov 2e r8
mq r8 naof-space1-secs
#init
ent seek1 airgo
aqs naof-seek1-secs
mov 5 r8
mq r8 naof-seek1-secs
#com
ent seek1 ah goo trim br
aqs naof-seek1-secs
mov e r8
mq r8 naof-seek1-secs
mov 1 rdi
lent space1 rsi
mq naof-space1-secs rdx
mov 1 rax
#sys

#aqs naof-seeks
aqs seek-site
lent space1 rdi
mq naof-space1-secs rdx
lent seek1 rsi
mq naof-seek1-secs rcx
mq equations r11
addc equations seek-space r11
dct r11
mq rax seek-site

ent rseek-site seek-site
lent rseek-site rsi
mq seek-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent libc-name0 /home/tyrel/celix-dst/libc.so.6
ent libc-name1 /home/tyrel/celix-dst/libc.so.6
aqs naof-libc-name-secs
mov 1f r8
mq r8 naof-libc-name-secs

lent libc-name0 rdi
mq naof-libc-name-secs rdx
lent libc-name0 rsi
mq naof-libc-name-secs rcx
mq equations r11
addc equations seek-space r11
dct r11
mq rax seek-site

lent rseek-site rsi
mq seek-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#init
#com

ent cname charts/shianeckareckeis.chart
aqs crs
isr 100
aqs cf
# open-read
nao rsi
lent cname rdi
mov 2 rax
sys
mq rax cf
# read
mq cf rdi
mov 100 rdx
lqcrsrsi
mov 0 rax
sys
lq crs rdi
mov rax rdx
lent jsect rsi
mov 1 rcx
mq equations r11
addc equations seek-space r11
dct r11
lent rseek-site rsi
mov rax rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
# close
mq cf rdi
mov 3 rax
sys

##########################################################################################################
# cr
##########################################################################################################
ent rstack-site stack-site
ent rcodea codea
ent rcs cs
aqs cs
isr 3d0908
lq cs rdi
nao r8
#mov f4220 r8
mov r8 0 rdi
mov 3d0900 r8
mov r8 8 rdi
aqs codea
mov aedaed r8
mq r8 codea
lq cs rsi
mov aed r8
mov r8 f4240 rsi

lent rcodea rsi
mq codea rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rcs rsi
lq cs rdi
mov 20 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

aqs memo0
lq cs rdi
mov 100 rsi
mq equations r11
addc equations cr r11
dct r11
mq rax memo0

lent rstack-site rsi
mq memo0 rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs memo1
lq cs rdi
mov 100 rsi
mq equations r11
addc equations cr r11
dct r11
mq rax memo1

lent rstack-site rsi
mq memo1 rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent space1 rsi
mq memo0 rdi
mov 2e rcx
mq equations r11
addc equations com r11
dct r11

lent space1 rsi
mq memo1 rdi
mov 2e rcx
mq equations r11
addc equations com r11
dct r11

lent rcs rsi
lq cs rdi
mov 210 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

##########################################################################################################
# view-wide-space
##########################################################################################################
ent rlibcs libcs

aqs libc-space
lq cs rdi
mov 1efd50 rsi
#mov 800 rsi
mq equations r11
addc equations cr r11
dct r11
mq rax libc-space

#init
mq libc-space rdi
mov 3dfaa rcx
mov aed rbx
mq equations r11
addc equations seed r11
dct r11

#init
# <--> | seems to do with memory module.
mq libc-space rsi
mov rsi rdi
add 1efd50 rdi
mov aedaed r9
nao r8
s seed-init
	mov r9 0 rsi
	#mov r8 0 rsi
	add 8 rsi
	cmp rsi rdi
	#add 1 r8
	#st je seed-com
	sst je seed-com
	#st jmp seed-init
	sst jmp seed-init
s seed-com
#com
#init
# <--> | might be bizzarly to do with the mmaps for a bin.
mq libc-space rsi
nao r8
s seed-init
	mov aed r10
	#nao r10
	#mov rsi r8
	mov r8 0 rsi
	#mov r8 0 rsi
	#mov r10 0 rsi
	add 8 rsi
	add 1 r8
	#cmp r8 3dfaa
	cmp r8 500
	st je seed-com
	st jmp seed-init
s seed-com
#com

lent rlibcs rsi
mq libc-space rdi
mov 24 rbx
mov 1efd50 rcx
mov 300 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

##########################################################################################################
# cs-aa
##########################################################################################################
aqs liw
ent rliw liw
#init
ent str0 aed
ent str1 aedaed

lent str0 rdi
mov 3 rdx
lent str1 rsi
mov 6 rcx
mq equations r11
addc equations cs-aa r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent str2 7edaed
lent str1 rdi
mov 6 rdx
lent str2 rsi
mov 6 rcx
mq equations r11
addc equations cs-aa r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent str1 rdi
mov 6 rdx
lent str1 rsi
mov 6 rcx
mq equations r11
addc equations cs-aa r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent str3 sg sg1
ent str4 sg sg2
ent str5 sg vg2
lent str5 rdi
mov 6 rdx
lent str4 rsi
mov 6 rcx
mq equations r11
addc equations cs-aa r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com

##########################################################################################################
# cs
##########################################################################################################
ent aastr0 add
ent aastr1 je

lent aastr0 rdi
mov 3 rdx
lent aastr1 rsi
mov 2 rcx
mq equations r11
addc equations cs r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent aastr4 cmpb
ent aastr5 cmp

lent aastr4 rdi
mov 4 rdx
lent aastr5 rsi
mov 3 rcx
mq equations r11
addc equations cs r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent aastr2 rdi
mov 3 rdx
lent aastr3 rsi
mov 2 rcx
mq equations r11
addc equations cs r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent aastr6 cmpb
ent aastr7 cmpq

lent aastr6 rdi
mov 4 rdx
lent aastr7 rsi
mov 4 rcx
mq equations r11
addc equations cs r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent aastr2 rdi
mov 3 rdx
lent aastr3 rsi
mov 2 rcx
mq equations r11
addc equations cs r11
dct r11
mq rax liw

lent rliw rsi
mq liw rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

##########################################################################################################
# com
##########################################################################################################
#add 4c4b40 rsp
ret

#init
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
