##########################################################################################################
# sc | save-chart
##########################################################################################################
# rdi | chart
# rcx | key
# r10 | naof-key-secs
# rsi | value
# r11 | naof-value-secs
# r12 | is-record-com
# rbx | cs
# rdx | equations
# r13 | cf
% equations
% cf
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
aqs chart
mq rdi chart
aqs name
mq rsi name
aqs file

# unlink
mq name rdi
mov 57 rax
sys

# open-write
mov 1f8 rdx
mov 41 rsi
mq name rdi
mov 2 rax
sys
mq rax file

# write
mq file rdi
mq chart rsi
mov 0 rsi rdx
add 18 rsi
mov 1 rax
sys

# close
mq file rdi
mov 3 rax
sys

##########################################################################################################
# com
##########################################################################################################
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
lq naof-key-secs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
