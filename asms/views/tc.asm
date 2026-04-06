##########################################################################################################
# wtlr | write-terminal-log-request
##########################################################################################################
# rsi | string
# rcx | string-site
% equations
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs string
mq rsi string
aqs string-site
mq rcx string-site
aqs equations
mq r12 equations
ent lname tc.print

##########################################################################################################
# write-print-file-request
##########################################################################################################
aqs pf
# unlink
ent lname tc.print
lent lname rdi
mov 57 rax
sys
# open-write
mov 1f8 rdx
mov 441 rsi
lq lname rdi
mov 2 rax
sys
mq rax pf

ent fn droid/clerk-com.secs
aqs file
# unlink
lent fn rdi
mov 57 rax
sys
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
lq pf rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys

# write
mq pf rdi
mq string rsi
mq string-site rdx
mov 1 rax
sys

# close
mq pf rdi
mov 3 rax
sys
#init
#com
##########################################################################################################
# com
##########################################################################################################
add 1000 rsp
ret

#init
#com
