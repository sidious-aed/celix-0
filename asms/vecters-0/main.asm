##########################################################################################################
# vecterss-main
##########################################################################################################
% equations
% views
% vecters
% clerk
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
aqs clerk
mqb r11 clerk
aqs vecters
mqb r12 vecters

##########################################################################################################
# add-to-entree
##########################################################################################################
entb sim0 squarelee else where does not meen vactant.\n
aqs naof-sim0-secs
mov 2c r9
mqb r9 naof-sim0-secs
aqs entrea01
isr 200
aqs entrea01-site
nao r8
mqb r8 entrea01-site

mov 1 rdi
lentb sim0 rsi
mqb naof-sim0-secs rdx
mov 1 rax
sys

lentb sim0 rsi
lqb entrea01 rdi
mqb naof-sim0-secs rcx
mqb equations rdx
mqb equations r11
addc equations com r11
dct r11
mqb entrea01-site r8
add rax r8
mqb r8 entrea01-site

entb sim1 \t<--> you might find knowstead or flux.\n
aqs naof-sim1-secs
mov 28 r8
mqb r8 naof-sim1-secs

lentb sim1 rsi
lqb entrea01 rdi
mqb naof-sim1-secs rcx
mqb equations rdx
mqb equations r11
addc equations com r11
dct r11
mqb entrea01-site r8
add rax r8
mqb r8 entrea01-site

entb sim2 \t\t<--> regardsages in conciderages. * meant even.\n
aqs naof-sim2-secs
mov 32 r8
mqb r8 naof-sim2-secs

lentb sim2 rsi
lqb entrea01 rdi
mqb naof-sim2-secs rcx
mqb equations rdx
mqb equations r11
addc equations com r11
dct r11
mqb entrea01-site r8
add rax r8
mqb r8 entrea01-site

mov 1 rdi
lqb entrea01 rsi
mqb entrea01-site rdx
mov 1 rax
sys

entb relay0 entrea01-site
lentb relay0 rsi
mqb entrea01-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# get-libc-site
##########################################################################################################
aqs libc-site
mqb equations rdx
mqb vecters rbx
mqb views r12
mqb clerk r11
addc clerk get-libc-site r11
dct r11
mqb rax libc-site

entb rlibc-site libc-site
lentb rlibc-site rsi
mqb libc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# create-vecter
##########################################################################################################
entb i-sim0 i sim.\n
aqs i-sim0-site
mov 7 r8
mqb r8 i-sim0-site
entb i-sim1 talkei talkei. airgo vah nah goo trim brader.\n
aqs i-sim1-site
mov 2e r8
mqb r8 i-sim1-site
entb i-sim2 nai. aht set two law. aht fitty nah. bra of a broom today.\n
aqs i-sim2-site
mov 3b r8
mqb r8 i-sim2-site

aqs naof-esecs
aqs entreesv
mov 10 rdi
mqb rdi naof-esecs
mov 100 rsi
mqb libc-site rdx
mqb vecters r11
addc vecters create-vecter r11
dct r11
mqb rax entreesv

entb rnaof-vsecs naof-vsecs
lentb rnaof-vsecs rsi
mov rcx rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb rv-meta v-meta
lentb rv-meta rsi
mqb entreesv rdi
mov 18 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

##########################################################################################################
# add-to-vecter to expansion
##########################################################################################################
entb rvsite vsite
entb rometa ometa
aqs er-entree
aqs er-naof-entree-secs
aqs ometa

lentb i-sim0 r8
mqb r8 er-entree
mqb i-sim0-site r8
mqb r8 er-naof-entree-secs

mqb entreesv rdi
lqb er-entree rsi
mqb equations rdx
mqb vecters r11
addc vecters add-to-vecter r11
dct r11

lentb rv-meta rsi
mqb entreesv rdi
mov 28 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

