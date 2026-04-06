##########################################################################################################
# number-to-entree | 1
##########################################################################################################
# rsi | entree
# rdi | number
# rbx | base
# rdx | domain-back
# suports clerk-base.list | basically; bases with lesser on rolls over, sense
# shift is shifty and the overflow flag might be the same, at the low clerk
# level this system is prefered as bases; 10, 16, and 36, are supported.
# if more suport for more bases were needed; then make a second check for
# ironic-greater, for; if the next base rolls to greater but then divded by the
# base is not the previous base then it is ironic greater, and then all bases
# are supported. sense we only need 10, 16, and 36 for our purposes here, we
# went with the lighter cheaper only lesser bases solutions. the perplexion is
# nice for rememberence in terms of fatefull plans of lower mage study. it is
# up there in numeroligical perplexsions; is the base lesser or ironic-greater
# as a quality in phiolosophy. if you only wanted pure practical; then the
# divide by the base after the multiply by the base should be the same or you
# have reached the overflow without the mole spite risks (quite a might given
# we have found in this anew even their spite of the ivory towers worse; math
# alters at higher orchestra in c, and shift is shifty) of the overflow flag.
# but here is a check for the quality of lesser base. mole spites in unix are
# of a sparse podium nature with the difficulter controll of is that an alter
# or our zit zit, and there is rules in terms of when they come up and what
# spite lean the moles can have with them. in a prose sense; harry potters
# moving stair wells are good from start or the status que, and unix is
# a castle like stone keep.
##########################################################################################################
# initialise
##########################################################################################################
secs 90
sub-constant 1000 rsp
auto-quad-source entree
move-quad rsi entree
auto-quad-source number
move-quad rdi number
auto-quad-source base
move-quad rbx base
auto-quad-source focus
auto-quad-source prime-focus
move-quad-to base r8
move-quad r8 prime-focus
auto-quad-source back-site
move-quad rdx back-site
auto-quad-source sec
auto-quad-source print-sec
auto-quad-source naof-number-entree-secs
auto-quad-source base-secs-breadth
auto-quad-source site
auto-quad-source mode
naoify r8
move-quad r8 naof-number-entree-secs
move-quad r8 base-secs-breadth
move-quad r8 site
move-quad r8 mode
set 1 r8
move-quad r8 focus
auto-quad-source current

##########################################################################################################
# seek-breadth
##########################################################################################################
marker seek-breadth-et
move-quad-to base rax
multiply-by-quad focus
move-quad rax focus
move-quad-to prime-focus r8
compair r8 rax
stay-to seek-breadth-completion below
move-quad-to base-secs-breadth r8
add-constant 1 r8
move-quad r8 base-secs-breadth
move-quad-to focus rax
move-quad rax prime-focus
stay-to seek-breadth-et always
marker seek-breadth-completion

set 1 r8
move-quad r8 focus
marker gain-focus-et
move-quad-to focus rax
multiply-by-quad base
move-quad rax focus
move-quad-to site r8
add-constant 1 r8
move-quad r8 site
move-quad-to base-secs-breadth r9
compair r8 r9
stay-to gain-focus-et not-equal

##########################################################################################################
# number-to-entree
##########################################################################################################
marker number-to-entree-et
move-quad-to number rax
naoify rdx
divide-by-quad focus
move-quad rax sec

move-quad-to mode r8
compair-constant 0 r8
stay-to mode-1 not-equal

move-quad-to sec rax
compair-constant 0 rax
stay-to modes-completion equal

marker mode-1
set 1 r8
move-quad r8 mode
move-quad-to sec rax
compair-constant a rax
stay-to in-26-scope equal-above
add-constant 30 rax
stay-to base-scopes-copletion always
marker in-26-scope
add-constant 57 rax
marker base-scopes-copletion
move-quad-to entree r10
move-sec-to 0 rax r10
add-constant 1 r10
move-quad r10 entree
move-quad-to naof-number-entree-secs r8
add-constant 1 r8
move-quad r8 naof-number-entree-secs
move-quad-to sec rax
multiply-by-quad focus
move-quad-to number r11
sub rax r11
move-quad r11 number

marker modes-completion
move-quad-to focus rax
naoify rdx
divide-by-quad base
move-quad rax focus
compair-constant 0 rax
stay-to number-to-entree-et not-equal

move-quad-to mode r8
compair-constant 0 r8
stay-to write-zero equal
stay-to write-zero-completion always
marker write-zero
move-quad-to entree r10
set 30 rax
move-sec-to 0 rax r10
set 1 rax
move-quad rax naof-number-entree-secs
marker write-zero-completion

move-quad-to naof-number-entree-secs rax
move-quad-to back-site rdx
add-constant 1000 rsp
domain-back
secs 90

##########################################################################################################
# send | 271
##########################################################################################################
# rsi | source
# rdi | destination
# rcx | distance
# rdx | domain-back
# r14 | equations
##########################################################################################################
secs 90
marker send-equation
sub-constant 1000 rsp
reset-rack-site
auto-quad-source source
move-quad rsi source
auto-quad-source destination
move-quad rdi destination
auto-quad-source distance
move-quad rcx distance
auto-quad-source domain-back2
move-quad rdx domain-back2
auto-quad-source part
auto-quad-source naof-4-quads
auto-quad-source naof-quads
auto-quad-source naof-secs
auto-quad-source at-in-secs

#init
set 1 rdi
move-quad-to source rsi
move-quad-to distance rdx
set 1 rax
syscall
#com

