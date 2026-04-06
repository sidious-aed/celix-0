##########################################################################################################
# vc | view-chart
##########################################################################################################
# rdi | ci
# rsi | relay
# r14 | scv
# r15 | cs
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 1e8480 rsp
aqs ci
mq rdi ci
aqs chart
mov 0 rdi r8
mq r8 chart
aqs chart-site
mov 8 rdi r8
mq r8 chart-site
aqs index
mov 10 rdi r8
mq r8 index
aqs index-site
mov 18 rdi r8
mq r8 index-site
aqs relay
mq rsi relay
aqs scv
mq r14 scv
aqs cs
mq r15 cs
aqs equations
mq rdx equations
aqs views
mq rbx views
aqs cf
mq r12 cf
aqs scv-naof-esecs
mov 18 r8
mq r8 scv-naof-esecs
ent jsect \n
aqs view-space
isr 19f0a0
aqs vss
#nao r8
#mq r8 vss
aqs vsb
#mov 21 r8
mov 300 r8
#mov 19f0a0 r8
aqs vsb-site
nao r8
mq r8 vsb-site
mq r8 vsb
ent col-init | 
ent col-com  |
aqs view-nao
nao r8
mq r8 view-nao

mov 1 rdi
mq chart rsi
mq chart-site rdx
mov 1 rax
#sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
#sys

mq scv r8
nao r9
mov r9 0 r8

ent rscv scv
lent rscv rsi
mq scv rdi
mov 18 rcx
mov 0 rdi r8
factq scv-naof-esecs r8
add r8 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

aqs relay-site
mq relay rdi
mq equations r11
addc equations get-naof-secs r11
dct r11
mq rax relay-site

ent rrelay-site relay-site
lent rrelay-site rsi
mq relay-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

aqs relayh-site
lq view-space rsi
mq relay-site r8
add 4 r8
mq r8 relayh-site
mov rsi rdi
add r8 rdi
mov 2d r9
s ss-replicate-1-init
	movs r9 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je ss-replicate-1-com
	st jmp ss-replicate-1-init
s ss-replicate-1-com
mov a r9
movs r9 0 rsi
add 1 r8
mq r8 vss

lq view-space rsi
mq vss r8
add r8 rsi
mov 7c r9
movs r9 0 rsi
add 1 rsi
mov 20 r9
movs r9 0 rsi
add 1 rsi
add 2 r8
mq r8 vss

mov rsi rdi
mq relay rsi
mq relay-site rcx
mq vss r8
add rcx r8
mq r8 vss
mq equations r11
addc equations com r11
dct r11

lq view-space rsi
mq vss r8
add r8 rsi
mov 20 r9
movs r9 0 rsi
add 1 rsi
mov 7c r9
movs r9 0 rsi
add 1 rsi
mov a r9
movs r9 0 rsi
add 3 r8
mq r8 vss

lq view-space rsi
mq vss r8
add r8 rsi
mov rsi rdi
mq relayh-site r9
add r9 r8
add r9 rdi
mov 2d r10
s ss-replicate-2-init
	movs r10 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je ss-replicate-2-com
	st jmp ss-replicate-2-init
s ss-replicate-2-com
mov a r10
movs r10 0 rsi
add 1 r8
mq r8 vss

mov 1 rdi
lq view-space rsi
mq vss rdx
mov 1 rax
sys
nao r8
mq r8 vss

aqs is-com
aqs chart-at
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
nao r8
mq r8 cvalue-site
aqs chart-com
mq chart r8
mq r8 chart-at
mq chart-site r9
add r9 r8
mq r8 chart-com

ent rchart chart
lent rchart rsi
mq chart rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

ent rchart-at chart-at
lent rchart-at rsi
mq chart-at rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

mov 1 rdi
mq chart-at rsi
mq chart-site rdx
mov 1 rax
sys

