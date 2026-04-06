##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% vects
% vecters
##########################################################################################################
# init
##########################################################################################################
aqs bdom
aqs self
aqs equations
aqs views
aqs vects
aqs vecters
aqs libc-site

ent jsect \n
ent rmr mr
ent d-sim dwerbp dwerbp. in housa mie toe mar.
lent d-sim rsi
mov 24 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

ent rnumber number
lent rnumber rsi
mov aedaed rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# entrees-vecter (chart-scopes)
##########################################################################################################
aqs vname
nao r8
mov 10 rdi
mq equations r12
mq views r13
mq vects r11
addc vects cv r11
dct r11
mq rax vname

mq vname rsi
mov 19 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

#init
##########################################################################################################
# add-to-vecter
##########################################################################################################
aqs entree-record-entree
lent d-sim rsi
mq rsi entree-record-entree
aqs entree-record-site
mov 25 r9
mq r9 entree-record-site

mq vname rdi
lq entree-record-entree rsi
mq equations r12
mq views r13
mq vects r11
addc vects av r11
dct r11

##########################################################################################################
# get-vecter-record
##########################################################################################################
aqs entree-record
isr 8

mq vname rsi
lq entree-record rdi
nao rbx
mq equations r12
mq views r13
mq vects r11
addc vects gvr r11
dct r11

lq entree-record r8
mov 0 r8 rsi
mov 8 r8 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# expansion-add-to-vecter
##########################################################################################################
mq vname rdi
lq entree-record-entree rsi
mq equations r12
mq views r13
mq vects r11
addc vects av r11
dct r11

##########################################################################################################
# get-vecter-record
##########################################################################################################
mq vname rsi
lq entree-record rdi
mov 1 rbx
mq equations r12
mq views r13
mq vects r11
addc vects gvr r11
dct r11

lq entree-record r8
mov 0 r8 rsi
mov 8 r8 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# expansion-add-to-vecter
##########################################################################################################
mq vname rdi
lq entree-record-entree rsi
mq equations r12
mq views r13
mq vects r11
addc vects av r11
dct r11

##########################################################################################################
# get-vecter-record
##########################################################################################################
mq vname rsi
lq entree-record rdi
mov 2 rbx
mq equations r12
mq views r13
mq vects r11
addc vects gvr r11
dct r11

lq entree-record r8
mov 0 r8 rsi
mov 8 r8 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# string-vecter (chart-scopes)
##########################################################################################################
ent rstring-vecter string vecter.
lent rstring-vecter rsi
mov e rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

aqs entree0
nao r8
mov 1 rdi
mov 1 rsi
mq equations r12
mq views r13
mq vects r11
addc vects cv r11
dct r11
mq rax entree0

##########################################################################################################
# add-string-to-vecter
##########################################################################################################
ent ras as.
lent ras rsi
mov 3 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

ent entrea01 <--> * i remember much.\n
ent entrea11 \t <--> * each and every one of us can see our hall magic gain.\n
mq entree0 rdi
lent entrea01 rsi
mov 18 rcx
mq equations r12
mq views r13
mq vects r11
addc vects as r11
dct r11

mq entree0 rdi
lent entrea11 rsi
mov 3e rcx
mq equations r12
mq views r13
mq vects r11
addc vects as r11
dct r11

##########################################################################################################
# static-send-string
##########################################################################################################
aqs string-space
isr 400
aqs string-space-site

mq entree0 rdi
lq string-space rsi
mq equations r12
mq views r13
mq vects r11
addc vects ss r11
dct r11
mq rax string-space-site

lq string-space rsi
mq string-space-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# entrees-vecter (chart-scopes)
##########################################################################################################
ent nentrees vects/entrees.vect
ent nentrees-meta vects/entrees-meta.vect
ent rentrees-vecter entrees vecter.
lent rentrees-vecter rsi
mov 9 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

aqs entrees
lent nentrees r8
mov 1 rdi
mov 1 rsi
#mov 100 rsi
mq equations r12
mq views r13
mq vects r11
addc vects cv r11
dct r11
mq rax entrees

aqs entrees-meta
lent nentrees-meta r8
mov 10 rdi
mov 5 rsi
mq equations r12
mq views r13
mq vects r11
addc vects cv r11
dct r11
mq rax entrees-meta

ent kname name
mq entrees rdi
mq entrees-meta rbx
lent kname rsi
mov 4 rcx
mq equations r12
mq views r13
mq vects r14
mq vecters r11
addc vecters ae r11
dct r11

ent kage age
mq entrees rdi
mq entrees-meta rbx
lent kage rsi
mov 3 rcx
mq equations r12
mq views r13
mq vects r14
mq vecters r11
addc vecters ae r11
dct r11

##########################################################################################################
# get-entree (chart-scopes)
##########################################################################################################
ent rget-entree get entree.
lent rget-entree rsi
mov b rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

mq entrees rdi
mq entrees-meta rbx
lq string-space rsi
nao rcx
mq equations r12
mq views r13
mq vects r14
mq vecters r11
addc vecters ge r11
dct r11
mq rax string-space-site

lq string-space rsi
mq string-space-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

ent rstring-space-site string-space-site
lent rstring-space-site rsi
mq string-space-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

mq entrees rdi
mq entrees-meta rbx
lq string-space rsi
mov 1 rcx
mq equations r12
mq views r13
mq vects r14
mq vecters r11
addc vecters ge r11
dct r11
mq rax string-space-site

# <--> | we dont want to be paranoid but did we get silenced aon standard write 1 prints to tty.
#	  <--> | crazier things have happened. lets clerk pass it with view-boards weather its sparse alter or statis.
lq string-space rsi
mq string-space-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

lent rstring-space-site rsi
mq string-space-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11
lq string-space rsi
nao rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# hashes (chart-scopes)
##########################################################################################################
ent rhashes hashes.
lent rhashes rsi
mov 7 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

ent fntigers-chart charts/tigers.chart
aqs tigers-chart
lent fntigers-chart r8
mov 1 rdi
mov 500 rsi
mq equations r12
mq views r13
mq vects r11
addc vects cv r11
dct r11
mq rax tigers-chart

ent tiger0-name sirboshinick
mq tigers-chart rbx
lent kname rsi
mov 4 rcx
lent tiger0-name rdi
mov c rdx
mq equations r12
mq views r13
mq vects r14
mq vecters r11
addc vecters hae r11
dct r11
#com

##########################################################################################################
# com
##########################################################################################################
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
lq string-space rsi
mq string-space-site rdx
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com

#init
# getc
mq libc-site r11
add 87ea0 r11
#dct r11
aqs time-secs
nao r8
mqb r8 time-secs
aqs time-micro-secs
mov aed r8
mqb r8 time-micro-secs
s task0-init
# nanosleep
lq time-seconds rdi
mov 23 rax
sys
st jmp task0-init
s task0-com
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com
