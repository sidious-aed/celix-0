##########################################################################################################
# get-libc-site
##########################################################################################################
# rdx | equations
# rbx | vecters
# r12 | views
# r13 | sret
% equations
% vecters
% views
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 20000 rsp
aqs equations
mqb rdx equations
aqs vecters
mqb rbx vecters
aqs views
mqb r12 views
aqs maps-name
isr 200
aqs maps-name-site
nao r8
mqb r8 maps-name-site
entb jsec \n
entb hsec -
entb cmp0 /proc/
entb cmp1 /maps
entb libc-name libc.so.6
entb libc-name2 libc-2.27.so
mqb r8 cmp0-site
aqs pid
aqs cs
isr 10000
aqs cs-site

lentb cmp0 rsi
lqb maps-name rdi
mov 6 rcx
mqb equations r11
addc equations com r11
dct r11
mqb maps-name-site r8
add rax r8
mqb r8 maps-name-site

# pid
mov 27 rax
sys
mqb rax pid

mqb pid rdi
lqb maps-name rsi
mqb maps-name-site r8
add r8 rsi
mov a rbx
mqb equations r8
addc equations number-to-entree r8
dct r8
mqb maps-name-site r8
add rax r8
mqb r8 maps-name-site

lentb cmp1 rsi
lqb maps-name rdi
mqb maps-name-site r8
add r8 rdi
mov 5 rcx
mqb equations r11
addc equations com r11
dct r11
mqb maps-name-site r8
add rax r8
mqb r8 maps-name-site
lqb maps-name rsi
mqb maps-name-site r8
add r8 rsi
nao r8
movs r8 0 rsi

mov 1 rdi
lqb maps-name rsi
mqb maps-name-site rdx
mov 1 rax
#sys

aqs file
# open-read
nao rsi
lqb maps-name rdi
mov 2 rax
sys
mq rax file
# read
mq file rdi
mov 10000 rdx
lqb cs rsi
mov 0 rax
sys
mqb rax cs-site
# close
mq file rdi
mov 3 rax
sys

mov 1 rdi
lqb cs rsi
mqb cs-site rdx
mov 1 rax
#sys

mov 1 rdi
lentb jsec rsi
mov 1 rdx
mov 1 rax
#sys

entb rsn-site sn-site
entb rn-site n-site
entb rstack-site stack-site
aqs name
aqs name-site
aqs rsite
nao r8
mqb r8 rsite
aqs orsite
aqs sec-site
aqs sn-site
aqs n-site
aqs stack-site
s glc-init
	mqb rsite r8
	mqb r8 orsite

	mqb rsite r8
	mqb cs-site r9
	cmp r9 r8
	st je glc-com

	mqb rsite r8
	lqb cs rdi
	add r8 rdi
	mqb cs-site rdx
	sub r8 rdx
	lent jsec rsi
	mov 1 rcx
	mq equations r11
	addc equations seek-space r11
	dct r11
	mqb rax sec-site

	mqb sec-site rax
	mqb rsite r8
	add rax r8
	add 1 r8
	mqb r8 rsite

	lqb cs rsi
	mqb orsite r8
	add r8 rsi
	mqb sec-site r8
	add r8 rsi
	sub 1 rsi
	nao r9
	nao r10
	s seek-name-init
		movs 0 rsi r10
		cmp 20 r10
		st je seek-name-com
		cmp 2f r10
		st je seek-name-com
		sub 1 rsi
		add 1 r9
		cmp r9 r8
		st je seek-name-com
		st jmp seek-name-init
	s seek-name-com
	add 1 rsi
	mqb rsi name
	mqb r9 name-site

	mov 1 rdi
	mqb name rsi
	mqb name-site rdx
	mov 1 rax
	#sys

	mov 1 rdi
	lentb jsec rsi
	mov 1 rdx
	mov 1 rax
	#sys

	lentb libc-name rdi
	mov 9 rdx
	mqb name rsi
	mqb name-site rcx
	mqb equations r11
	addc equations compair-spaces r11
	dct r11
	mqb rax sn-site

	lentb rsn-site rsi
	mqb sn-site rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	mqb sn-site rax
	cmp 1 rax
	st je is-libc-init

	lentb libc-name2 rdi
	mov c rdx
	mqb name rsi
	mqb name-site rcx
	mqb equations r11
	addc equations compair-spaces r11
	dct r11
	mqb rax sn-site

	lentb rsn-site rsi
	mqb sn-site rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	dct r11

	mqb sn-site rax
	cmp 1 rax
	st je is-libc-init
	st jmp is-libc-com

	s is-libc-init
	mov 1 rdi
	mqb orsite r8
	lqb cs rsi
	add r8 rsi
	mqb sec-site rdx
	add 1 rdx
	mov 1 rax
	#sys

	lqb cs rsi
	mqb orsite r8
	nao r9
	nao r10
	s seek-b16-com-init
		movs 0 rsi r10
		cmp 2d r10
		st je seek-b16-com-com
		add 1 r9
		add 1 rsi
		st jmp seek-b16-com-init
	s seek-b16-com-com
	mqb r9 n-site

	lentb rn-site rsi
	mqb n-site rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	#dct r11

	mov 1 rdi
	lqb cs rsi
	mqb orsite r8
	add r8 rsi
	mqb n-site rdx
	mov 1 rax
	#sys

	lqb cs rsi
	mqb orsite r8
	add r8 rsi
	mqb n-site rcx
	mov 10 rbx
	mqb equations r12
	addc equations entree-to-number r12
	dct r12
	mqb rax stack-site

	lentb rstack-site rsi
	mqb stack-site rdi
	mov 10 rbx
	mqb equations rdx
	mqb views r11
	addc views view-number r11
	#dct r11

	st jmp glc-com
	s is-libc-com

st jmp glc-init
s glc-com

mqb stack-site rax
add 20000 rsp
pop rbp
ret

#init
aqs sampler
mqb rbp sampler
ent fn droid/clerk-com.secs
aqs file
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
mov 8 rdx
lqb naof-secs rdx
mqb entree rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com