ent ris-already is-already
s calc-scopes-init
	mq chart-at rdi
	mq equations r12
	mq cf r11
	addc cf jp r11
	dct r11
	mq rax is-com
	mq rbx chart-at
	mq rsi ckey
	mq rcx ckey-site
	mq rdi cvalue
	mq rdx cvalue-site
	mov 1 rdi
	mq ckey rsi
	mq ckey-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mov 1 rdi
	mq cvalue rsi
	mq cvalue-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	aqs is-already
	nao r8
	mq r8 is-already
	aqs scv-site
	nao r8
	aqs scvr
	aqs scvr-site
	aqs scvr-value
	aqs scv-record
	mq r8 scv-site
	s seek-scv-init
		mq scv-site r10
		mq scv r8
		mov 0 r8 r9
		cmp r10 r9
		st je seek-scv-com

		mq scv r8
		add 18 r8
		mq scv-site r9
		factq scv-naof-esecs r9
		add r9 r8
		mov 0 r8 r9
		mq r9 scvr
		mov 8 r8 r9
		mq r9 scvr-site
		mov 10 r8 r9
		mq r9 scvr-value
		mq r8 scv-record

		mq scvr rdi
		mq scvr-site rdx
		mq ckey rsi
		mq ckey-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		cmp 1 rax
		st je calc-scvr-init

		mq scv-site r10
		add 1 r10
		mq r10 scv-site
		st jmp seek-scv-init
	s seek-scv-com
	st jmp calc-scvr-com
	s calc-scvr-init
		mov 1 r8
		mq r8 is-already
		mq cvalue-site r8
		mq scvr-value r9
		cmp r8 r9
		st jae set-new-value-for-scvr-com
			mq scv-record r8
			mq cvalue-site r9
			mov r9 10 r8
		s set-new-value-for-scvr-com
	s calc-scvr-com

	aqs scvr-key
	aqs scvr-key-site
	aqs scvr-naof-secs
	mq is-already r8
	cmp 1 r8
	st je set-new-collumn-com
		mq ckey r8
		mq r8 scvr-key
		mq ckey-site r8
		mq r8 scvr-key-site

		mq ckey-site r8
		mq r8 scvr-naof-secs
		mq cvalue-site r9
		cmp r8 r9
		st jbe set-cvalue-site-for-anew-naof-secs-com
			mq r9 scvr-naof-secs
		s set-cvalue-site-for-anew-naof-secs-com

		mq scv rdi
		lq scvr-key rsi
		mq cs rbx
		mq equations rdx
		mq cf r11
		addc cf avec r11
		dct r11
		mq rax scv
	s set-new-collumn-com

	mq chart-at rsi
	mq chart-com rdi
	cmp rsi rdi
	st je calc-scopes-com
	st jmp calc-scopes-init
s calc-scopes-com

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

aqs naof-scv-records
mq scv r8
mov 0 r8 r9
mq r9 naof-scv-records

ent rnaof-scv-records naof-scv-records
lent rnaof-scv-records rsi
mq naof-scv-records rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11

aqs bscope-site
mov 1 r8
mq r8 bscope-site
aqs site
nao r8
mq r8 site
s calc-bscope-init
	mq scv r8
	add 18 r8
	mq site r12
	factq scv-naof-esecs r12
	add r12 r8
	mov 10 r8 r11
	mq bscope-site r12
	add r11 r12
	add 3 r12
	mq r12 bscope-site

	mq site r12
	add 1 r12
	mq r12 site
	mq naof-scv-records r9
	cmp r12 r9
	st je calc-bscope-com
	st jmp calc-bscope-init
s calc-bscope-com

ent rbscope-site bscope-site
lent rbscope-site rsi
mq bscope-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
#dct r11

lq view-space rsi
mov rsi rdi
mq bscope-site r8
add r8 rdi
mov 2d r10
s ss-replicate-3-init
	movs r10 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je ss-replicate-3-com
	st jmp ss-replicate-3-init
s ss-replicate-3-com
mov a r10
movs r10 0 rsi
mov 1 rdi
lq view-space rsi
mq bscope-site rdx
add 1 rdx
mov 1 rax
sys

