##########################################################################################################
# cr
##########################################################################################################
# cr
# --
# at init setus up self-pass at the sparchives-as-buss potentialages.
# --
# rdi | naof-secs
# rbx | is-init
##########################################################################################################
# com
##########################################################################################################
push rbp
mov rsp rbp
sub 1000 rsp
aqs naof-secs
mqb rdi naof-secs
aqs rule
nao r8
mqb r8 rule
aqs sim
mqb r8 sim
entb i-sim i sim.\n
entb spsimfn droid/cr.sim
entb rmode0 mode is just.\n
entb rmode1 in expansion.\n
aqs eintandra-site
mov e r11
mqb r11 eintandra-site
aqs jrule
# alias jingle
aqs extends
nao r8
mqb r8 extends
aqs crf
mov 2 r8
mqb r8 crf

cmp 1 rbx
st jne init-com

s init-init
sub 8 rsp
nao rax
push rax
sub 8 rsp
secs 6a 00
	# anonomous-mmap
	nao rdi
	mov 3d0910 rsi
	mov 7 rdx
	mov 22 r10
	nao r9
	nao r8
	mov 9 rax
	sys
add 10 rsp
	mqb rax rule
	mqb rax extends

	mqb rule r8
	nao r9
	mov r9 0 r8
	mqb r9 jrule
	mov 3d0900 r9
	mov r9 8 r8

	mov 1 rdi
	lentb spsimfn rsi
	mov c rdx
	mov 1 rax
	#sys

	# unlink
	lentb spsimfn rdi
	mov 57 rax
	sys
	# open-write
	mov 1f8 rdx
	mov 41 rsi
	lentb spsimfn rdi
	mov 2 rax
	sys
	mqb rax sim
	# write
	mqb sim rdi
	mov 8 rdx
	lqb rule rsi
	mov 1 rax
	sys
	# close
	mqb sim rdi
	mov 3 rax
	sys
	st jmp cr-com
s init-com

##########################################################################################################
# jinit
##########################################################################################################

# open-read
nao rsi
lentb spsimfn rdi
mov 2 rax
sys
mqb rax sim
# read
mqb sim rdi
mov 8 rdx
lqb rule rsi
mov 0 rax
sys
# close
mq sim rdi
mov 3 rax
sys

##########################################################################################################
# calc-4-logic
##########################################################################################################
aqs mode
mqb naof-secs r10
mqb rule r8
# site
mov 0 r8 r11
# site
# breadth
mov 8 r8 r12
# breadth
add r10 r11
cmp r11 r12
st jae set-m1-com
mov 1 r8
mqb r8 mode
st jmp set-m0-com
s set-m1-com
nao r8
mqb r8 mode
s set-m0-com

mqb mode r10
cmp 0 r10
st je mode0-init
cmp 1 r10
st je mode1-init

##########################################################################################################
# mode-1 expansion
##########################################################################################################
s mode1-init
	mov 1 rdi
	lentb rmode1 rsi
	mqb eintandra-site rdx
	mov 1 rax
	sys

	# anonomous-mmap
	nao rdi
	mqb rule rsi
	# breadth
	mov 8 rsi rsi
	factqb crf rsi
	mqb rsi jrule
	add 10 rsi
	mov 7 rdx
	mov 22 r10
	nao r9
	nao r8
	mov 9 rax
	sys
	mqb rax rule
	mqb rax extends

	# unlink
	lentb spsimfn rdi
	mov 57 rax
	sys
	# open-write
	mov 1f8 rdx
	mov 41 rsi
	lentb spsimfn rdi
	mov 2 rax
	sys
	mqb rax sim
	# write
	mqb sim rdi
	mov 8 rdx
	lqb rule rsi
	mov 1 rax
	sys
	# close
	mqb sim rdi
	mov 3 rax
	sys

	mqb rule r8
	nao r9
	mov r9 0 r8
	mqb jrule r9
	mov r9 8 r8
s mode1-com

##########################################################################################################
# mode-0 expansion
##########################################################################################################
s mode0-init
	mov 1 rdi
	lentb rmode0 rsi
	mqb eintandra-site rdx
	mov 1 rax
	sys

	mqb rule rax
	mov 0 rax r9
	add 10 r9
	add r9 rax
	mqb rax extends
s mode0-com

##########################################################################################################
# calc-jrule
##########################################################################################################
mqb rule r8
mov 0 r8 r10
mqb naof-secs r9
add r9 r10
mov r10 0 r8
mqb r10 jrule
#init
mov r10 r11
mqb r11 jrule
mqb jrule r10
mov r10 0 r8
#com

s cr-com
##########################################################################################################
# com
##########################################################################################################
mqb extends rax
mqb rule rbx
add 1000 rsp
pop rbp
ret

#init
entb fn droid/clerk-com.secs
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
lqb jrule rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys

aqs pt0
aqs pt1
s see-task-init
	lqb pt0 rdi
	lqb pt0 rsi
	mov 23 rax
	sys
	st jmp see-task-init
s see-task-com
#com
