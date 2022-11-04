		.text
		.align 	2
		.global asum
		.type 	asum, %function
asum:					@ get the sum of n consequtive numbers 1+..+n
		mov r1, r0		@ n
		cmp r1, #0 		@ if n is less than 0, return
		blt invalid
		mov r2, #1		@ set sum loop iterator starting value to 1
		b loop
invalid:
		mov r0, #0
		bx lr
addition:				@ add iterator value to the sum (n-1) times, increasing iterator by 1 each time
		adds r3, r3, r2		@ add iterator value to the resulting sum
		bvs exit		@ if the resulting sum is too large, return
		add r2, r2, #1		@ increase loop iterator by 1
loop:
		cmp r2, r0		@ check if iterator value is less than n
		blt addition		@ if yes, add iterator value to the resulting sum
		b finish		@ else return the resulting sum
exit:
		mov r3, #0 		@ set resulting sum to 0 as the input number was too large to store its sum result
		b finish
finish:
		mov r0, r3		@ return the resulting sum
		bx lr