##########################################################################################################
# initialise
##########################################################################################################
naoify r8
move-quad r8 at-in-secs
move-quad-to distance r8
move-quad r8 naof-secs
move-quad-to naof-secs rax
set 8 r8
move-quad r8 part
naoify rdx
divide-by-quad part
move-quad rax naof-quads
multiply-by-quad part
move-quad-to naof-secs r8
sub rax r8
move-quad r8 naof-secs

##########################################################################################################
# move-quads
##########################################################################################################
move-quad-to source rsi
move-quad-to destination rdi
move-quad-to naof-quads rcx
send-quads
move-quad-to naof-quads rax
set 8 r8
move-quad r8 part
multiply-by-quad part
move-quad-to at-in-secs r9
add rax r9
move-quad r9 at-in-secs

##########################################################################################################
# move-secs
##########################################################################################################
move-quad-to at-in-secs r8
move-quad-to source rsi
add r8 rsi
move-quad-to destination rdi
add r8 rdi
move-quad-to naof-secs rcx
send-secs

#init
set 1 rdi
move-quad-to destination rsi
move-quad-to distance rdx
set 1 rax
syscall
#com

move-quad-to domain-back2 rdx
add-constant 1000 rsp
domain-back
secs 90

##########################################################################################################
# entree-to-number | 388
##########################################################################################################
# sign | cypher | etn
# rsi  | entree
# rcx  | naof-entree-secs
# rbx  | base
# rdx  | domain-back
# suports to b16
##########################################################################################################
# initialise
##########################################################################################################
secs 90
sub-constant 1000 rsp
reset-rack-site
auto-quad-source etn-entree
move-quad rsi etn-entree
auto-quad-source etn-naof-entree-secs
move-quad rcx etn-naof-entree-secs
auto-quad-source etn-base
set 1 r8
move-quad r8 etn-base
auto-quad-source etn-base-base
move-quad rbx etn-base-base
auto-quad-source etn-domain-back
move-quad rdx etn-domain-back

auto-quad-source etn-number
naoify r8
move-quad r8 etn-number
auto-quad-source etn-site
move-quad-to etn-naof-entree-secs r8
sub-constant 1 r8
#naoify r8
move-quad r8 etn-site

marker sum-init
move-quad-to etn-entree rsi
move-quad-to etn-site r8
add r8 rsi
naoify rax
move-sec 0 rsi rax

compair-constant 30 rax
stay-to and-1-of-is-in-0-9 equal-above
stay-to not-and-1-of-is-in-0-9 always
marker and-1-of-is-in-0-9
compair-constant 39 rax
stay-to not-and-1-of-is-in-0-9 above
sub-constant 30 rax
marker not-and-1-of-is-in-0-9

compair-constant 61 rax
stay-to and-1-of-is-in-10-16 equal-above
stay-to not-and-1-of-is-in-10-16 always
marker and-1-of-is-in-10-16
compair-constant 66 rax
stay-to not-and-1-of-is-in-10-16 above
sub-constant 57 rax
marker not-and-1-of-is-in-10-16

multiply-by-quad etn-base
move-quad-to etn-number r10
add rax r10
move-quad r10 etn-number

move-quad-to etn-site r8
compair-constant 0 r8
stay-to sum-com equal
sub-constant 1 r8 # compute-et
move-quad r8 etn-site

move-quad-to etn-base rax
multiply-by-quad etn-base-base
move-quad rax etn-base

stay-to sum-init always
marker sum-com

move-quad-to etn-number rax
move-quad-to etn-domain-back rdx
add-constant 1000 rsp
domain-back
secs 90

#init
entree etn-segmentiser | \n
set 1 rdi
move-quad-to etn-entree rsi
move-quad-to etn-naof-entree-secs rdx
set 1 rax
syscall
set 1 rdi
leeve-entree etn-segmentiser rsi
set 1 rdx
set 1 rax
syscall
#com

#init
entree droid-file-name | droid/droid-com.secs
auto-quad-source droid-file
# unlink
leeve-entree droid-file-name rdi
set 57 rax
syscall
# open-write
set 1f8 rdx
set 41 rsi
leeve-entree droid-file-name rdi
set 2 rax
syscall
move-quad rax droid-file
# write
move-quad-to droid-file rdi
set c rdx
leeve-quad destination rsi
set 1 rax
syscall
# close
move-quad-to droid-file rdi
set 3 rax
syscall
#com

#init
entree droid-file-name | droid/droid-com-2.secs
auto-quad-source droid-file
# unlink
leeve-entree droid-file-name rdi
set 57 rax
syscall
# open-write
set 1f8 rdx
set 41 rsi
leeve-entree droid-file-name rdi
set 2 rax
syscall
move-quad rax droid-file
# write
move-quad-to droid-file rdi
set 8 rdx
move-quad-to destination rsi
set 1 rax
syscall
# close
move-quad-to droid-file rdi
set 3 rax
syscall
#com

#init
entree droid-file-name | droid/droid-com-2.secs
auto-quad-source droid-file
# unlink
leeve-entree droid-file-name rdi
set 57 rax
syscall
# open-write
set 1f8 rdx
set 41 rsi
leeve-entree droid-file-name rdi
set 2 rax
syscall
move-quad rax droid-file
# write
move-quad-to droid-file rdi
set 8 rdx
leeve-quad destination rsi
set 1 rax
syscall
# close
move-quad-to droid-file rdi
set 3 rax
syscall
#com
