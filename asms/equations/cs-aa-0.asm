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

aqs lesser-site
aqs greater-site
mq str0-site r8
mq str1-site r9
cmp r8 r9
st ja set-lesser-str-0-init
s set-lesser-str-1-init
	mq r9 lesser-site
	mq r8 greater-site
	st jmp set-lesser-str-0-com
s set-lesser-str-1-com
s set-lesser-str-0-init
	mq r8 lesser-site
	mq r9 greater-site
s set-lesser-str-0-com

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
	mq greater-site r9
	cmp r8 r9
	st je compair-equal-wide-spaces-com
	mq lesser-site r9
	cmp r8 r9
	st je set-for-equal-wds-init
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

st jmp set-for-equal-wds-com
# wds | whatever-duel-scoped
s set-for-equal-wds-init
	mq str0-site r8
	mq str1-site r9
	cmp r8 r9
	st je wds-equal-init
	st ja wds-str0-isl-init
	st jb wds-str1-isl-init
	s wds-str0-isl-init
		mq riw-code r8
		mq r8 liw
	s wds-str0-isl-com
	st jmp wds-equal-com
	s wds-str1-isl-init
		mov 1 r8
		mq r8 liw
	s wds-str1-isl-com
	st jmp wds-equal-com
	s wds-equal-init
		nao r8
		mq r8 liw
	s wds-equal-com
s set-for-equal-wds-com

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
#com
