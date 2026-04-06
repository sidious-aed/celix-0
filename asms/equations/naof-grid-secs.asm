##########################################################################################################
# naof-grid-secs
##########################################################################################################
# rdi | grid (3 quads)
#       0 | stack-site
#       1 | at-site
#       2 | breadth
# rsi | naof-secs
##########################################################################################################
# init
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs grid
mqb rdi grid
aqs naof-secs
mqb rsi naof-secs
aqs expansion-facter
mov 2 r13
mqb r13 expansion-facter
aqs naof-mmap-secs
nao r8
mqb r8 naof-mmap-secs
ent init-entree initialising grid.\n
aqs naof-init-entree-secs
mov 13 r8
mqb r8 naof-init-entree-secs
ent expansion-entree expanding grid.\n
aqs naof-expansion-entree-secs
mov 10 r8
mqb r8 naof-expansion-entree-secs
aqs grid-at
mqb r8 grid-at
aqs grid-breadth
mqb r8 grid-breadth


##########################################################################################################
# grid-init
##########################################################################################################
aqs stack-site
mqb grid r8
mov 0 r8 r8
mqb r8 grid-at
cmp 0 r8
st jne init-grid-com
s init-grid-init
cmp f4240 rsi
st jb custom-init-naof-secs-com
add 1 rsi
factq expansion-facter rsi
st jmp init-naof-secs-com
s custom-init-naof-secs-com
	mov f4240 rsi
	s init-naof-secs-com
	mqb rsi grid-breadth

	mov 1 rdi
	lentb init-entree rsi
	mqb naof-init-entree-secs rdx
	mov 1 rax
	sys

	mqb grid-breadth rsi
	mqb rsi naof-mmap-secs
	mqb grid r11
	mov rsi 10 r11
	# anonomous-mmap
	nao rdi
	mov rdi 8 r11
	mov 7 rdx
	mov 22 r10
	nao r9
	nao r8
	mov 9 rax
	sys
	mqb grid r11
	mov rax 0 r11
	mqb rax stack-site


s init-grid-com

##########################################################################################################
# grid-expansion
##########################################################################################################
mqb grid r11
mov 8 r11 r8
mqb naof-secs r9
add r8 r9
#mqb r9 grid-at
mov 10 r11 r10
mqb r10 grid-breadth
cmp r10 r9
st jb expansion-com


s expansion-init
	mov 1 rdi
	lentb expansion-entree rsi
	mqb naof-expansion-entree-secs rdx
	mov 1 rax
	sys

	mqb grid r11
	mov 10 r11 r10
	# anonomous-mmap
	nao rdi
	mov r10 rsi
	mqb naof-secs r8
	add r8 rsi
	factqb expansion-facter rsi
	mov rsi 10 r11
	mqb rsi naof-mmap-secs
	mov 7 rdx
	mov 22 r10
	nao r9
	nao r8
	mov 9 rax
	sys
	mqb grid r11
	mov rax 0 r11
	nao r8
	mov r8 8 r11
s expansion-com
#init
#com

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
lqb grid rsi
mov 1 rax
sys
# write
mqb file rdi
mov 8 rdx
lqb stack-site rsi
mov 1 rax
sys
# write
mqb file rdi
mov 8 rdx
lqb naof-secs rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys

mqb grid r11
mov 0 r11 rax
mov 8 r11 r8
mqb naof-secs r9
add r9 r8
mov r8 8 r11
add r9 rax
mqb rax stack-site

##########################################################################################################
# com-com
##########################################################################################################
mqb stack-site rax
add 1000 rsp
pop rbp
ret

#init
#com
