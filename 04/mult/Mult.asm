// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// i和R2的初值设为0 设置i是为了不破坏R1的值
@i
M = 0
@R2
M = 0
(LOOP)
	@i
	D = M
	@R1
	D = M - D
	// 用i与R1相减 如果为0则跳转至END
	@END
	D;JEQ
	@R0
	D = M
	// R2中加一次R0
	@R2
	M = M + D
	// i++
	@i
	M = M + 1
	@LOOP
	0;JMP
(END)
	@END
	0;JMP