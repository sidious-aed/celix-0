##########################################################################################################
# equations-main
##########################################################################################################
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 4c4b40 rsp
aqs equations
mq r9 equations
aqs views
mq r10 views
aqs cf
mq r11 cf
ent i-sim i sim.\n
ent jsect \n

mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

##########################################################################################################
# cr
##########################################################################################################
ent rstack-site stack-site
ent rcs-at cs-at
aqs cs
isr 3d0908
lq cs rdi
nao r8
mov r8 0 rdi
mov 3d0900 r8
mov r8 8 rdi

lent rcs-at rsi
lq cs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs site0
lq cs rdi
mov 100 rsi
mq equations r11
mq views rbx
addc equations cr r11
dct r11
mq rax site0

lent rcs-at rsi
mq site0 rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs back
s seek-to-exit-group-init
	lq cs rdi
	mov 10000 rsi
	mq equations r11
	mq views rbx
	addc equations cr r11
	dct r11
	mq rax site0

	mq back rbx
	cmp rax rbx
	st jae seek-to-exit-group-com

	mq site0 rax
	mq rax back

	lent rcs-at rsi
	mq site0 rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11
	st jmp seek-to-exit-group-init
s seek-to-exit-group-com

#init
#com
##########################################################################################################
# com
##########################################################################################################
add 4c4b40 rsp
ret

#init
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
lq b16-number rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys
#com

#init
aqs time-secs
nao r8
mqb r8 time-secs
aqs time-micro-secs
mov aed r8
mqb r8 time-micro-secs
s task0-init
# nanosleep
lqb time-seconds rdi
mov 23 rax
sys
st jmp task0-init
s task0-com
#com
