##########################################################################################################
# 81cyph
##########################################################################################################
# rsi | entree
# rdi | destination
# rcx | naof-secs
% libc
% equations
% views
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs entree
mqb rsi entree
aqs naof-entree-secs
mqb rcx naof-entree-secs
aqs key
mqb rdi key
aqs naof-key-secs
mqb rdx naof-key-secs
aqs libc-site
mqb r13 libc-site
aqs equations
mqb r14 equations
aqs views
mqb r15 views

#init
mov 1 rdi
mqb entree rsi
mqb naof-entree-secs rdx
mov 1 rax
sys
entb rentree entree
lentb rentree rsi
mqb entree rdi
mqb naof-entree-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
dct r11
#com

##########################################################################################################
# calc-salt
##########################################################################################################
entb rkey key
lentb rkey rsi
mqb key rdi
mqb naof-key-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
#dct r11

aqs salt
nao r8
mqb r8 salt
mqb key rsi
mqb naof-key-secs r9
nao r10
nao r11
s salt-init
	movs 0 rsi r10
	add r10 r11
	add 1 rsi
	add 1 r8
	cmp r8 r9
	st je salt-com
	st jmp salt-init
s salt-com
and ff r11
mqb r11 salt

entb rsalt salt
lentb rsalt rsi
mqb salt rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
dct r11

##########################################################################################################
# malloc
##########################################################################################################
aqs cyphered
mqb naof-entree-secs rdi
add 1 rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax cyphered

entb rcyphered cyphered
lentb rcyphered rsi
mqb cyphered rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
#dct r11

aqs skey
mqb naof-key-secs rdi
mqb libc-site r11
addc libc __libc_malloc r11
dct r11
mqb rax skey

entb rskey skey
lentb rskey rsi
mqb skey rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
#dct r11

##########################################################################################################
# apply-salt
##########################################################################################################
mqb key rsi
mqb skey rdi
nao r8
nao r9
mqb naof-key-secs r11
mqb salt r10
s salt-key-init
	movs 0 rsi r9
	xor r10 r9
	movs r9 0 rdi
	add 1 rsi
	add 1 rdi
	add 1 r8
	cmp r8 r11
	st je salt-key-com
	st jmp salt-key-init
s salt-key-com

entb srskey skey
lentb srskey rsi
mqb skey rdi
mqb naof-key-secs rcx
mov a rbx
mqb equations rdx
mqb views r11
addc views view-space r11
#dct r11

##########################################################################################################
# calc81
##########################################################################################################

aqs naof-quads
aqs naof-quad-secs
aqs naof-secs
aqs naof-secs-in-quad
mov 8 r8
mqb r8 naof-secs-in-quad
mqb naof-entree-secs rax
nao rdx
divqb naof-secs-in-quad
mqb rax naof-quads
mqb naof-quads r8
factqb naof-secs-in-quad rax
mqb rax naof-quad-secs
mqb naof-entree-secs r8
sub rax r8
mqb r8 naof-secs

entb rnaof-quads naof-quads
lentb rnaof-quads rsi
mqb naof-quads rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
#dct r11

entb rnaof-secs naof-secs
lentb rnaof-secs rsi
mqb naof-secs rdi
mov 10 rbx
mqb equations rdx
mqb views r11
addc views view-number r11
#dct r11

##########################################################################################################
# 8cyph
##########################################################################################################

mqb entree rsi
mqb skey rdi
mqb cyphered rbx
mqb naof-quads r9
cmp 0 r9
st je 8cyph-com
nao r8
nao r10
nao r11
nao r14
mqb salt r12
aqs kscope
mqb naof-key-secs r13
sub 8 r13
mqb r13 kscope
mqb naof-quads r9

s 8cyph-init
	mov r14 rax
	add r12 rax
	nao rdx
	divqb naof-key-secs
	mov rdx rax
	cmp r13 rax
	st jbe kscope-com
		sub r13 rax
	s kscope-com
	add rdi rax

	mov 0 rsi r10
	mov 0 rax r11
	add r11 r10
	mov r10 0 rbx
	add 8 rsi
	add 8 rbx
	add 8 r14
	add 1 r8
	cmp r8 r9
	st je 8cyph-com
	st jmp 8cyph-init
s 8cyph-com

##########################################################################################################
# 1cyph
##########################################################################################################
mqb naof-quad-secs r14
mqb entree rsi
add r14 rsi
mqb skey rdi
mqb cyphered rbx
add r14 rbx
mqb naof-secs r9
cmp 0 r9
st je 1cyph-com
nao r8
nao r10
nao r11
mqb salt r12
aqs kscope

s 1cyph-init
	mov r8 rax
	add r12 rax
	nao rdx
	divqb naof-key-secs
	mov rdx rax
	add rdi rax

	movs 0 rsi r10
	movs 0 rax r11
	add r10 r11
	movs r11 0 rbx
	add 1 rsi
	add 1 rbx
	add 1 r8
	cmp r8 r9
	st je 1cyph-com
	st jmp 1cyph-init
s 1cyph-com
#init
#com

##########################################################################################################
# key-com
##########################################################################################################
mqb skey rdi
mqb libc-site r11
addc libc __libc_free r11
dct r11

##########################################################################################################
# com
##########################################################################################################
mqb cyphered rax
add 1000 rsp
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