#init
#com
lent rscv rsi
mq scv rdi
mov 18 rcx
mov 0 rdi r8
factq scv-naof-esecs r8
add r8 rcx
mov 10 rbx
nao r10
mq equations rdx
mq views r11
addc views view-space r11
dct r11

aqs scv-value
aqs scv-naof-secs
ent rcollumn-namev collumn-namev
nao r8
mq r8 site
s view-collumn-names-init
	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov 7c r9
	movs r9 0 rsi
	add 1 rsi
	mov 20 r9
	movs r9 0 rsi
	add 1 rsi
	add 2 r8
	mq r8 vss

	mq scv rsi
	add 18 rsi
	mq site r9
	factq scv-naof-esecs r9
	add r9 rsi
	mov 8 rsi rcx
	mq rcx scv-naof-secs
	mov 10 rsi r11
	mq r11 scv-value
	mov 0 rsi rsi
	lq view-space rdi
	mq vss r8
	add r8 rdi
	add rcx r8
	mq r8 vss
	mq equations r11
	addc equations com r11
	dct r11
#init
#com

	aqs naof-rep-secs
	mq scv-value r8
	mq scv-naof-secs r9
	sub r9 r8
	mov r8 rdi
	mq rdi naof-rep-secs

	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov rsi rdi
	mq naof-rep-secs r9
	add r9 rdi
	cmp rdi rsi
	st je ss-replicate-5-com
	add r9 r8
	mq r8 vss
	mov 20 r10
	s ss-replicate-5-init
		movs r10 0 rsi
		add 1 rsi
		cmp rsi rdi
		st je ss-replicate-5-com
		st jmp ss-replicate-5-init
	s ss-replicate-5-com
#init
#com

	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov 20 r9
	mov r9 0 rsi
	add 1 rsi

	mq site r10
	add 1 r10
	mq r10 site
	mq site r10
	mq naof-scv-records r11
	cmp r10 r11
	st jne just-add-to-vss-0-init
		mov 7c r9
		movs r9 0 rsi
		add 1 rsi
		mov a r9
		movs r9 0 rsi
		add 3 r8
		mq r8 vss
		st jmp just-add-to-vss-0-com
	s add-jsect-and-vss-0-com
	s just-add-to-vss-0-init
		add 1 r8
		mq r8 vss
	s just-add-to-vss-0-com

	mq site r8
	mq naof-scv-records r9
	cmp r8 r9
	st je view-collumn-names-com
	st jmp view-collumn-names-init
s view-collumn-names-com
mov 1 rdi
lq view-space rsi
mq vss rdx
mov 1 rax
sys

lq view-space rsi
mov rsi rdi
mq bscope-site r8
add r8 rdi
mov 2d r10
s ss-replicate-4-init
	movs r10 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je ss-replicate-4-com
	st jmp ss-replicate-4-init
s ss-replicate-4-com
mov a r10
movs r10 0 rsi
mov 1 rdi
lq view-space rsi
mq bscope-site rdx
add 1 rdx
mov 1 rax
sys

