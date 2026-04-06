##########################################################################################################
# clerk-main <--> | (es) always mean(t).
##########################################################################################################
% equations
% views
% clerk
% vecters
% libc
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
aqs vecters
mqb r11 vecters
aqs clerk
mqb r12 clerk

entb jsect \n
entb i-sim i sim.\n
mov 1 rdi
lentb i-sim rsi
mov 7 rdx
mov 1 rax
sys

##########################################################################################################
# view-number
##########################################################################################################
entb relay0 general-code
lentb relay0 rsi
mov aedaed rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# com
##########################################################################################################
entb i-sim i sim.\n
aqs naof-i-sim-secs
mov 7 r8
mqb r8 naof-i-sim-secs
aqs entrea0
isr 200
aqs entrea0-site
nao r8
mqb r8 entrea0-site

lentb i-sim rsi
lqb entrea0 rdi
mqb naof-i-sim-secs rcx
mqb rcx entrea0-site
mqb equations r11
addc equations com r11
dct r11

mov 1 rdi
lqb entrea0 rsi
mqb entrea0-site rdx
mov 1 rax
sys

##########################################################################################################
# snap
##########################################################################################################

aqs key
aqs naof-key-secs
entb file-name clerk/exch.key
lentb file-name rdi
mqb clerk r11
addc clerk snap r11
dct r11
mqb rax key
mqb rcx naof-key-secs

entb exch-key-relay exch-key
lentb exch-key-relay rsi
mqb key rdi
mqb naof-key-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

##########################################################################################################
# get-libc-site
##########################################################################################################
aqs stack-site
aqs libc-site
mqb equations rdx
mqb vecters rbx
mqb views r12
mqb clerk r11
addc clerk get-libc-site r11
dct r11
mqb rax stack-site
mqb rax libc-site

entb rstack-site stack-site
lentb rstack-site rsi
mqb libc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

mqb equations r11
addc equations task r11
#dct r11

##########################################################################################################
# malloc
##########################################################################################################
aqs malloc-site
mov 1000 rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax malloc-site

entb rmalloc-site malloc-site
lentb rmalloc-site rsi
mqb malloc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lentb i-sim rsi
mqb malloc-site rdi
mqb naof-i-sim-secs rcx
mqb rcx entrea0-site
mqb equations r11
addc equations com r11
dct r11

mov 1 rdi
mqb malloc-site rsi
mqb naof-i-sim-secs rdx
mov 1 rax
sys

aqs m0
mov 1000 rdi
mqb libc-site rdx
mqb libc-site r11
addc libc malloc r11
dct r11
mqb rax m0

entb rm0 m0
lentb rm0 rsi
mqb m0 rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb i-sim-b8 talkei talkei. airgo vah nah goo trim brader.\n
lentb i-sim-b8 rsi
mqb m0 rdi
mov 2e rcx
mqb equations r11
addc equations com r11
dct r11

mov 1 rdi
mqb m0 rsi
mov 2e rdx
mov 1 rax
sys

##########################################################################################################
# 81cyph
##########################################################################################################
entb i-sim27 Talkei talkei. Airgo vah nah goo trim brader.\n
aqs naof-i-sim27-secs
mov 2e r8
mqb r8 naof-i-sim27-secs
aqs cstring
aqs salt-sum
aqs grid
isr 10
nao r8
mqb r8 grid
aqs naof-c0quads
aqs naof-c0secs
aqs naof-c1quads
aqs naof-c1secs
aqs csite

entb ostring-relay ostring
lentb ostring-relay rsi
lentb i-sim27 rdi
mqb naof-i-sim27-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

entb rkey key
lentb rkey rsi
mqb key rdi
mqb naof-key-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
#dct r11

aqs cyphered
lentb i-sim27 rsi
mqb naof-i-sim27-secs rcx
mqb key rdi
mqb naof-key-secs rdx
mqb libc-site r13
mqb equations r14
mqb views r15
mqb clerk r11
addc clerk 81cyph r11
dct r11
mqb rax cyphered

entb rcyphered cyphered
lentb rcyphered rsi
mqb cyphered rdi
mov 2e rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

##########################################################################################################
# 81decyph
##########################################################################################################
aqs decyphered
mqb cyphered rsi
mqb naof-i-sim27-secs rcx
mqb key rdi
mqb naof-key-secs rdx
mqb libc-site r13
mqb equations r14
mqb views r15
mqb clerk r11
addc clerk 81decyph r11
dct r11
mqb rax decyphered

entb rdecyphered decyphered
lentb rdecyphered rsi
mqb decyphered rdi
mov 2e rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

mov 1 rdi
mqb decyphered rsi
mqb naof-i-sim27-secs rdx
mov 1 rax
sys

##########################################################################################################
# this ones big. the whole thing is wide.
#		<--> | best proweles best brace ins gettable, gotten, these sorcery inclavituides.
#			<--> | with the best brace ints, includes, the best next through to the nexts.
#		<--> | trends, won to laws, where the laws victory and the eye therein,
#			<--> | win the next walls down aon both sides.
##########################################################################################################
aqs lc
aqs naof-ls-secs
entb lcfile-name libc.so.6