aqs naof-types
mov 3 r8
mqb r8 naof-types
aqs esite
nao r8
mqb r8 esite
s add-to-expansion-init
	mqb esite r8
	cmp 111 r8
	st je add-to-expansion-com

	mqb esite rax
	nao rdx
	divqb naof-types
	cmp 0 rdx
	st je ate-mode-0
	cmp 1 rdx
	st je ate-mode-1
	cmp 2 rdx
	st je ate-mode-2

	s ate-mode-0
	lentb i-sim0 r8
	mqb r8 er-entree
	mqb i-sim0-site r8
	mqb r8 er-naof-entree-secs
	st jmp ate-modes-com

	s ate-mode-1
	lentb i-sim1 r8
	mqb r8 er-entree
	mqb i-sim1-site r8
	mqb r8 er-naof-entree-secs
	st jmp ate-modes-com

	s ate-mode-2
	lentb i-sim2 r8
	mqb r8 er-entree
	mqb i-sim2-site r8
	mqb r8 er-naof-entree-secs
	s ate-modes-com

	mqb entreesv rdi
	lqb er-entree rsi
	mqb equations rdx
	mqb libc-site rbx
	mqb vecters r11
	addc vecters add-to-vecter r11
	dct r11
	mqb rax entreesv
	mqb rbx ometa

	lentb rometa rsi
	mov rbx rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	lentb rvsite rsi
	mov 10 rbx
	mqb entreesv rdi
	mov 10 rdi rdi
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	lentb rv-meta rsi
	mqb entreesv rdi
	mqb ometa rcx
	factqb naof-esecs rcx
	add 28 rcx
	mov a rbx
	mqb equations rdx
	mqb views r11
	addc views view-space r11
	#dct r11

	mqb esite r8
	add 1 r8
	mqb r8 esite
	st jmp add-to-expansion-init
s add-to-expansion-com

##########################################################################################################
# vecter-task0
##########################################################################################################
entb rat at
aqs element
nao r8
mqb r8 esite
s print-entreesv-init
	mqb entreesv r8
	mov 10 r8 r8
	mqb esite r9
	cmp r8 r9
	st je print-entreesv-com

	mqb entreesv rdi
	mqb esite rsi
	mqb vecters r11
	addc vecters get-element r11
	dct r11
	mqb rax element

	lentb rat rsi
	mov 10 rbx
	mov rax rdi
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	mov 1 rdi
	mqb element rax
	mov 0 rax rsi
	mov 8 rax rdx
	mov 1 rax
	sys

	mqb esite r8
	add 1 r8
	mqb r8 esite
	st jmp print-entreesv-init
s print-entreesv-com

##########################################################################################################
# add-string-to-vecter
# rbp | russian-burban-poem
##########################################################################################################
entb rbp0 calm calm. five by five. avastual coinages and a tar-rum-sahsheikeia.\n
aqs naof-rbp0-secs
mov 46 r9
mqb r9 naof-rbp0-secs
entb rbp1 \t<--> laws ... in crest ... send stigma ... airon thirst in back brims.\n
aqs naof-rbp1-secs
mov 48 r9
mqb r9 naof-rbp1-secs
entb rbp2 grey innamast, and somber soot of air. acting stat presence ... through with breaks.\n
aqs naof-rbp2-secs
mov 55 r9
mqb r9 naof-rbp2-secs

aqs rbps
mov 50 rdi
mqb libc-site rdx
mqb vecters r11
addc vecters create-string r11
dct r11
mqb rax rbps

mqb rbps rdi
lentb rbp0 rsi
mqb naof-rbp0-secs rcx
mqb equations rdx
mqb libc-site rbx
mqb vecters r11
addc vecters add-string-to-vecter r11
dct r11
mqb rax rbps

mqb rbps rdi
lentb rbp1 rsi
mqb naof-rbp1-secs rcx
mqb equations rdx
mqb libc-site rbx
mqb vecters r11
addc vecters add-string-to-vecter r11
dct r11
mqb rax rbps

mqb rbps rdi
lentb rbp2 rsi
mqb naof-rbp2-secs rcx
mqb equations rdx
mqb libc-site rbx
mqb vecters r11
addc vecters add-string-to-vecter r11
dct r11
mqb rax rbps

entb rrbp-site rbp-site
lentb rrbp-site rsi
mov rbx rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb rrbp0 rbp0
lentb rrbp0 rsi
mqb rbps rdi
mov 18 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
#dct r11

lentb rrbp-site rsi
mov rbx rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

lentb rrbp-site rsi
mov rbx rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

entb rrbp rbp
lentb rrbp rsi
mqb rbps rdi
mov 18 rcx
mov 10 rdi r8
add r8 rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11

mov 1 rdi
mqb rbps rsi
mov 10 rsi rdx
add 18 rsi
mov 1 rax
sys

mqb rbps rdi
mqb libc-site r11
addc libc __libc_free r11
dct r11

##########################################################################################################
# getc
##########################################################################################################

aqs con0
nao r8
mqb r8 con0
nao rax
mqb libc-site rdi
add 3eba00 rdi
mqb libc-site r11
addc libc _IO_getc r11
dct r11
mqb rax con0

entb rcon0 con0
lentb rcon0 rsi
mqb con0 rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# cyphpr (cypher printing an intreague from polygon)
##########################################################################################################
mqb rbps rsi
mov 10 rsi rcx
add 18 rsi
mqb equations rdx
mqb views r11
addc views cyphpr r11
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
