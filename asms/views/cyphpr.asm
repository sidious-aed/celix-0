##########################################################################################################
# com
##########################################################################################################
# rsi | entree
# rcx | naof-secs
# rdx | equations
% equations
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 4000 rsp
aqs entree
mqb rsi entree
aqs naof-entree-secs
mqb rcx naof-entree-secs
aqs equations
mqb rdx equations
entb jsect \n
aqs cyph_entree
isr 2000
aqs cyph_site
nao r8
mqb r8 cyph_site

mov 1 rdi
mqb entree rsi
mqb naof-entree-secs rdx
mov 1 rax
#sys

aqs esite
aqs oesite
aqs sec-site
aqs scyph
aqs naof-sec0-secs
nao r8
mqb r8 esite
s sections-init
	mqb esite r8
	mqb naof-entree-secs r9
	cmp r8 r9
	st je sections-com

	mqb r8 oesite
	mqb entree rdi
	add r8 rdi
	mqb naof-entree-secs rdx
	sub r8 rdx
	lentb jsect rsi
	mov 1 rcx
	mqb equations r11
	addc equations seek-space r11
	dct r11
	mqb rax sec-site
	mqb esite r8
	add rax r8
	add 1 r8
	mqb r8 esite

	mqb entree rsi
	nao r8
	mqb sec-site r9
	nao r10
	nao r11
	s salt-init
		cmp r8 r9
		st je salt-com
		movs 0 rsi r10
		add r10 r11
		add 1 rsi
		add 1 r8
		st jmp salt-init
	s salt-com
	mov r11 rax
	nao rdx
	divqb sec-site
	mqb rdx scyph


	mqb scyph rdx
	mqb oesite r8
	mqb entree rsi
	add r8 rsi
	add rdx rsi
	lqb cyph_entree rdi
	mqb sec-site rcx
	sub rdx rcx
	mqb rcx naof-sec0-secs
	mqb equations r11
	addc equations com r11
	dct r11

	mqb oesite r8
	mqb entree rsi
	add r8 rsi
	lqb cyph_entree rdi
	mqb naof-sec0-secs r10
	add r10 rdi
	mqb scyph rcx
	mqb equations r11
	addc equations com r11
	dct r11

	lqb cyph_entree rsi
	mqb sec-site r8
	add r8 rsi
	mov a r9
	movs r9 0 rsi

	mov 1 rdi
	lqb cyph_entree rsi
	mqb sec-site rdx
	add 1 rdx
	mov 1 rax
	sys
	st jmp sections-init
s sections-com

##########################################################################################################
# com
##########################################################################################################
add 4000 rsp
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
lqb scyph rsi
mov 1 rax
sys
# write
mq file rdi
mqb sec-site rdx
lqb cyph_entree rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
