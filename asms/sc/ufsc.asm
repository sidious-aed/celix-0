##########################################################################################################
# sc | seek-chart
##########################################################################################################
# rdi | ci
# rcx | seek-name
# rsi | seek-value
# r14 | updatesv
# r15 | wrecord
% equations
% cf
% views
##########################################################################################################
# init
##########################################################################################################
sub 10000 rsp
aqs ci
mq rdi ci
aqs chart
mov 0 rdi r8
mq r8 chart
aqs naof-chart-secs
mov 8 rdi r8
mq r8 naof-chart-secs
aqs seek-name
mq rcx seek-name
aqs seek-value
mq rsi seek-value
aqs updatesv
mq r14 updatesv
aqs wrecord
mq r15 wrecord
aqs equations
mq rdx equations
aqs cf
mq rbx cf
aqs views
mq r12 views
ent jsect \n
aqs chartf
aqs indexf
ent rsite site
aqs tseek
isr 400
aqs tseek-site
aqs csite
nao r8
mq r8 csite

ent i-sim i sim.\n
mov 1 rdi
lent i-sim rsi
mov 7 rdx
mov 1 rax
sys

mq seek-name rsi
mq seek-value rdi
lq tseek rbx
mq equations r14
mq views r15
mq cf r11
addc cf tsdsl r11
dct r11
mq rax tseek-site

mov 1 rdi
lq tseek rsi
mq tseek-site rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys

##########################################################################################################
# up-check
##########################################################################################################
aqs naof-updates
mq updatesv rsi
mov 0 rsi r8
mq r8 naof-updates
aqs usite
nao r8
mq r8 usite
aqs naof-secs-in-update
mov 10 r8
mq r8 naof-secs-in-update
aqs urecord
aqs urecord-site
aqs ckey
aqs ckey-site
aqs cvalue
aqs cvalue-site
aqs is-com
aqs chart-at
aqs is-seek
nao r8
mq r8 is-seek
ent rchart-site chart-site
ent rcsite csite
ent ris-com is-com
ent rchart-at chart-at
aqs record
aqs record-site
aqs chart-site
aqs compr
ent rcompr compr
ent rrecord-site record-site
ent ris-seek is-seek
aqs ursite
s up-check-init
	mq updatesv rsi
	add 18 rsi
	mq usite r8
	factq naof-secs-in-update r8
	add r8 rsi
	mov 0 rsi r8
	mq r8 urecord
	mq r8 chart-at
	mov 8 rsi r8
	mq r8 urecord-site

	mov 1 rdi
	mq urecord rsi
	mq urecord-site rdx
	mov 1 rax
	sys

	nao r8
	mq r8 ursite
	s seek-each-urecord-init
		mov 1 rdi
		mq ursite r8
		mq chart-at rsi
		mq urecord-site rdx
		sub r8 rdx
		mov 1 rax
		sys

		ent rursite ursite
		lent rursite rsi
		mq ursite rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		lq tseek rdi
		mq tseek-site rdx
		mq chart-at rsi
		mq urecord rsi
		mq ursite r8
		add r8 rsi
		mq tseek-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax compr

		lent rcompr rsi
		mq compr rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq compr rax
		cmp 0 rax
		st je set-uis-seek-com
			mov 1 r8
			mq r8 is-seek
		s set-uis-seek-com

		mq urecord rdi
		mq ursite r8
		add r8 rdi
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

		lent ris-com rsi
		mq is-com rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		ent rurecord urecord
		lent rurecord rsi
		mq urecord rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		lent rchart-at rsi
		mq chart-at rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mq chart-at r8
		mq urecord r9
		sub r9 r8
		mq r8 ursite

		lent rursite rsi
		mq ursite rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		dct r11

		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		sys

		mq is-com r12
		cmp 1 r12
		st je seek-each-urecord-com
		st jmp seek-each-urecord-init
	s seek-each-urecord-com

	lent ris-seek rsi
	mq is-seek rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq is-seek r8
	cmp 1 r8
	st jne uis-seek-com
		mq chart-at r8
		mq urecord r9
		sub r9 r8
		mq r8 record-site

		mq urecord rsi
		mq wrecord rdi
		mq record-site rcx
		mq equations r11
		addc equations com r11
		dct r11
	s uis-seek-com

	mq is-seek r8
	cmp 1 r8
	st jne uexit-at-find-com
		st jmp com-is-seek-com
	s uexit-at-find-com

	mq usite r8
	add 1 r8
	mq r8 usite
	mq naof-updates r9
	cmp r8 r9
	st je up-check-com
	st jmp up-check-init
s up-check-com

#init
#com
##########################################################################################################
# index-chart
##########################################################################################################
nao r8
mq r8 is-seek

s index-chart-init
	lent rcsite rsi
	mq csite rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mq chart rsi
	mq csite r8
	add r8 rsi
	mq rsi record
	mq rsi chart-at

	mq csite r8
	mq naof-chart-secs r9
	cmp r8 r9
	st je index-chart-com

	nao r8
	mq r8 chart-site
	s seek-each-record-init
		mov 1 rdi
		lq tseek rsi
		mq tseek-site rdx
		mov 1 rax
		#sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys
		mov 1 rdi
		mq chart-at rsi
		mq tseek-site rdx
		mov 1 rax
		#sys
		mov 1 rdi
		lent jsect rsi
		mov 1 rdx
		mov 1 rax
		#sys

		lq tseek rdi
		mq tseek-site rdx
		mq chart-at rsi
		mq tseek-site rcx
		mq equations r11
		addc equations compair-spaces r11
		dct r11
		mq rax compr

		lent rcompr rsi
		mq compr rdi
		mov 10 rbx
		mq equations rdx
		mq views r11
		addc views view-number r11
		#dct r11

		mq compr rax
		cmp 0 rax
		st je set-is-seek-com
			mov 1 r8
			mq r8 is-seek
		s set-is-seek-com

		mq chart rdi
		mq csite r8
		add r8 rdi
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

		mq chart-at r8
		mq chart r9
		sub r9 r8
		mq r8 csite

		mq is-com r12
		cmp 1 r12
		st je seek-each-record-com
		st jmp seek-each-record-init
	s seek-each-record-com

	mq is-seek r8
	cmp 1 r8
	st jne is-seek-com
		mq chart-at r8
		mq record r9
		sub r9 r8
		mq r8 record-site

		mq record rsi
		mq wrecord rdi
		mq record-site rcx
		mq equations r11
		addc equations com r11
		dct r11
	s is-seek-com

	mq is-seek r8
	cmp 1 r8
	st jne exit-at-find-com
		st jmp com-is-seek-com
	s exit-at-find-com

	lent rcsite rsi
	mq csite rdi
	mov 10 rbx
	mq equations rdx
	mq views r11
	addc views view-number r11
	#dct r11

	mov 1 rdi
	lent jsect rsi
	mov 1 rdx
	mov 1 rax
	#sys

	st jmp index-chart-init
s index-chart-com
nao r8
mq r8 record-site
s com-is-seek-com

#init
#com
##########################################################################################################
# com
##########################################################################################################
mq record-site rax
add 10000 rsp
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
lq naof-updates rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
#init
mov 1 rdi
lq cs rsi
mov 10 rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
lent rchart-site rsi
mq chart-site rdi
mov 10 rbx
mq equations rdx
mq views r11
addc views view-number r11
dct r11
#com
