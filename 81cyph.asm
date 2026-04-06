##########################################################################################################
# snap
##########################################################################################################
# rdi | key
# rbx | naof-key-secs
# rsi | string
# rcx | naof-string-secs
# r15 | grid
# rdx | equations
# r14 | views
# r13 | sret
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs key
mq rdi key
aqs naof-key-secs
mq rbx naof-key-secs
aqs string
mq rsi string
aqs naof-string-secs
mq rcx naof-string-secs
aqs grid
mq r15 grid
aqs equations
mq rdx equations
aqs views
mq r14 views
aqs sret
mq r13 sret
aqs sum
nao r8
mq r8 sum
aqs site
mq r8 site
aqs cstring
aqs naof-secs-in-quad
mov 8 r8
mq r8 naof-secs-in-quad
aqs csite
aqs naof-0quads
aqs naof-0secs
aqs naof-1quads
aqs naof-1secs

##########################################################################################################
# obtain-grid-secs
##########################################################################################################
mq grid rdi
mq naof-string-secs rsi
add 8 rsi
mq equations r11
addc equations naof-grid-secs r11
lea 3 rip r13
dst r11
mq rax cstring

##########################################################################################################
# checksum-salt
##########################################################################################################
nao r8
nao r9
nao r10
mq string rsi
mq naof-string-secs rcx
s sum-init
	cmp r8 rcx
	st je sum-com
	movs 0 rsi r9
	add r9 r10
	add 1 r8
	add 1 rsi
	st jmp sum-init
s sum-com
mq r10 sum
mq cstring rsi
mq naof-string-secs r8
add r8 rsi
mov r10 0 rsi

##########################################################################################################
# calculate-8-1-sites&naofs
##########################################################################################################
mq sum rax
nao rdx
divq naof-string-secs
mq rdx csite

mq csite r8
mq naof-string-secs r9
sub r8 r9
mq r9 naof-0secs
mq naof-string-secs r8
sub r9 r8
mq r8 naof-1secs

mq naof-0secs rax
nao rdx
divq naof-secs-in-quad
mq rax naof-0quads
factq naof-secs-in-quad rax
mq naof-0secs r8
sub rax r8
mq r8 naof-0secs

mq naof-1secs rax
nao rdx
divq naof-secs-in-quad
mq rax naof-1quads
factq naof-secs-in-quad rax
mq naof-1secs r8
sub rax r8
mq r8 naof-1secs

##########################################################################################################
# cypher
##########################################################################################################
mq naof-0quads r8
nao r9
mq csite r15
s cq-init
	cmp r8 r9
	st je cq-com

	mov r15 rax
	nao rdx
	divq naof-key-secs
	mq naof-key-secs r11
	sub 8 r11
	cmp r11 rdx
	st jb 11-keyf-com
		add 8 rdx
		mq naof-key-secs r11
		sub r11 rdx
	s 11-keyf-com
	mq key rdi
	add rdx rdi
	mov 0 rdi r10
	mq string rsi
	add r15 rsi
	mov 0 rsi r12
	add r10 r12
	mq cstring r14
	add r15 r14
	mov r12 0 r14

	add 1 r9
	add 8 r15
	st jmp cq-init
s cq-com

mq naof-0secs r8
nao r9
nao r10
nao r12
s cs-init
	cmp r8 r9
	st je cs-com

	mov r15 rax
	nao rdx
	divq naof-key-secs
	mq key rdi
	add rdx rdi
	movs 0 rdi r10
	mq string rsi
	add r15 rsi
	movs 0 rsi r12
	add r10 r12
	mq cstring r14
	add r15 r14
	movs r12 0 r14

	add 1 r9
	add 1 r15
	st jmp cs-init
s cs-com

mq naof-1quads r8
nao r9
nao r15
s oq-init
	cmp r8 r9
	st je oq-com

	mov r15 rax
	nao rdx
	divq naof-key-secs
	mq naof-key-secs r11
	sub 8 r11
	cmp r11 rdx
	st jb 11-1keyf-com
		add 8 rdx
		mq naof-key-secs r11
		sub r11 rdx
	s 11-1keyf-com
	mq key rdi
	add rdx rdi
	mov 0 rdi r10
	mq string rsi
	add r15 rsi
	mov 0 rsi r12
	add r10 r12
	mq cstring r14
	add r15 r14
	mov r12 0 r14

	add 1 r9
	add 8 r15
	st jmp oq-init
s oq-com

mq naof-1secs r8
nao r9
nao r10
nao r12
s os-init
	cmp r8 r9
	st je os-com

	mov r15 rax
	nao rdx
	divq naof-key-secs
	mq key rdi
	add rdx rdi
	movs 0 rdi r10
	mq string rsi
	add r15 rsi
	movs 0 rsi r12
	add r10 r12
	mq cstring r14
	add r15 r14
	movs r12 0 r14

	add 1 r9
	add 1 r15
	st jmp os-init
s os-com

#init
#com
##########################################################################################################
# com-com
##########################################################################################################
mq sum rbx
mq cstring rax
mq naof-0quads r8
mq naof-0secs r9
mq naof-1quads r10
mq naof-1secs r11
mq csite r12
mq sret r13
add 1000 rsp
dst r13

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
