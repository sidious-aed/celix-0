sub 1000 rsp
isr 100
ent i-sim talkei talkie. chapzao is to you-za.\n
mov 25 rdx
ct chapei-talk-init
st jmp chapei-talk-com
s chapei-talk-init
lent i-sim rsi
add 8 rsi
mov 1 rdi
mov 1 rax
sys
ret
s chapei-talk-com
add 1000 rsp
