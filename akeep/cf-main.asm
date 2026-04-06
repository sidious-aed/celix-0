##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 4c4b40 rsp
aqs equations
mq r9 equations
aqs views
mq r10 views
aqs cf
mq r11 cf
ent i-sim i sim.\n
ent jsect \n

mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
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
aqs libc-space-0
lq cs rdi
mov 1efd50 rsi
#mov 800 rsi
mq equations r11
addc equations cr r11
dct r11
mq rax libc-space

# anonomous-mmap
nao rdi
mov 2efd50 rsi
mov 7 rdx
mov 22 r10
nao r9
nao r8
mov 9 rax
sys
mq rax libc-space-0

#init
mq libc-space rdi
mov 3dfaa rcx
mov aed rbx
mq equations r11
addc equations seed r11
dct r11
#com

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
	st je seed-com
	#st jmp seed-init
	st jmp seed-init
s seed-com
#com

# <--> | might be bizzarly to do with the mmaps for a bin.
mq libc-space rsi
mov rsi rdi
add 1efd50 rdi
nao r8
s seed1-init
	mov r8 0 rsi
	add 8 rsi
	add 1 r8
	cmp rsi rdi
	st je seed1-com
	st jmp seed1-init
s seed1-com
#init
#com

lent rlibcs rsi
mq libc-space rdi
mov 24 rbx
#mov 1efd50 rcx
mov 300 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

lent rcs rsi
lq cs rdi
mov a rbx
#mov 1efd50 rcx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11
#mq libc-space-0 r8
#mq r8 libc-space
##########################################################################################################
# cvec
##########################################################################################################
ent rcs-site cs-site
ent rvec0 vec0
aqs vec0
mov 10 rdi
mov 2 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax vec0

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

##########################################################################################################
# avec
##########################################################################################################
ent memo0 <--> journey at * a lightning poem\n
aqs memo-ent
lent memo0 rsi
mq rsi memo-ent
aqs memo-site
mov 23 r8
mq r8 memo-site

mq vec0 rdi
lq memo-ent rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf avec r11
dct r11
mq rax vec0

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mq vec0 rdi
lq memo-ent rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf avec r11
dct r11
mq rax vec0

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mq vec0 rdi
lq memo-ent rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf avec r11
dct r11
mq rax vec0

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mq vec0 rdi
lq memo-ent rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf avec r11
dct r11
mq rax vec0

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

##########################################################################################################
# astr
##########################################################################################################
ent rstr0 str0

lent rcs-site rsi
mq cs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs str0
mov 1 rdi
mov 20 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax str0

lent rcs-site rsi
mq cs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rstr0 rsi
mq str0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

lent rvec0 rsi
mq vec0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11
#init
#com

mq str0 rdi
mov 22 rcx
lq cs rbx
mq equations rdx
mq cf r11
addc cf xstr r11
dct r11
mq rax str0

ent d-sim <--> * i sim. ka tic boo tic but.\n
mq str0 rdi
lent d-sim rsi
mov 22 rcx
lq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax str0

lent rstr0 rsi
mq str0 rdi
mov a rbx
mov 100 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

ent d-sim-2 <--> talkei talkei. airgo vah nah goo trim brader.\n
mq str0 rdi
lent d-sim-2 rsi
mov 33 rcx
lq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax str0

mov 1 rdi
mq str0 rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

##########################################################################################################
# charts
##########################################################################################################
ent rchart chart
aqs chart
mov 1 rdi
mov 200 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax chart

lent rchart rsi
mq chart rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent kname name
ent kage age
##############################
#
# shianeckarecky-0
# ----------------
# name | sirbashanick
# age | 38
#
##############################
ent sr0-name sirbashanick
ent sr0-age 38

##############################
#
# shianeckarecky-0
# ----------------
# name | sirbgladiminmarch
# age | 75
#
##############################
ent sr1-name sirbgladiminmarch
ent sr1-age 75

mq chart rdi
lent kname rcx
mov 4 r10
lent sr0-name rsi
mov c r11
nao r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

mq chart rdi
lent kage rcx
mov 3 r10
lent sr0-age rsi
mov 2 r11
mov 1 r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

mq chart rdi
lent kname rcx
mov 4 r10
lent sr1-name rsi
mov 11 r11
nao r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

mq chart rdi
lent kage rcx
mov 3 r10
lent sr1-age rsi
mov 2 r11
mov 1 r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

lent rchart rsi
mq chart rdi
mov a rbx
mov 30 rcx
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mov 1 rdi
mq chart rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

ent chart-name charts/shianeckareckeis.chart
mq chart rdi
lent chart-name rsi
mq cf r11
addc cf sc r11
dct r11

mq chart rsi
nao r9
mov r9 0 rsi

mq chart rdi
lent kname rcx
mov 4 r10
lent sr0-name rsi
mov c r11
nao r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

mq chart rdi
lent kage rcx
mov 3 r10
lent sr0-age rsi
mov 2 r11
mov 1 r12
lq cs rbx
mq equations rdx
mq cf r13
mq cf r14
addc cf atc r14
dct r14
mq rax chart

mov 1 rdi
mq chart rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

mq chart rdi
lent chart-name rsi
mq cf r11
addc cf ac r11
dct r11

##########################################################################################################
# gcharts
##########################################################################################################
ent rnaof-records naof-records
ent rgc gc
ent rmode mode
aqs gc
aqs naof-records
aqs cmode

lent chart-name rdi
mq equations rdx
mq views rbx
mq cf r11
addc cf gc r11
dct r11
mq rax gc
mq rdx naof-records

lent rgc rsi
mq gc rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rnaof-records rsi
mq naof-records rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mq str0 rdi
nao r9
mov r9 0 rdi

mq gc rdi
mov 2 rsi
mq str0 r12
lq cs rbx
mq equations rdx
mq views r13
mq cf r14
mq cf r11
addc cf gcas r11
dct r11
mq rax cmode

lent rmode rsi
mq cmode rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq str0 rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mq str0 rdi
nao r9
mov r9 0 rdi

mq gc rdi
lent kname r9
mov 4 r10
#lent sr0-name rsi
#mov c rcx
lent sr1-name rsi
mov 11 rcx
mq str0 r12
lq cs rbx
mq equations rdx
mq views r13
mq cf r14
mq cf r11
addc cf gcbk r11
dct r11
mq rax cmode

lent rmode rsi
mq cmode rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq str0 rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

# close
mq cf rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
add 4c4b40 rsp
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