ent rcvalue-site cvalue-site
ent rrs-site rs-site
ent rsite site
ent rnao-scope nao-scope
ent ris-com is-com
ent rochart-at ochart-at
ent rcom-chart-at com-chart-at
ent horizbar -----------------------\n
aqs com-chart-at
mq chart r8
mq chart-site r9
add r9 r8
mq r8 com-chart-at
aqs com-site
mq naof-scv-records r8
factq scv-naof-esecs r8
mq r8 com-site
aqs rcn
aqs rcn-site
aqs rs-site
nao r8
mq r8 site
mq r8 vss
mq chart r9
mq r9 chart-at
aqs ochart-at
mq r9 ochart-at
ent ris-aon-chart is-aon-chart
aqs nao-scope
s view-records-init
	mq scv r8
	add 18 r8
	mq site r9
	factq scv-naof-esecs r9
	add r9 r8
	mq r8 scv-record
	mov 0 r8 r9
	mq r9 rcn
	mov 8 r8 r9
	mq r9 rcn-site
	mov 10 r8 r9
	mq r9 rs-site

	mov 1 rdi
	mq rcn rsi
	mq rcn-site rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent horizbar rsi
	mov 18 rdx
	mov 1 rax
	sys

	mov 1 rdi
	mq chart-at rsi
	mov a rdx
	mov 1 rax
	sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	sys

	mq ochart-at rsi
	mq rsi chart-at
	aqs vri-aon-seek
	nao r8
	mq r8 vri-aon-seek
	s vri-seek-collumn-init
		mq chart-at rdi
		mq equations r12
		mq cf r11
		addc cf jp r11
		dct r11
		mq rax is-com
		mq rbx chart-at
		mq rsi ckey
		mq rcx ckey-site
		mq rdi cvalue
		mq rdx cvalue-site
		mov 1 rdi
		mq ckey rsi
		mq ckey-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys
		mov 1 rdi
		mq cvalue rsi
		mq cvalue-site rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys
	
		mq rcn rdi
		mq rcn-site rdx
		mq ckey rsi
		mq ckey-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax vri-aon-seek
		cmp 1 rax
		st je vri-is-aon-seek-init

		st jmp vri-is-aon-seek-com
		s vri-is-aon-seek-init
			
			mov 1 r8
			mq r8 vri-aon-seek
		s vri-is-aon-seek-com

		lent ris-aon-chart rsi
		mq vri-aon-seek rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11

		#lq view-space rsi
		#mq vss r8
		#add r8 rsi
		#mov 7c r9
		#movs r9 0 rsi
		#add 1 rsi
		#mov 20 r9
		#movs r9 0 rsi
		mq is-com r8
		cmp 1 r8
		st je vri-seek-collumn-com
		mq vri-aon-seek r8
		cmp 1 r8
		st je vri-seek-collumn-com
		st jmp vri-seek-collumn-init
	s vri-seek-collumn-com
	mq site rax
	add 1 rax
	nao rdx
	divq naof-scv-records
	mq rdx site
	mq site rax
	cmp 0 rax
	st jne seek-set-ochart-at-to-next-com
		mq ochart-at r8
		mq r8 chart-at
		s seek-set-ochart-at-to-next-init-iner-init
			mov 1 rdi
			lent horizbar rsi
			mov 18 rdx
			mov 1 rax
			#sys
			mq chart-at rdi
			mq equations r12
			mq cf r11
			addc cf jp r11
			dct r11
			mq rax is-com
			mq rbx chart-at
			mq is-com r8
			cmp 1 r8
			st je seek-set-ochart-at-to-next-init-iner-com
			st jmp seek-set-ochart-at-to-next-init-iner-init
		s seek-set-ochart-at-to-next-init-iner-com
		mq chart-at rsi
		mq rsi ochart-at
	s seek-set-ochart-at-to-next-com

	lent ris-aon-chart rsi
	mq vri-aon-seek rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq vri-aon-seek r8
	cmp 0 r8
	st jne set-for-non-com
		nao r8
		#mov 0 r8 r8
		mq r8 cvalue-site
	s set-for-non-com

	lent rsite rsi
	mq site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent rchart-at rsi
	mq chart-at rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent rochart-at rsi
	mq ochart-at rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent rcom-chart-at rsi
	mq com-chart-at rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent ris-com rsi
	mq is-com rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent rcvalue-site rsi
	mq cvalue-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent rrs-site rsi
	mq rs-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq rs-site r8
	mq cvalue-site r9
	sub r9 r8
	mq r8 nao-scope

	lent rnao-scope rsi
	mq nao-scope rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov 7c r9
	movs r9 0 rsi
	add 1 rsi
	mov 20 r9
	movs r9 0 rsi
	add 2 r8
	mq r8 vss

	mq cvalue-site rcx
	cmp 0 rcx
	st je com-cvalue-com
		mq cvalue rsi
		lq view-space rdi
		mq vss r8
		add r8 rdi
		add rcx r8
		mq r8 vss
		mq equations r11
		addc equations com r11
		dct r11
	s com-cvalue-com

	mq nao-scope r10
	cmp 0 r10
	st je ss-replicate-7-com
	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov rsi rdi
	add r10 rdi
	add r10 r8
	mq r8 vss
	mov 20 r9
	s ss-replicate-7-init
		movs r9 0 rsi
		add 1 rsi
		cmp rsi rdi
		st je ss-replicate-7-com
		st jmp ss-replicate-7-init
	s ss-replicate-7-com

	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov 20 r9
	movs r9 0 rsi
	add 1 r8
	mq r8 vss

	mq site r11
	cmp 0 r11
	st jne sign-record-com
		lq view-space rsi
		mq vss r8
		add r8 rsi
		mov 7c r9
		movs r9 0 rsi
		add 1 rsi
		mov a r9
		movs r9 0 rsi
		add 2 r8
		mq r8 vss
	s sign-record-com
