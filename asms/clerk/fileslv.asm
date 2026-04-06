##########################################################################################################
# com
##########################################################################################################
# rdi | node-name
# rdx | equations
# rbx | vecters
# r14 | libc-site
# r15 | views
% equations
% vecters
% views
% libc
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 2000 rsp
aqs node-name
mqb rdi node-name
aqs node-name-site
nao r8
mqb r8 node-name-site
aqs equations
mqb rdx equations
aqs vecters
mqb rbx vecters
aqs libc-site
mqb r14 libc-site
aqs views
mqb r15 views
aqs cs
isr 1000
aqs cs-site
nao r8
mqb r8 cs-site
entb rcs cs
entb rfr fr
entb rtype type
entb rfrsecs fr-secs

mqb node-name rdi
mqb equations r15
addc equations get-naof-secs r15
dct r15
mqb rax node-name-site

mov 1 rdi
mqb node-name rsi
mqb node-name-site rdx
mov 1 rax
#sys

entb jsect \n
mov 1 rdi
lentb jsect rsi
mov 1 rdx
mov 1 rax
#sys

entb rlibc-site libc-site
lentb rlibc-site rsi
mqb libc-site rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
#dct r11

mqb equations r11
addc equations task r11
#dct r11

aqs lv
mov 18 rdi
mov 100 rsi
mqb libc-site rdx
mqb vecters r11
addc vecters create-vecter r11
dct r11
mqb rax lv

##########################################################################################################
# open node
##########################################################################################################
aqs file
# open-read
nao rsi
mqb node-name rdi
mov 2 rax
sys
mq rax file

##########################################################################################################
# obtain node fl (fl|file-list)
##########################################################################################################
aqs naof-rsecs
aqs csite
aqs ocsite
aqs naof-frsecs
aqs ffn
aqs ffn-site
aqs fn
aqs naof-fn-secs
aqs type
s obtain-node-fl-init
	mqb file rdi
	lqb cs rsi
	mov 1000 rdx
	mov 4e rax
	sys
	mqb rax naof-rsecs
	cmp 0 rax
	st je obtain-node-fl-com

	lentb rcs rsi
	lqb cs rdi
	mqb naof-rsecs rcx
	mov a rbx
	mqb equations rdx
	mqb views r11
	addc views view-space r11
	#dct r11

	nao r8
	mqb r8 csite
	s cell-init
		lqb cs rsi
		mqb csite r8
		mqb r8 ocsite
		add r8 rsi
		add 10 rsi
		nao r9
		mov 0 rsi r9
		mov ffff r10
		and r10 r9
		mqb r9 naof-frsecs
		mqb csite r8
		add r9 r8
		mqb r8 csite

		lentb rfr rsi
		lqb cs rdi
		mqb ocsite r8
		add r8 rdi
		mqb naof-frsecs rcx
		mov a rbx
		mqb equations rdx
		mqb views r11
		addc views view-space r11
		#dct r11

		lqb cs rsi
		mqb ocsite r8
		add r8 rsi
		add 12 rsi
		mqb rsi fn

		lqb cs rsi
		add r8 rsi
		mqb naof-frsecs r8
		add r8 rsi
		sub 1 rsi
		nao r9
		movs 0 rsi r9
		mqb r9 type

		mqb fn rsi
		nao r8
		nao r9
		s seek-naof-fn-secs-init
			movs 0 rsi r8
			cmp 0 r8
			st je seek-naof-fn-secs-com
			add 1 r9
			add 1 rsi
			st jmp seek-naof-fn-secs-init
		s seek-naof-fn-secs-com
		mqb r9 naof-fn-secs

		lentb rfrsecs rsi
		mqb fn rdi
		mqb naof-fn-secs rcx
		mov a rbx
		mqb equations rdx
		mqb views r11
		addc views view-space r11
		#dct r11

		mov 1 rdi
		mqb fn rsi
		mqb naof-fn-secs rdx
		mov 1 rax
		#sys

		mov 1 rdi
		lentb jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		lentb rtype rsi
		mqb type rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		mqb node-name-site rdi
		mqb naof-fn-secs r8
		add r8 rdi
		mqb rdi ffn-site
		add 1 rdi
		mqb libc-site r11
		addc libc __libc_malloc r11
		dct r11
		mqb rax ffn

		mqb node-name rsi
		mqb ffn rdi
		mqb node-name-site rcx
		mqb equations r11
		addc equations com r11
		dct r11

		mqb fn rsi
		mqb ffn rdi
		mqb node-name-site r8
		add r8 rdi
		mqb naof-fn-secs rcx
		mqb equations r11
		addc equations com r11
		dct r11
		# <--> | maybe something duel stay here to check out later. ended up with r8 being a six-sec instead of naof-secs.
		# though, maybe it was mergers, as i though we had and aqs for naof-ffn-secs but ... anyway.
		#mqb naof-fn-secs r8
		#mqb node-name-site r9
		#add r9 r8
		#mqb r8 naof-ffn-secs
		mqb naof-fn-secs r12
		mqb node-name-site r13
		add r12 r13
		mqb r13 ffn-site

		entb rnaof-ffn-secs naof-ffn-secs
		lentb rnaof-ffn-secs rsi
		mqb ffn-site rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		mov 1 rdi
		mqb ffn rsi
		mqb ffn-site rdx
		mov 1 rax
		#sys

		mov 1 rdi
		lentb jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		mqb ffn r8
		mqb r8 fn
		mqb ffn-site r8
		mqb r8 naof-fn-secs
		mqb lv rdi
		lqb fn rsi
		mqb equations rdx
		mqb libc-site rbx
		mqb vecters r11
		addc vecters add-to-vecter r11
		dct r11
		mqb rax entreesv

		mqb ffn rsi
		mqb naof-fn-secs r8
		add r8 rsi
		nao r8
		movs r8 0 rsi

		mqb naof-rsecs r8
		mqb csite r9
		cmp r8 r9
		st je cell-com
		st jmp cell-init
	s cell-com

	st jmp obtain-node-fl-init
s obtain-node-fl-com
#init
#com

##########################################################################################################
# com
##########################################################################################################
# close
mq file rdi
mov 3 rax
sys
mqb lv rax
add 2000 rsp
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
mq naof-secs rdx
mq entree rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
