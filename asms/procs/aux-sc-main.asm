##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% cf
% sc
##########################################################################################################
# init
##########################################################################################################
#sub 4c4b40 rsp
aqs bdom0
aqs this
aqs equations
aqs views
aqs cf
aqs sc
aqs strstr
ent i-sim i sim.\n
ent jsect \n

mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

ent rstrstr strstr
lent rstrstr rsi
mq strstr rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

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
mov 10 rcx
mov 10 rbx
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
#dct r11
#mq rax libc-space

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

# <--> | might be bizzarly to do with the mmaps for a bin.
mq libc-space-0 rsi
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

lent rlibcs rsi
mq libc-space-0 rdi
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
ent sr01-name sirbashanickzim0
ent sr01-age 3c

##############################
#
# shianeckarecky-1
# ----------------
# name | sirbgladiminmarch
# age | 75
#
##############################
ent sr1-name sirbgladiminmarch
ent sr1-age 75
ent sr10-name sirbgladiminoom

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

mq chart rdi
lent kname rcx
mov 4 r10
lent sr01-name rsi
mov 10 r11
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
lent sr01-age rsi
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
lent sr10-name rsi
mov f r11
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
# altc | aon alterations to chart records
##########################################################################################################
lent chart-name rdi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ic r11
dct r11

aqs achart
mq ochart r8
mq r8 achart
aqs ci
isr 18

lent chart-name rdi
lq ci rsi
mq equations rdx
mq sc r11
addc sc snap r11
dct r11

ent rci ci
lent rci rsi
lq ci rdi
mov 20 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

aqs lchart
aqs lchart-site
lq ci r8
mov 0 r8 rsi
mq rsi lchart
mov 8 r8 rcx
mq rcx lchart-site

ent rlchart lchart
lent rlchart rsi
mq lchart rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq lchart rsi
mq lchart-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys

aqs record
isr 10000
aqs record-site

aqs mrec
mov 1 rdi
mov 10000 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax mrec

ent skey name
ent svalue sirbashanickzim0

lq ci rdi
lent skey rcx
lent svalue rsi
nao r13
mq strstr r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ssc r11
dct r11
mq rax record-site
mq rbx csite

ent rrecord-site record-site
lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
mov 1 rdi
lq record rsi
mq record-site rdx
add 1 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys

ent rmrec mrec
lent rmrec rsi
mq mrec rdi
mov 18 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

ent kaux-name aux-name
ent svaux-name shreck-nom-glen-idad
lq cs r10
lq record r15
mq mrec r8
lent kaux-name rsi
#lent kname rsi
mov 8 rcx
lent svaux-name rdi
mov 14 rdx
mq equations r14
mq views r13
mq cf r12
mq sc r11
addc sc modc r11
dct r11
mq rax record-site
mq rbx mrec

lent rmrec rsi
mq mrec rdi
mov 18 rcx
mov 0 rdi r8
add r8 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mov 1 rdi
mq mrec rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# updates
##########################################################################################################

aqs naof-update-secs
mov 10 r8
mq naof-update-secs
aqs updates
mov 10 rdi
mov 2000 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax updates

aqs update-record-c0
aqs update-record-c1
mq mrec rsi
mov 0 rsi r8
mq r8 update-record-c1
add 18 rsi
mq rsi update-record-c0

mq updates rdi
lq update-record-c0 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf avec r11
dct r11
mq rax updates

ent rupdates updates
lent rupdates rsi
mq updates rdi
mov 28 rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mov 1 rdi
mq updates rsi
add 18 rsi
mov 8 rsi rdx
mov 0 rsi rsi
mov 1 rax
sys

lq ci rdi
lent skey rcx
lent svalue rsi
#lent sr0-name rsi
mq updates r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ufsc r11
dct r11
mq rax record-site

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
lq record rsi
mq record-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# sort
##########################################################################################################
ent rsort sort\n
mov 1 rdi
lent rsort rsi
mov 5 rdx
mov 1 rax
sys
mov 1 rdi
lq ci r8
mov 0 r8 rsi
mov 8 r8 rdx
mov 1 rax
sys
aqs cquad
aqs wci
isr 18
aqs getc
mq strstr r8
sub baa70 r8
add 87ea0 r8
mq r8 getc

aqs sv
mov 8 rdi
mov 200 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax sv

aqs nv
mov 1 rdi
mov 2000 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax nv

ent rsv sv
lent rsv rsi
mq sv rdi
mov 0 rdi rcx
factq sv-naof-esecs rcx
add 18 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

lent rsv rsi
mq sv rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lq ci rdi
lent kage rsi
#lent kname rsi
lq wci r13
mq sv r14
mq nv rcx
lq cs r9
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc sortc r11
dct r11
mq rax sv
mq rbx nv

mov 1 rdi
lq wci rsi
mov 8 rsi rdx
mov 0 rsi rsi
mov 1 rax
sys

