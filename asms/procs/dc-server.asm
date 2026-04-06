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
aqs usite
nao r8
mqb r8 usite

mov 1 rdi
lentb i-sim rsi
mov 7 rdx
mov 1 rax
sys

aqs cyphered
aqs key
aqs naof-key-secs
entb file-name droid/exch.key
lentb file-name rdi
mqb clerk r11
addc clerk snap r11
dct r11
mqb rax key
mqb rcx naof-key-secs

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

mqb equations r11
addc equations task r11
#dct r11

aqs pause0
nao r8
mqb r8 pause0
aqs pause1
mov ed r8
mqb r8 pause1

##########################################################################################################
# serve-requests
##########################################################################################################
aqs file
entb fld-ext fld
# | nn | nonce-name
aqs nn
isr 200
aqs nn-site
aqs fnn
isr 200
# ss | stat-space
aqs ss
isr 200
entb req-ext req
entb rnaof-lvs naof-lvs
entb rnaof-fn-secs naof-fn-secs
entb rsesite sesite
entb ruid uid
entb rgid gid
entb rfn fn
entb dnode droid/
entb rstat stat
entb rleast-st least-st
entb rleast-mst least-mst
entb rst st
entb rmst mst
aqs lv
aqs element
aqs esite
aqs cs
aqs cms
aqs uid
aqs gid
s serve-requests-init

	lentb dnode rdi
	mqb equations rdx
	mqb vecters rbx
	mqb libc-site r14
	mqb views r15
	mqb clerk r11
	addc clerk fileslv r11
	dct r11
	mqb rax lv

	lentb rnaof-lvs rsi
	mqb lv rdi
	mov 10 rdi rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	#dct r11

	aqs least-st
	aqs least-mst
	secs 90 90 90
	mov ffffffffffffffff r8
	mqb r8 least-st
	nao r8
	mqb r8 nn-site
	mqb r8 esite
	s lvs-init
		mqb lv rdi
		mqb esite rsi
		mqb vecters r11
		addc vecters get-element r11
		dct r11
		mqb rax element

		lentb rnaof-fn-secs rsi
		mqb element rdi
		mov 8 rdi rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		mqb element r8
		mov 10 r8 r8
		cmp 8 r8
		st jne is-req-com

		mqb element r8
		mov 8 r8 r10
		cmp 0 r10
		st je seek-ext-com
		aqs sesite
		nao r12
		mqb r12 sesite
		s seek-ext-init
			mqb element r8
			mov 0 r8 rsi
			mov 8 r8 r10
			sub 1 r10
			add r10 rsi
			mqb sesite r8
			sub r8 rsi
			nao r9
			movs 0 rsi r9
			cmp 2e r9
			st je seek-ext-com

			mqb sesite r12
			add 1 r12
			mqb r12 sesite
			mqb element r8
			mov 8 r8 r10
			cmp r12 r10
			st jbe seek-ext-com
			st jmp seek-ext-init
		s seek-ext-com
		mqb sesite r8
		cmp 3 r8
		st jne is-req-com

		lentb rsesite rsi
		mqb sesite rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		mqb sesite rdx
		mqb element r8
		mov 0 r8 rdi
		mov 8 r8 r10
		add r10 rdi
		sub rdx rdi
		lentb req-ext rsi
		mov 3 rcx
		mqb equations r11
		addc equations compair-spaces r11
		dct r11
		cmp 0 rax
		st je is-req-com

		mov 1 rdi
		lentb jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mqb sesite r9
		mqb element r8
		mov 0 r8 rdi
		mov 8 r8 r10
		add r10 rdi
		sub r9 rdi
		mov rdi rsi
		mov 1 rdi
		mqb sesite rdx
		mov 1 rax
		sys

		mov 1 rdi
		lentb jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		mov 1 rdi
		mqb element r8
		mov 0 r8 rsi
		mov 8 r8 rdx
		mov 1 rax
		#sys

		mov 1 rdi
		lentb jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		nao r8
		nao r9
		lqb ss rsi
		s naoify-ss-init
			mov r9 0 rsi
			add 8 rsi
			add 1 r8
			cmp 20 r8
			st je naoify-ss-com
			st jmp naoify-ss-init
		s naoify-ss-com

		# stat
		mqb element rdi
		mov 0 rdi rdi
		lqb ss rsi
		mov 4 rax
		sys

		mov ffffffff r10
		lqb ss r8
		mov 1c r8 r9
		and r10 r9
		mqb r9 uid
		mov 20 r8 r9
		and r10 r9
		mqb r9 gid
		mov 48 r8 r9
		mqb r9 cs
		mov 50 r8 r9
		mqb r9 cms

		lentb rleast-st rsi
		mqb least-st rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		dct r11

		lentb rleast-mst rsi
		mqb least-mst rdi
		mov 10 rbx
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		lentb rst rsi
		mqb cs rdi
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		lentb rmst rsi
		mqb cms rdi
		mqb equations rdx
		mqb views r11
		addc views view-number r11
		#dct r11

		mqb least-st r8
		mov ffffffffffffffff r9
		cmp r8 r9
		st je set-least-init

		# <--> | the meager gem of lhertz-mahxt-leiguiamishare
		mqb cs r8
		mqb least-st r9
		cmp r8 r9
		st jb is-least-com
		st jne is-least-com
		mqb cms r8
		mqb least-mst r9
		cmp r8 r9
		st jb is-least-com

		s set-least-init
		lqb ss rdi
		mov 48 rdi r8
		mov 50 rdi r9
		mqb r8 least-st
		mqb r9 least-mst

		mqb element r8
		mov 0 r8 rsi
		lqb nn rdi
		mqb element r8
		mov 8 r8 rcx
		mqb rcx nn-site
		mqb equations r11
		addc equations com r11
		dct r11

		s is-least-com
		s is-req-com

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
		st je lvs-com
		st jmp lvs-init
	s lvs-com

	mqb lv rdi
	mqb libc-site r11
	addc libc __libc_free r11
	dct r11

	lentb rleast-st rsi
	mqb least-st rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	#dct r11

	lentb rleast-mst rsi
	mqb least-mst rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	#dct r11

	mqb nn-site r8
	cmp 0 r8
	st je fulfill-com

	mqb uid r8
	cmp 0 r8
	#st je fulfill-com

	lqb nn rsi
	lqb fnn rdi
	mqb nn-site rcx
	sub 3 rcx
	mqb equations r11
	addc equations com r11
	dct r11

	lentb fld-ext rsi
	lqb fnn rdi
	mqb nn-site r8
	add r8 rdi
	sub 3 rdi
	mov 3 rcx
	mqb equations r11
	addc equations com r11
	dct r11

	lqb nn rsi
	mqb nn-site r8
	add r8 rsi
	nao r9
	movs r9 0 rsi
	mov 1 rdi
	lqb nn rsi
	mqb nn-site rdx
	mov 1 rax
	sys

	mov 1 rdi
	lentb jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	lqb fnn rsi
	mqb nn-site r8
	add r8 rsi
	nao r9
	movs r9 0 rsi
	mov 1 rdi
	lqb fnn rsi
	mqb nn-site rdx
	mov 1 rax
	sys

	mov 1 rdi
	lentb jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	lentb ruid rsi
	mqb uid rdi
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	lentb rgid rsi
	mqb gid rdi
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	lqb usite rsi
	mov 8 rcx
	mqb key rdi
	mqb naof-key-secs rdx
	mqb libc-site r13
	mqb equations r14
	mqb views r15
	mqb clerk r11
	addc clerk 81cyph r11
	dct r11
	mqb rax cyphered

	# unlink
	lqb fnn rdi
	mov 57 rax
	sys

	# open-write
	mov 1c0 rdx
	mov 41 rsi
	lqb fnn rdi
	mov 2 rax
	sys
	mqb rax file

	# write
	mqb file rdi
	mov 8 rdx
	mqb cyphered rsi
	# <--> | seems cypher categorization goes to bizar rules. a special libc loaded.
	# <--> | we updated get-libc-site to include it and it worked once then a new ratchet would not allow malloc.
	# <--> | this happened on decpher which if memory serves is the category of this bizar ratched.
	# <--> | our level3 lock had auspicious break with dule keys and we learned from the tableture that with the file serverse we might as well be as a botique untill we write bios.
	#lqb usite rsi
	mov 1 rax
	sys

	# close
	mqb file rdi
	mov 3 rax
	sys
	mqb usite r8
	add 1 r8
	mqb r8 usite

	s write-file-init
		# open-read
		nao rsi
		lqb fnn rdi
		mov 2 rax
		sys
		mqb rax file

		mqb file rax
		cmp 0 rax
		st jge write-file-com
		st jmp write-file-init
	s write-file-com
	# close
	mqb file rdi
	mov 3 rax
	sys

	lqb fnn rdi
	# <--> | these notes and others we moved into them are in regards to nao-secs that caused a problem with the stat.
						# <--> | the auxillery libc name was and is a thing with decyph and maybe vaster. that and the ratched after updating for it.
																						# <--> | basically you leave two notes one of an observation you discovered off from your initial desk ganger.
																					# <--> | then you also leave a note of the very on discovered in regards to their very unsolid esoteric.
																						# <--> | just a simple prose ya dig ... you know in not saying iternal vow.
			# <--> | here the server crashes with too fast responses if we cypher results but does not if we dont.
			# <--> | then the decypher on the other side is bizar in results as well.
	mqb uid rsi
	mqb gid rdx
	mov 5c rax
	sys

	mqb cyphered rdi
	mqb libc-site r11
	addc libc __libc_free r11
	dct r11

	# unlink
	lqb nn rdi
	mov 57 rax
	sys

	s fulfill-com

	lqb pause0 rdi
	lqb pause0 rsi
	mov 23 rax
	sys
	st jmp serve-requests-init
s serve-requests-com
##########################################################################################################
# com
##########################################################################################################
#init
#com
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
