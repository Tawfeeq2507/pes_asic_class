section .text
.global load
.type load, @function

load:
        add     a4, a0, zero //initialize sum register a4 with 0x0
        add     a2, a0, a1   //store count of 10 in register a2,Register a1 is >
        add     a3, a0, zero //initiaslize intermediate sum register a3 by 0
loop:   add     a4, a3, a4   //Incremental addition
        addi    a3, a3, 1    //Increment intermediate register by 1
        blt     a3, a2, loop //if a3 is less than a2,branch to label named <loo>
        add     a0, a4, zero //store final result to register a0 so that it can>
        ret