#init
#com

	mq vss r8
	mq vsb r9
	cmp r8 r9
	st ja view-space-a3e-com
		mov 1 rdi
		lq view-space rsi
		mq vss rdx
		mov 1 rax
		sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys
		nao r8
		mq r8 vss
	s view-space-a3e-com

	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys

	mq ochart-at rsi
	mq com-chart-at rdi
	cmp rsi rdi
	st je view-records-com
	st jmp view-records-init
s view-records-com

lq view-space rsi
mov rsi rdi
mq bscope-site r8
add r8 rdi
mov 2d r10
s ss-replicate-8-init
	movs r10 0 rsi
	add 1 rsi
	cmp rsi rdi
	st je ss-replicate-8-com
	st jmp ss-replicate-8-init
s ss-replicate-8-com
mov a r10
movs r10 0 rsi
mov 1 rdi
lq view-space rsi
mq bscope-site rdx
add 1 rdx
mov 1 rax
sys

##########################################################################################################
# com
##########################################################################################################
mq scv rax
add 1e8480 rsp
ret

#init
	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov 7c r9
	movs r9 0 rsi
	add 1 rsi
	add 1 r8
	mov 20 r9
	movs r9 0 rsi
	add 1 r8
	mq r8 vss
#com

#init
lent rcollumn-namev rsi
mq naof-rep-secs rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
	mq scope-for-nao r8
	cmp 0 r8
	st je ss-replicate-0-com
	lq view-space rsi
	mq vss r8
	add r8 rsi
	mq scope-for-nao r9
	mov rsi rdi
	add r9 rdi
	mov 20 r10
	s ss-replicate-0-init
		movs r10 0 rsi
		add 1 rsi
		cmp rsi rdi
		st je ss-replicate-0-com
		st jmp ss-replicate-0-init
	s ss-replicate-0-com
	mq vss r8
	mq scope-site r9
	add r9 r8
	mq r8 vss

	lq view-space rsi
	mq vss r8
	mq scope-site r9
	add r9 r8
	add r8 rsi
	mov 20 r10
	movs r10 0 rsi
	add 1 r8
	mq r8 vss
#com

#init
ent fn droid/clerk-com0.secs
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
lq chart-at rsi
mov 1 rax
sys
# write
mq file rdi
mov 100 rdx
mq chart-at rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com