aqs nfile
aqs naof-nfile-secs
# open-read
nao rsi
lentb lcfile-name rdi
mov 2 rax
sys
mqb rax nfile
# lseek
mqb nfile rdi
nao rsi
mov 2 rdx
mov 8 rax
sys
mqb rax naof-nfile-secs
# close
mq nfile rdi
mov 3 rax
sys

entb ronaof-lc-secs naof-lc-secs
lentb ronaof-lc-secs rsi
mqb naof-nfile-secs rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lentb lcfile-name rdi
mqb clerk r11
addc clerk snap r11
dct r11
mqb rax lc
mqb rcx naof-lc-secs
#mqb naof-nfile-secs r8
#mqb r8 naof-lc-secs

entb rlc lc
lentb rlc rsi
mqb lc rdi
mov 100 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

entb rnaof-lc-secs naof-lc-secs
lentb rnaof-lc-secs rsi
mqb naof-lc-secs rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

mqb equations r11
addc equations task r11
#dct r11

aqs lccyphered
mqb lc rsi
mqb naof-lc-secs rcx
mov 100 rcx
mov 1efd50 rcx
mqb naof-nfile-secs rcx
#mqb naof-lc-secs rcx
mqb key rdi
mqb naof-key-secs rdx
mqb libc-site r13
mqb equations r14
mqb views r15
mqb clerk r11
addc clerk 81cyph r11
dct r11
mqb rax lccyphered

entb rp nai. aht set two law. aht fitty nah. bra of a broom today.\n
mov 1 rdi
lentb rp rsi
mov 3b rdx
mov 1 rax
sys

entb rlcc lccyphered
lentb rlcc rsi
mqb lccyphered rdi
mov 100 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

aqs lcdecyphered
mqb lccyphered rsi
mov 1efd50 rcx
#mqb naof-lc-secs rcx
mqb naof-nfile-secs rcx
mqb key rdi
mqb naof-key-secs rdx
mqb libc-site r13
mqb equations r14
mqb views r15
mqb clerk r11
addc clerk 81decyph r11
dct r11
mqb rax lcdecyphered

entb rlcdec lcdecyphered
lentb rlcdec rsi
mqb lcdecyphered rdi
mov 100 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

aqs file
entb ofilen lc.so.6
# unlink
lentb ofilen rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 41 rsi
lentb ofilen rdi
mov 2 rax
sys
mqb rax file
# write
mqb file rdi
mov 1efd50 rdx
#mov 100 rdx
mqb naof-lc-secs rdx
mqb lcdecyphered rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#init
#com

##########################################################################################################
# access
##########################################################################################################
entb afn 81cyph.asm
lentb afn rdi
mov 1f8 rsi
mov 5a rax
sys

lentb afn rdi
# droid
mov 1b rsi
# tyrel
mov 3e8 rsi
# droid-com
mov d2 rdx
mov 5c rax
sys

##########################################################################################################
# fileslv
##########################################################################################################
aqs lv
entb node0 secs/equations/
lentb node0 rdi
mqb equations rdx
mqb vecters rbx
mqb libc-site r14
mqb views r15
mqb clerk r11
addc clerk fileslv r11
dct r11
mqb rax lv

entb rnaof-lvs naof-lvs
lentb rnaof-lvs rsi
mqb lv rdi
mov 10 rdi rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

aqs element
aqs esite
nao r8
mqb r8 esite
s print-lvs-init
	mqb lv rdi
	mqb esite rsi
	mqb vecters r11
	addc vecters get-element r11
	dct r11
	mqb rax element

	mov 1 rdi
	mqb element r8
	mov 0 r8 rsi
	mov 8 r8 rdx
	mov 1 rax
	sys

	mov 1 rdi
	lentb jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	mqb element r8
	mov 0 r8 rdi
	mqb libc-site r11
	addc libc __libc_free r11
	dct r11

	mqb esite r8
	add 1 r8
	mqb r8 esite
	mqb lv r9
	mov 10 r9 r9
	cmp r8 r9
	st je print-lvs-com
	st jmp print-lvs-init
s print-lvs-com

mqb lv rdi
mqb libc-site r11
addc libc __libc_free r11
dct r11
#init
#com

##########################################################################################################
# stat
##########################################################################################################

aqs stats
isr 200
entb sfn i-sim0.entree
lentb sfn rdi
lqb stats rsi
mov 4 rax
sys

entb rstat stat
lentb rstat rsi
mqb rbps rdi
lqb stats
mov 200 rcx
mov 10 rdi r8
add r8 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

aqs user-id
lqb stats rsi
mov 1c rsi r8
mov ffffffff r9
and r9 r8
mqb r8 user-id

entb ruser-id user-id
lentb ruser-id rsi
mqb user-id rdi
mov a rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

# <--> | 6 quads 3 times. first is last written by text editor. the last two are even pipe updated.
entb rtime0 time0
aqs tsite
aqs time0
nao r8
mqb r8 tsite
s print-times-init
	lqb stats rsi
	add 48 rsi
	mqb tsite r8
	add r8 rsi
	mov 0 rsi r8
	mqb r8 time0

	lentb rtime0 rsi
	mqb time0 rdi
	mov a rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	mqb tsite r8
	add 8 r8
	mqb r8 tsite
	cmp 30 r8
	st je print-times-com
	st jmp print-times-init
s print-times-com

##########################################################################################################
# com
##########################################################################################################
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
