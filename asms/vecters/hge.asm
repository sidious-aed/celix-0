##########################################################################################################
# hge | hash-get-element
##########################################################################################################
# rbx | hash-name
# rcx | record-site
# rsi | element-name
# rdi | wrecord
% equations
% views
% vects
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs hash-name
mq rbx hash-name
aqs record-site
mq rcx record-site
aqs element-name
mq rsi element-name
aqs wrecord
mq rdi wrecord
aqs equations
mq r12 equations
aqs views
mq r13 views
aqs vects
mq r14 vects
ent jsect \n

##########################################################################################################
# jypsyfy-params
##########################################################################################################
aqs element-name-site
mq element-name rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax element-name-site

ent relement-name-site element-name-site
lent relement-name-site rsi
mq element-name-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

aqs name-site
mq hash-name rdi
mq equations r15
addc equations get-naof-secs r15
dct r15
mq rax name-site

ent rname-site hash-name-site
lent rname-site rsi
mq name-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# generate-names
##########################################################################################################
mq hash-name rsi
mq hash-name-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

aqs hash-meta-name
isr 400
aqs hash-meta-name-site
mq hash-name rsi
lq hash-meta-name rdi
mq name-site rcx
mq rcx hash-meta-name-site
mq equations r11
addc equations com r11
dct r11

ent hash-meta-name-com .meta
lent hash-meta-name-com rsi
lq hash-meta-name rdi
mq hash-meta-name-site r8
add r8 rdi
mov 5 rcx
add rcx r8
mq r8 hash-meta-name-site
mq equations r11
addc equations com r11
dct r11
lq hash-meta-name rsi
mq hash-meta-name-site r8
add r8 rsi
nao r9
movs r9 0 rsi

lq hash-meta-name rsi
mq hash-meta-name-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11
lent jsect rsi
mov 1 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

aqs hash-data-name
isr 400
aqs hash-data-name-site
mq hash-name rsi
lq hash-data-name rdi
mq name-site rcx
mq rcx hash-data-name-site
mq equations r11
addc equations com r11
dct r11

ent hash-data-name-com .data
lent hash-data-name-com rsi
lq hash-data-name rdi
mq hash-data-name-site r8
add r8 rdi
mov 5 rcx
add rcx r8
mq r8 hash-data-name-site
mq equations r11
addc equations com r11
dct r11
lq hash-data-name rsi
mq hash-data-name-site r8
add r8 rsi
nao r9
movs r9 0 rsi

lq hash-data-name rsi
mq hash-data-name-site rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11
lent jsect rsi
mov 1 rcx
mq equations r12
mq views r11
addc views wtlr r11
dct r11

##########################################################################################################
# get-hash-meta
##########################################################################################################
aqs hash-meta-site
aqs hash-meta-naof-esecs

aqs file
# open-read
nao rsi
lq hash-meta-name rdi
mov 2 rax
sys
mq rax file
# read
mq file rdi
mov 10 rdx
lq hash-meta-site rsi
mov 0 rax
sys
# close
mq file rdi
mov 3 rax
sys

ent rhash-meta-site hash-meta-site
lent rhash-meta-site rsi
mq hash-meta-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rhash-meta-naof-esecs hash-meta-naof-esecs
lent rhash-meta-naof-esecs rsi
mq hash-meta-naof-esecs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# get-hash-data
##########################################################################################################
aqs hash-data-site
aqs hash-data-naof-esecs

# open-read
nao rsi
lq hash-data-name rdi
mov 2 rax
sys
mq rax file
# read
mq file rdi
mov 10 rdx
lq hash-data-site rsi
mov 0 rax
sys
# close
mq file rdi
mov 3 rax
sys

ent rhash-data-site hash-data-site
lent rhash-data-site rsi
mq hash-data-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rhash-data-naof-esecs hash-data-naof-esecs
lent rhash-data-naof-esecs rsi
mq hash-data-naof-esecs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

##########################################################################################################
# calc-read-site
##########################################################################################################
aqs naof-meta-esecs
mov 10 r8
mq r8 naof-meta-esecs
aqs naof-data-esecs
mov 20 r8
mq r8 naof-data-esecs
aqs data-key
aqs data-key-site
aqs data-value
aqs data-value-site
aqs meta-at-site

aqs record-data-site
aqs record-data-site-site
mq record-site r8
factq naof-meta-esecs r8
add 10 r8
mq r8 meta-at-site

ent rrecord-site record-site
lent rrecord-site rsi
mq record-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rmeta-at-site meta-at-site
lent rmeta-at-site rsi
mq meta-at-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

# open-read
nao rsi
lq hash-meta-name rdi
mov 2 rax
sys
mq rax file
# lseek
mq file rdi
mq meta-at-site rsi
nao rdx
mov 8 rax
sys
# read
mq file rdi
mov 10 rdx
lq record-data-site rsi
mov 0 rax
sys
# close
mq file rdi
mov 3 rax
sys

ent rrecord-data-site-site record-data-site-site
lent rrecord-data-site-site rsi
mq record-data-site-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

