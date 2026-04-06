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
#aqs bdom1
#mq r9 bdom1
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
# strstr
##########################################################################################################
ent vts talkei talkei. airgo vah nah goo trim brader.\n
ent sfvts  trim 

ent rvts vts
lent rvts rsi
lent vts rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs strstr-result
lent sfvts rsi
lent vts rdi
#lent vts rax
mq strstr r11
dct r11
mq rax strstr-result

ent rstrstr-result strstr-result
lent rstrstr-result rsi
mq strstr-result rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq strstr-result rsi
mov e rdx
mov 1 rax
sys

#mq bdom1 r9
#dst r9
##########################################################################################################
# index-chart
##########################################################################################################
ent chart-name charts/shianeckareckeis.chart

lent chart-name rdi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ic r11
dct r11

##########################################################################################################
# seek-chart and get-next
##########################################################################################################
ent skey bs
aqs skey-site
mov 2 r8
mq r8 skey-site
ent svalue 19c5eb
aqs svalue-site
mov 6 r8
mq r8 svalue-site
ent svalue0 21100
aqs svalue-site0
mov 5 r8
mq r8 svalue-site0
ent svalue1 21100ac32
aqs svalue-site1
mov 9 r8
mq r8 svalue-site1
ent ctsn bin/libc.so.6.bc
aqs record
isr 400
aqs record-site
aqs fsite
aqs bmsqs
isr 38
ent srsc sc
ent rrecord-site record-site
ent rfsite fsite
ent hsc-svalue1 sc-svalue1.\n
ent hsname snap.\n
ent hfsc fsc.\n
ent hsc-svalue sc-svalue.\n
ent hgn gn.\n

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
lent hsc-svalue rsi
mov b rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lent ctsn rdi
lent skey rcx
#lent svalue0 rsi
lent svalue rsi
nao r14
mov 36dd44c r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc sc r11
dct r11
mq rax record-site
mq rbx fsite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rfsite rsi
mq fsite rdi
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
lent hgn rsi
mov 4 rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lent ctsn rdi
mq fsite r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc gn r11
dct r11
mq rax record-site
mq rbx fsite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rfsite rsi
mq fsite rdi
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
lent hsc-svalue1 rsi
mov c rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lent ctsn rdi
lent skey rcx
lent svalue1 rsi
nao r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc sc r11
dct r11
mq rax record-site
mq rbx fsite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rfsite rsi
mq fsite rdi
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

##########################################################################################################
# snap, fsc, and fgn
##########################################################################################################
aqs snapci
isr 18
aqs codeaed
mov aed r8
mq r8 codeaed

mov 1 rdi
lent hsname rsi
mov 6 rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lent ctsn rdi
lq snapci rsi
mq equations rdx
mq sc r11
addc sc snap r11
dct r11

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

ent rsnapci snapci
lent rsnapci rsi
lq snapci rdi
mov 28 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

ent rchart-index chart-index
lent rchart-index rsi
lq snapci rdi
mov 10 rdi rdi
mov 28 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

mov 1 rdi
mq snapci rsi
lq snapci rdx
mov 10 rdx rdx
mov 0 rdx rdx
#mov d6 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mq equations r11
addc equations task r11
#dct r11

mov 1 rdi
lent hfsc rsi
mov 5 rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lq snapci rdi
lent skey rcx
#lent svalue0 rsi
lent svalue rsi
#lent svalue1 rsi
nao r14
#mov 36dd419 r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc fsc r11
dct r11
mq rax record-site
mq rbx fsite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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
#sys

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rfsite rsi
mq fsite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs seek-value
aqs seek-value-site
ent sknaof-secs naof-secs
ent sksecs secs
ent skdiemnrugearing diemnrugearing
lq record rdi
mq record-site r15
#lent sknaof-secs rsi
lent sksecs rsi
#lent skdiemnrugearing rsi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc kv r11
dct r11
mq rax seek-value
mq rcx seek-value-site

cmp 0 rcx
st je seek-value-after-fsc-com
mov 1 rdi
mq seek-value rsi
mq seek-value-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
s seek-value-after-fsc-com

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

ent hfgn fgn.\n
mov 1 rdi
lent hfgn rsi
mov 5 rdx
mov 1 rax
sys

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lq snapci rdi
mq fsite r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc fgn r11
dct r11
mq rax record-site
mq rbx fsite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rfsite rsi
mq fsite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent skalu-mod alu-mod
lq record rdi
mq record-site r15
lent skalu-mod rsi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc kv r11
dct r11
mq rax seek-value
mq rcx seek-value-site

mov 1 rdi
mq seek-value rsi
mq seek-value-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# ssc
##########################################################################################################
ent rssc ssc
mov 1 rdi
lent rssc rsi
mov 3 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

aqs csite

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

ent skey0 alu-mod
ent svalue0 movl
lq snapci rdi
lent skey rcx
lent svalue rsi
#lent skey0 rcx
#lent svalue0 rsi
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

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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
#sys

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent rcsite csite
lent rcsite rsi
mq csite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

ent sksection section
lq record rdi
mq record-site r15
lent sksection rsi
#lent sknaof-secs rsi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc kv r11
dct r11
mq rax seek-value
mq rcx seek-value-site

mov 1 rdi
mq seek-value rsi
mq seek-value-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# ossc
##########################################################################################################
ent rossc ossc
mov 1 rdi
lent rossc rsi
mov 4 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

ent seek0 callq
lent rcsite rsi
mq csite rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lq bmsqs rdi
nao rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
dct r11

lq snapci rdi
lent seek0 rsi
mq csite r13
mq strstr r14
lq record r15
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc ossc r11
dct r11
mq rax record-site
mq rbx csite

lq bmsqs rdi
mov 1 rsi
lent srsc rbx
mq equations rdx
mq views rcx
mq cf r11
addc cf stat r11
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
#sys

lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

lent rcsite rsi
mq csite rdi
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

ent skparams params
lq record rdi
mq record-site r15
lent skparams rsi
#lent sknaof-secs rsi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc kv r11
dct r11
mq rax seek-value
mq rcx seek-value-site

mov 1 rdi
mq seek-value rsi
mq seek-value-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# b16-secs-to-secs
##########################################################################################################
ent rjb16-secs-to-secs b16-secs-to-secs\n
mov 1 rdi
lent rjb16-secs-to-secs rsi
mov 11 rdx
mov 1 rax
sys

lq record rdi
mq record-site r15
lent sksecs rsi
mq equations rdx
mq cf rbx
mq views r12
mq sc r11
addc sc kv r11
dct r11
mq rax seek-value
mq rcx seek-value-site

mov 1 rdi
mq seek-value rsi
mq seek-value-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

aqs secs-space
isr 400
aqs secs-space-site
mq seek-value rsi
mq seek-value-site rcx
lq secs-space rdi
mq equations rdx
mq views rbx
mq sc r11
addc sc b16-secs-to-secs r11
dct r11
mq rax secs-space-site

ent rb16-secs b16-secs
lent rb16-secs rsi
lq secs-space rdi
mq secs-space-site rcx
mov a rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11
#init
#com
##########################################################################################################
# com
##########################################################################################################
#add 4c4b40 rsp
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
mov 200 rdx
lq this rsi
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