#init
mq chart rsi
mq rsi chart-at
s view-records-init
	mq chart-at rdi
	mq equations r12
	mq cf r11
	addc cf jp r11
	dct r11
	mq rax is-com
	mq rbx chart-at
	mq rsi ckey
	mq rcx ckey-site
	mq rdi cvalue
	mq rdx cvalue-site
	mov 1 rdi
	mq ckey rsi
	mq ckey-site rdx
	mov 1 rax
	#sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys
	mov 1 rdi
	mq cvalue rsi
	mq cvalue-site rdx
	mov 1 rax
	#sys
	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys

	lent rnaof-scv-records rsi
	mq naof-scv-records rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	aqs scope-site
	nao r8
	mq r8 scv-site
	s seek-record-scope-init
		mq scv r8
		add 18 r8
		mq scv-site r9
		factq scv-naof-esecs r9
		add r9 r8
		mq r8 scvr-record
		mov 0 r8 r9
		mq r9 scvr
		mov 8 r8 r9
		mq r9 scvr-site
		mov 10 r8 r9
		mq r9 scvr-value

		mq scvr rdi
		mq scvr-site rdx
		mq ckey rsi
		mq ckey-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		cmp 1 rax
		st jne set-scope-site-com
			mq scvr-value r8
			mq r8 scope-site
			st jmp seek-record-scope-com
		s set-scope-site-com

		mq scv-site r8
		add 1 r8
		mq r8 scv-site
		mq naof-scv-records r9
		cmp r8 r9
		st je seek-record-scope-com
		st jmp seek-record-scope-init
	s seek-record-scope-com

	ent rscope-site scope-site
	lent rscope-site rsi
	mq scope-site rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	lent col-init rsi
	lq view-space rdi
	mq vss r8
	add r8 rdi
	mov 2 rcx
	add rcx r8
	mq r8 vss
	mq equations r11
	addc equations com r11
	dct r11

	mq cvalue rsi
	lq view-space rdi
	mq vss r8
	add r8 rdi
	mq cvalue-site rcx
	add rcx r8
	mq r8 vss
	mq equations r11
	addc equations com r11
	dct r11

	aqs scope-for-nao
	mq scope-site r9
	mq cvalue-site r8
	sub r8 r9
	mq r9 scope-for-nao
	ent rscope-for-nao scope-for-nao
	lent rscope-for-nao rsi
	mq scope-for-nao rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq scope-for-nao r8
	cmp 0 r8
	st je ss-replicate-0-com
	lq view-space rsi
	mq vss r8
	add r8 rsi
	mov rsi rdi
	mq scope-for-nao r9
	add r9 rdi
	add r9 r8
	mq r8 vss
	mov 20 r10
	s ss-replicate-0-init
		movs r10 0 rsi
		add 1 rsi
		cmp rsi rdi
		st je ss-replicate-0-com
		st jmp ss-replicate-0-init
	s ss-replicate-0-com

	mq is-com r8
	cmp 1 r8
	st jne add-jsect-com
		lq view-space rsi
		mq vss r8
		add r8 rsi
		mov 7c r9
		movs r9 0 rsi
		add 1 r8
		add 1 rsi
		mov a r9
		movs r9 0 rsi
		add 1 r8
		mq r8 vss

		nao r8
		mq chart-at rsi
		mq chart-com rdi
		cmp rsi rdi
		st jne set-view-nao-0-com
			mov 1 r8
			mq r8 view-nao
		s set-view-nao-0-com
		mq vss r8
		mq vbs r9
		cmp r8 r9
		st jbe set-view-nao-1-init
		st jmp set-view-nao-1-com
		s set-view-nao-1-init
			mov 1 r11
			mq r11 view-nao
		s set-view-nao-1-com

		mq view-nao r8
		cmp 1 r8
		st jne view-nao-com
		s view-nao-init
			#nao r8
			#mov 0 r8 r8
			mov 1 rdi
			lq view-space rsi
			mq vss rdx
			mov 1 rax
			sys
			nao r8
			mq r8 vss
		s view-nao-com
		st jmp add-nao-com
	s add-jsect-com
		lq view-space rsi
		mq vss r8
		add r8 rsi
		mov 20 r9
		movs r9 0 rsi
		add 1 r8
		mq r8 vss
	s add-nao-com

	mq chart-at rsi
	mq chart-com rdi
	cmp rsi rdi
	st je view-records-com
	st jmp view-records-init
s view-records-com
#com
