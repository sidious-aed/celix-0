##########################################################################################################
# libc | liberate-charts
##########################################################################################################
# rdi | ci
% equations
% views
% cf
##########################################################################################################
# init
##########################################################################################################
sub 1000 rsp
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

# munmap
mq chart rdi
mq chart-site rsi
mov b rax
sys

# munmap
mq index rdi
mq index-site rsi
mov b rax
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
lq views rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