ent rrecord-data-site record-data-site
lent rrecord-data-site rsi
mq record-data-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views wtlrfvn r11
dct r11

aqs data-key
aqs data-key-site
aqs data-value
aqs data-value-site
aqs rs
isr 1500

ent rdata-key data-key
ent rdata-key-site data-key-site
ent rdata-value data-value
ent rdata-value-site data-value-site
ent rsite site
aqs site
ent rdata-at data-at
aqs data-at
mq record-data-site r8
mq r8 site
aqs com-site
mq record-data-site-site r9
add r9 r8
mq r8 com-site
aqs wrecord-site
s seek-record-for-element-init
	lent rsite rsi
	mq site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	mq site r8
	factq naof-data-esecs r8
	add 10 r8
	mq r8 data-at

	lent rdata-at rsi
	mq data-at rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	# open-read
	nao rsi
	lq hash-data-name rdi
	mov 2 rax
	sys
	mq rax file
	# lseek
	mq file rdi
	mq data-at rsi
	nao rdx
	mov 8 rax
	sys
	# read
	mq file rdi
	mov 20 rdx
	lq data-key rsi
	mov 0 rax
	sys
	# close
	mq file rdi
	mov 3 rax
	sys

	lent rdata-key rsi
	mq data-key rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	lent rdata-key-site rsi
	mq data-key-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	lent rdata-value rsi
	mq data-value rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	lent rdata-value-site rsi
	mq data-value-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views wtlrfvn r11
	dct r11

	# open-read
	nao rsi
	mq hash-name rdi
	mov 2 rax
	sys
	mq rax file
	# lseek
	mq file rdi
	mq data-key rsi
	nao rdx
	mov 8 rax
	sys
	# read
	mq file rdi
	lq rs rsi
	mq data-key-site rdx
	mov 0 rax
	sys
	# close
	mq file rdi
	mov 3 rax
	sys

	lq rs rsi
	mq data-key-site rcx
	mq equations r12
	mq views r11
	addc views wtlr r11
	dct r11

	lq rs rdi
	mq data-key-site rdx
	mq element-name rsi
	mq element-name-site rcx
	mq equations r11
	addc equations compair-spaces r11
	dct r11
	cmp 1 rax
	st jne is-element-name-com
		# open-read
		nao rsi
		mq hash-name rdi
		mov 2 rax
		sys
		mq rax file
		# lseek
		mq file rdi
		mq data-value rsi
		nao rdx
		mov 8 rax
		sys
		# read
		mq file rdi
		lq rs rsi
		mq data-value-site rdx
		mov 0 rax
		sys
		# close
		mq file rdi
		mov 3 rax
		sys

		lq rs rsi
		mq data-value-site rcx
		mq equations r12
		mq views r11
		addc views wtlr r11
		dct r11

		mq data-value-site r8
		mq r8 wrecord-site

		lq rs rsi
		mq wrecord rdi
		mq data-value-site rcx
		mq equations r11
		addc equations com r11
		dct r11
		st jmp seek-record-for-element-com
	s is-element-name-com

	mq site r8
	add 1 r8
	mq r8 site
	mq com-site r9
	cmp r8 r9
	st je seek-record-for-element-com
	st jmp seek-record-for-element-init
s seek-record-for-element-com

mq wrecord-site rax
add 10000 rsp
ret

##########################################################################################################
# com
##########################################################################################################
add 10000 rsp
ret

#init
ent fn droid/clerk-com.secs
aqs file
# open-write
mov 1f8 rdx
mov 441 rsi
lent fn rdi
mov 2 rax
sys
mq rax file
# write
mq file rdi
mov 8 rdx
lq naof-quads rsi
mov 1 rax
sys
# write
mq file rdi
mov 8 rdx
lq naof-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com

#init
mq entree rsi
mq destination rdi
mov rdi r8
mq naof-quad-secs r9
add r9 r8
s com-quads-init
	mov 0 rsi r10
	mov r10 0 rdi
	add 8 rsi
	add 8 rdi
	cmp rdi r8
	st je com-quads-com
	st jmp com-quads-init
s com-quads-com
#com
#init
aqs scv-code
mq r10 scv-code
aqs views
mq r12 views
aqs scv
mq r13 scv
aqs equations
mq r14 equations
ent rscv scv
ent rnaof-quads naof-quads
ent rnaof-secs naof-secs
mq scv-code r10
mov aed123123 r11
cmp r10 r11
st jne see-scope-com
	lent rscv rsi
	mq scv rdi
	mov 18 rcx
	mov 10 rbx
	nao r10
	mq equations rdx
	mq views r11
	addc views view-space r11
	dct r11

	ent rdestination destination
	lent rdestination rsi
	mq destination rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	ent rdestination-com destination-com
	lent rdestination-com rsi
	mq destination rdi
	mq naof-quad-secs r8
	add r8 rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rnaof-quads rsi
	mq naof-quads rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11

	lent rnaof-secs rsi
	mq naof-secs rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	dct r11
s see-scope-com
#com
