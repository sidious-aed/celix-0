##########################################################################################################
# view-number
##########################################################################################################
# rsi | relay
# rdi | space
# rcx | naof-secs
# rbx | base
# r10 | is-board
# rdx | equations
% equations
##########################################################################################################
# view-number-init
##########################################################################################################
push rbp
mov rsp rbp
sub 40000 rsp
aqs relay
mqb rsi relay
aqs space
mqb rdi space
aqs space-site
nao r8
mqb r8 space-site
aqs naof-secs
mqb rcx naof-secs
aqs et
sub 1 rcx
mqb rcx et
aqs base
mqb rbx base
aqs is-board
mqb r10 is-board
aqs board-expansion
mov 2 r11
mqb r11 board-expansion
aqs equations
mqb rdx equations
entb jsect \n
entb jedao-sectioner  | 
aqs vs-space
isr 10000
aqs bs
isr 100
aqs bs-site
aqs vs-space-site
nao r8
mqb r8 vs-space-site
aqs vspace
lqb vs-space r8
mqb r8 vspace

mqb is-board r8
cmp aed r8
st jne run-board-for-vspace-com
st jmp run-board-for-vspace-com
s run-board-for-vspace-init
	# anonomous-mmap
	nao rdi
	mqb naof-secs rsi
	factqb board-expansion rsi
	mov 7 rdx
	mov 22 r10
	nao r9
	nao r8
	mov 9 rax
	sys
	mqb rax vspace
s run-board-for-vspace-com

aqs naof-relay-secs
mqb relay rdi
mqb equations r11
addc equations get-naof-secs r11
dct r11
mqb rax naof-relay-secs

mqb relay rsi
mqb vspace rdi
mqb naof-relay-secs rcx
mqb rcx vs-space-site
mqb equations r11
addc equations com r11
dct r11

lentb jedao-sectioner rsi
mqb vspace rdi
mov 3 rcx
mqb vs-space-site r8
add r8 rdi
add rcx r8
mqb r8 vs-space-site
mqb equations r11
addc equations com r11
dct r11
#init
#com

mqb vspace rsi
mqb vs-space-site r8
add r8 rsi
mov 5b r8
movs r8 0 rsi
add 1 r8
mqb r8 vs-space-site

aqs con
aqs ospace-site
s view-secs-init
	mqb space-site r8
	mqb r8 ospace-site
	mqb naof-secs r9
	cmp r9 r8
	st je view-secs-com

	mqb space rsi
	mqb space-site r8
	add r8 rsi
	nao r11
	movs 0 rsi r11
	mqb r11 con
	add 1 r8
	mqb r8 space-site

	mqb con rdi
	mqb base rbx
	lqb bs rsi
	mqb equations r8
	addc equations number-to-entree r8
	dct r8
	mqb rax bs-site

	lqb bs rsi
	mqb vspace rdi
	mqb vs-space-site r8
	add r8 rdi
	mqb bs-site rcx
	mqb equations r11
	addc equations com r11
	dct r11
	mqb vs-space-site r8
	mqb bs-site r9
	add r9 r8
	mqb r8 vs-space-site

	mqb ospace-site r8
	mqb et r9
	cmp r8 r9
	st je vsect-com
	s vsect-init
		mqb vspace rsi
		mqb vs-space-site r8
		add r8 rsi
		mov 2c r9
		movs r9 0 rsi
		add 1 rsi
		mov 20 r9
		movs r9 0 rsi
		add 2 r8
		mqb r8 vs-space-site
	s vsect-com
#init
#com

	st jmp view-secs-init
s view-secs-com

mqb vspace rsi
mqb vs-space-site r8
add r8 rsi
mov 5d r9
movs r9 0 rsi
mov a r9
add 1 rsi
movs r9 0 rsi
add 2 r8
mqb r8 vs-space-site
#init
#com

mov 1 rdi
mqb vspace rsi
mqb vs-space-site rdx
mov 1 rax
sys
mov 1 rdi
lentb jsect rsi
mov 1 rdx
mov 1 rax
#sys

##########################################################################################################
# view-number-com
##########################################################################################################
add 40000 rsp
pop rbp
ret

#init
aqs file
entb fn droid/clerk-com3.secs
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
lqb naof-relay-secs rsi
mov 8 rdx
mov 1 rax
sys
# write
mqb file rdi
lqb vs-space-site rsi
mov 8 rdx
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
