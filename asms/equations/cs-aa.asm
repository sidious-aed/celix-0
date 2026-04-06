##########################################################################################################
# cs | compair-strings
##########################################################################################################
# rdi | str0
# rdx | str0-site
# rsi | str1
# rcx | str1-site
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs str0
mq rdi str0
aqs str0-site
mq rdx str0-site
aqs str1
mq rsi str1
aqs str1-site
mq rcx str1-site
# liw | left-is-wider
aqs riw-code
mov ffffffffffffffff r8
mq r8 riw-code
aqs liw
nao r8
mq r8 liw

ent i-sim i sim\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
#sys

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
lq str0-site rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq str1-site rsi
mov 1 rax
sys
# close
mqb file rdi
mov 3 rax
sys

mq str0-site r8
mq str1-site r9
cmp r8 r9
st jne strings-are-in-naof-secs-diff-init

aqs esite
nao r8
mq r8 esite
s compair-equal-wide-spaces-init
	mq esite r8
	mq str0 rsi
	add r8 rsi
	nao r9
	movs 0 rsi r9
	mq str1 rdi
	add r8 rdi
	nao r10
	movs 0 rdi r10
	cmp r9 r10
	st jne set-and-com-init
	add 1 r8
	mq r8 esite
	mq str0-site r9
	cmp r8 r9
	st je compair-equal-wide-spaces-com
	st jmp compair-equal-wide-spaces-init
s compair-equal-wide-spaces-com
st jmp set-and-com-com
s set-and-com-init
	st jb str1-is-wider-init-0
	s str0-is-wider-init-0
		mq riw-code r8
	s str0-is-wider-com-0
	st jmp str1-is-wider-com-0
	s str1-is-wider-init-0
		mov 1 r8
	s str1-is-wider-com-0
	mq r8 liw
s set-and-com-com

st jmp strings-are-in-naof-secs-diff-com
s strings-are-in-naof-secs-diff-init
	st jb str1-is-wider-init
	s str0-is-wider-init
		mq riw-code r8
	s str0-is-wider-com
	st jmp str1-is-wider-com
	s str1-is-wider-init
		mov 1 r8
	s str1-is-wider-com
	mq r8 liw
s strings-are-in-naof-secs-diff-com

##########################################################################################################
# com
##########################################################################################################
mq liw rax
add 1000 rsp
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
lq naof-entree-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