ent rwci wci
lent rwci rsi
lq wci rdi
mov 20 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent rwcidx wcidn
lent rwcidx rsi
lq wci r8
mov 10 r8 rdi
mov 18 r8 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent rwci-chart wci-chart
lent rwci-chart rsi
lq wci rdi
mov 8 rdi rcx
mov 0 rdi rdi
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

lq cquad rdi
mq getc r11
#dct r11

lq ci rdi
mq sc r11
addc sc libc r11
#dct r11

lq wci rdi
mq sc r11
addc sc libc r11
#dct r11

lq cquad rdi
mq getc r11
#dct r11

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# view-chart
##########################################################################################################
#ent rshianeckeireckeis shianeckeireckeis
ent rshianeckeireckeis shianeckareckies
ent rview-chart view-chart\n
mov 1 rdi
lent rview-chart rsi
mov b rdx
mov 1 rax
sys
mov 1 rdi
lq wci r8
mov 0 r8 rsi
mov 8 r8 rdx
mov 1 rax
#sys

# scv | scopes-vecter
aqs scv
mov 18 rdi
mov 200 rsi
lq cs rbx
mq equations rdx
mq cf r11
addc cf cvec r11
dct r11
mq rax scv

ent rscv scv
lent rscv rsi
mq scv rdi
mov 18 rcx
mov 0 rdi r8
factq scv-naof-esecs r8
add r8 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mov 1 rdi
lq wci rsi
mov 8 rsi rdx
mov 0 rsi rsi
mov 1 rax
#sys

lq wci rdi
lent rshianeckeireckeis rsi
mq scv r14
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc vc r11
dct r11
mq rax scv

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

#init
##########################################################################################################
# view wider chart sort by arith-alph
##########################################################################################################
ent rview-wider-charts-with-sc-aa view wider charts with sc arith-alpha\n
mov 1 rdi
lent rview-wider-charts-with-sc-aa rsi
mov 26 rdx
mov 1 rax
sys

aqs mf-binci
isr 18
ent mf-binn bin/mf.bc
aqs mf-sbinci
isr 18

lent mf-binn rdi
lq mf-binci rsi
mq equations rdx
mq sc r11
addc sc snap r11
dct r11

ent rmf-binci mf-binci
lent rmf-binci rsi
lq mf-binci rdi
mov 20 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent kalu-mod alu-mod
ent kdestination destination
lq mf-binci rdi
lent kdestination rsi
lq mf-sbinci r13
mq sv r14
mq nv rcx
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc sortc-aa r11
dct r11
mq rax sv
mq rbx nv

ent rwindex windex
lent rwindex rsi
lq mf-binci rdi
mov 18 rdi rcx
mov 10 rdi rdi
mov 0 rdi r8
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

ent rmf-bin mf-bin
lq mf-sbinci rdi
lent rmf-bin rsi
mq scv r14
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc vc r11
dct r11
mq rax scv

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# view wider chart sort by alpha
##########################################################################################################
ent rview-wider-charts-with-sc view wider charts with sc alpha\n
mov 1 rdi
lent rview-wider-charts-with-sc rsi
mov 20 rdx
mov 1 rax
sys

ent kdname dname
lq mf-binci rdi
#lent kalu-mod rsi
lent kdname rsi
lq mf-sbinci r13
mq sv r14
mq nv rcx
mq scv r9
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc sortc r11
dct r11
mq rax sv
mq rbx nv

lent rwindex rsi
lq mf-binci rdi
mov 18 rdi rcx
mov 10 rdi rdi
mov 0 rdi r8
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

lent rcs rsi
lq cs rdi
mov 10 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

mov 1 rdi
lq mf-sbinci rsi
mov 8 rsi rdx
mov 0 rsi rsi
mov 1 rax
#sys

ent rmf-sbin mf-sbin
lq mf-sbinci rdi
lent rmf-sbin rsi
mq scv r14
lq cs r15
mq equations rdx
mq views rbx
mq cf r12
mq sc r11
addc sc vc r11
dct r11
mq rax scv

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

lent rcs rsi
lq cs rdi
mov 10 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
#dct r11

##########################################################################################################
# filters
##########################################################################################################
ent rfilters filters\n
mov 1 rdi
lent rfilters rsi
mov 8 rdx
mov 1 rax
sys
mov 1 rdi
lq ci r8
mov 0 r8 rsi
mov 8 r8 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com
##########################################################################################################
# com
##########################################################################################################
#add 4c4b40 rsp
ret

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
mov 200 rdx
lq bdom0 rsi
mov 1 rax
sys
# close
mq file rdi
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

#mov 18 rdi
#mov 200 rsi
#lq cs rbx
#mq equations rdx
#mq cf r11
#addc cf cvec r11
#dct r11
#mq rax scv
#init
mq scv r8
mov 18 r9
mov r9 8 r8
mov 200 r9
mov r9 10 r8
#com
