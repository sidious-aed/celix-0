##########################################################################################################
# atc | add-to-chart
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
aqs key
mq rcx key
aqs naof-key-secs
mq r10 naof-key-secs
aqs value
mq rsi value
aqs naof-value-secs
mq r11 naof-value-secs
aqs is-record-com
mq r12 is-record-com
aqs cs
mq rbx cs
aqs equations
mq rdx equations
aqs cf
mq r13 cf
ent jedao-sectioniser |
ent record-come \n
aqs b16s
isr 200
aqs key-com-site
ent jsect \n

#init
mov 1 rdi
mq key rsi
mq naof-key-secs rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
mov 1 rdi
mq value rsi
mq naof-value-secs rdx
mov 1 rax
sys
mov 1 rdi
lent jsect rsi
mov 1 rdx
mov 1 rax
sys
#com

##########################################################################################################
# write-collumn-keyage
##########################################################################################################

mq naof-key-secs rdi
lq b16s rsi
mov 24 rbx
mq equations r13
addc equations number-to-entree r13
dct r13

mq chart rdi
lq b16s rsi
mov rax rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq chart rdi
lent jedao-sectioniser rsi
mov 1 rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq chart rdi
mq key rsi
mq naof-key-secs rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq chart rdi
lent jedao-sectioniser rsi
mov 1 rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

##########################################################################################################
# write-collumn-valuage
##########################################################################################################
mq naof-value-secs rdi
lq b16s rsi
mov 24 rbx
mq equations r13
addc equations number-to-entree r13
dct r13

mq chart rdi
lq b16s rsi
mov rax rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq chart rdi
lent jedao-sectioniser rsi
mov 1 rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq chart rsi
mov 0 rsi r11
mq r11 key-com-site

mq chart rdi
mq value rsi
mq naof-value-secs rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart

mq is-record-com r8
cmp 1 r8
st je close-record-init

mq chart rdi
lent jedao-sectioniser rsi
mov 1 rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart
st jmp close-record-com

s close-record-init
mq chart rdi
lent record-come rsi
mov 1 rcx
mq cs rbx
mq equations rdx
mq cf r11
addc cf astr r11
dct r11
mq rax chart
s close-record-com

##########################################################################################################
# com
##########################################################################################################
mq chart rax
mq key-com-site r10
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
mov 100 rdx
mq cs rsi
mov 1 rax
sys
# close
mq file rdi
mov 3 rax
sys
#com
