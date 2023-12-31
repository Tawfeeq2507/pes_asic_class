![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools.

**Course Name** : VLSI Physical Design for ASICs  
**Instructor** : Kunal Ghosh 

# VLSI Physical Design for ASICs
The objective of VLSI (Very Large Scale Integration) physical design for ASICs (Application-Specific Integrated Circuits) is to transform a digital circuit's logical representation into a physical layout that meets various performance, power, area, and manufacturability requirements.

# What is ASIC Flow?
ASIC stands for Application-Specific Integrated Circuit. It refers to a type of integrated circuit (IC) that is custom-designed for a specific application or purpose. ASICs are contrasted with general-purpose integrated circuits, like microprocessors or memory chips, which are designed to perform a wide range of tasks.ASIC design flow refers to the entire process of designing and manufacturing an ASIC.

In ASIC flow we come up with an Idea such as an inverter,ring counter,etc and we try to have this on our chips,but these follow some steps before coming out as chips these steps are-
1) RTL to GDS
2) GDS to Tapeout

# SKILL OUTCOMES

+ Architectural Design
+ RTL Design / Behavioral Modeling
+ Floorplanning
+ placement
+ clock Tree Synthesis
+ Routing



# TABLE OF CONTENTS

## DAY 1 

**Introduction to RISCV ISA and GNU Compiler Toolchain**

+ Introduction to Basic Keywords
  - [Introduction](#introduction)
  - [From Apps to Hardware](#from-apps-to-hardware)
  - [Detail Description of Course Content](#detail-decription-of-course-content)

+ Labwork for RISCV Toolchain
  - [C Program](#c-program)
  - [RISCV GCC Compiler and Dissemble](#riscv-gcc-compiler-dissemblr)
  - [Spike Simulation and Debug](#spike-simulation-and-debug)

+ Integer Number Representation  
  - [64-bit Unsigned Numbers](#64-bit-unsigned-numbers)
  - [64-bit Signed Numbers](#64-bit-signed-numbers)
  - [Labwork For Signed and Unsigned Numbers](#labwork-for-signed-and-unsigned-numbers)

## DAY 2 

**Introduction to ABI and Basic Verification Flow**

+ Application Binary Interface
  - [Introduction to ABI](#introduction-to-abi)
  - [Memmory Allocation for Double Words](#memmory-allocation-for-double-words)
  - [Load, Add and Store Instructions](#load,-add-and-store-instructions)
  - [32-Registers and their ABI Names](#32-registers-and-their-abi-names)

+ Labwork using ABI Function Calls
  - [Algorithm for C Program using ASM](#algorithm-for-c-program-using-asm)
  - [Review ASM Function Calls](#review-asm-function-calls)
  - [Simulate C Program using Function Call](#simulate-c-program-using-function-call)

## DAY 3

**Introduction to Verilog RTL design and Synthesis**

+ [Introduction to Open-Source Simulator iVerilog](#introduction-to-open-source-simulator-iverilog)
   - Introduction to iVerilog Design Testbench
+ [Labs using iVerilog and GTKwave](#labs-using-iverilog-and-gtkwave)
   - Introduction to Lab
   - iVerilog GTKwave Part-1
   - iVerilog GTKwave Part-2
+ [Introduction to Yosys and Logic synthesis](#introduction-to-yosys-and-logic-synthesis)
   - Introduction to Yosys
   - Introduction to Logic Synthesis
+ [Labs using Yosys and Sky130 PDKs](#labs-using-yosys-and-sky130-pdks)
   - Yosys good mux
 
## DAY 4

**Timing Libs, Hierarchical vs Flat Synthesis and Efficient Flop Coding Styles**

+ [Introduction to Timing Dot Libs](#introduction-to-timing-dot-libs)
  - Introduction to Dot Lib
+ [Hierarchical vs Flat Synthesis](#hierarchical-vs-flat-synthesis)
  - Hierarchical Synthesis Flat Synthesis 
+ [Various Flop Coding Styles and Optimization](#various-flop-coding-styles-and-optimization)
  - Why Flops and Flop Coding Styles
  - Lab Flop Synthesis Simulations
  - Interesting Optimisations

## DAY 5

**Combinational and Sequential Optmizations**

+ [Introduction to Optimisations](#introduction-to-optimisations)
+ [Combinational Logic Optimisations](#combinational-logic-optimisations)
+ [Sequential Logic Optimisations](#sequential-logic-optimisations)
+ [Sequential Optimisations for Unused Outputs](#sequential-optimisations-for-unused-outputs)

## DAY 6

**GLS, Blocking vs Non-Blocking and Synthesis-Simulation Mismatch**

+ [GLS Synthesis-Simulation Mismatch and Blocking Non-Blocking Statements](#gls-synthesis-simulation-mismatch-and-blocking-non-blocking-statements)
  - GLS Concepts And Flow Using Iverilog
  - Synthesis Simulation Mismatch
  - Blocking And Non Blocking Statements In Verilog
  - Caveats With Blocking Statements
+ [Labs on GLS and Synthesis-Simulation Mismatch](#labs-on-gls-and-synthesis-simulation-mismatch)
+ [Labs on Synth-Sim Mismatch for Blocking Statement](#labs-on-synth-sim-mismatch-for-blocking-statement)

## Tools Used:

+ **RISC-V GNU Toolchain**: A comprehensive set of tools for compiling and building software to run on RISC-V processors.
+ **RISC-V ISA Simulator**: A RISC-V simulator used for functional verification and testing of RISC-V code without needing actual hardware.
+ **RISC-V Proxy Kernel**: The RISC-V Proxy Kernel, a lightweight execution environment for running user-level applications on RISC-V processors.
+ **YOSYS**: Yosys is an open-source framework for Verilog RTL synthesis. It's widely used in digital design for converting high-level descriptions of a digital circuit into a gate-level representation. In other words, it helps in transforming a behavioral description (written in a language like Verilog) into a netlist, which is a detailed representation of the digital logic in terms of gates and their interconnections.

# Day-1   
## Introduction to Basic Keywords

<details>
<summary> Introduction </summary>
	
- **ISA (Instruction Set Archhitecture)**
  - ISA defines the interface between a computer's hardware and its software, specifically how the processor and its components interact with the software instructions that drive the execution of tasks.
  - It encompasses a set of instructions, addressing modes, data types, registers, memory organization, and the mechanisms for executing and managing instructions.

- **RISC-V (Reduced Instruction Set Computing - Five)**.
  - It is an open-source Instruction Set Architecture (ISA) that has gained significant attention and adoption in the world of computer architecture and semiconductor design.
  - RISC architectures simplify the instruction set by focusing on a smaller set of instructions, each of which can be executed in a single clock cycle. This approach usually leads to faster execution of individual instructions. 

<img width="536" alt="image" src="https://github.com/Veda1809/pes_asic_class/assets/142098395/4eabe0b7-4581-419b-88e7-84c7ac1dac8e">

</details>

<details>
<summary> From Apps to Hardware </summary>
	
1. **Apps:** Application software, often referred to simply as "applications" or "apps," is a type of computer software that is designed to perform specific tasks or functions for end-users.
2. **System software:** System software refers to a category of computer software that acts as an intermediary between the hardware components of a computer system and the user-facing application software. It provides essential services, manages hardware resources, and enables the execution of application programs. System software plays a critical role in maintaining the overall functionality, security, and performance of a computer system.'
3. **Operating System:** The operating system is a fundamental piece of software that manages hardware resources and provides various services for both users and application programs. It controls tasks such as memory management, process scheduling, file system management, and user interface interaction. Examples of operating systems include Microsoft Windows, macOS, Linux, and Android.

4. **Compiler:** A compiler is a type of software tool that translates high-level programming code written by developers into assembly-level language.

5. **Assembler:** An assembler is a software tool that translates assembly language code into machine code or binary code that can be directly executed by a computer's processor.

6. **RTL:** RTL serves as an abstraction level in the design process that represents the behavior of a digital circuit in terms of registers and the operations that transfer data between them.

 7. **Hardware:** Hardware refers to the physical components of a computer system or any electronic device. It encompasses all the tangible parts that make up a computing or electronic device and enable it to perform various tasks.

</details>

<details>
<summary> Detail Description of Course Content </summary>

**Pseudo Instructions:** Pseudo-instructions are used to simplify programming, improve code readability, and reduce the number of explicit instructions a programmer needs to write. They are especially useful for common programming patterns that involve multiple instructions.
`Ex: li, mv`.

**Base Integer Instructions:** The term "base integer instructions" refers to the fundamental set of instructions that form the foundation for performing basic arithmetic, logical, and data movement operations.
`Ex: add, sub, and, or, xor, sll`.

**Multiply Extension Intructions:** The RISC-V architecture includes a set of multiply and multiply-accumulate (MAC) extension instructions that enhance the instruction set to perform efficient multiplication and multiplication-accumulate operations.
`Ex: mul, mulh, mulhu, mulhsu`.

**Single and Double Precision Floating Point Extension:** The RISC-V architecture includes floating-point extensions that provide support for both single-precision (32-bit) and double-precision (64-bit) floating-point arithmetic operations. These extensions are often referred to as the "F" and "D" extensions, respectively. Floating-point arithmetic is essential for handling real numbers with fractional parts and for performing accurate calculations involving decimal values.

**Application Binary Interface:** ABI stands for "Application Binary Interface." It is a set of rules and conventions that govern how software components interact with each other at the binary level. The ABI defines various aspects of program execution, including how function calls are made, how parameters are passed and returned, how memory is allocated and managed, and more.

**Memory Allocation and Stack Pointer** 
- Memory allocation refers to the process of assigning and managing memory segments for various data structures, variables, and objects used by a program. It involves allocating memory space from the system's memory pool and releasing it when it is no longer needed to prevent memory leaks.
- The stack pointer is a register used by a program to keep track of the current position of the program's execution on the call stack.

</details>

## Labwork for RISCV Toolchain

<details>
<summary> C Program </summary>
	
We wrote a C program for calculating the sum from 1 to n using a text editor, nano.

`nano sumton.c`
``` c
#include<stdio.h>
int main()
{
        int i, sum=0, n=10;
        for(i=1; i<=n; ++i)
        {
                sum+=i;
        }
        printf("sum of numbers from 1 to %d is %d\n",n,sum);
        return 0;
}
```
</details>

<details>
<summary> RISCV GCC Compiler and Dissemble </summary>

Using the gcc compiler, we compiled the program to get the output.

`gcc sumton.c`

`.\a.out`

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/0c9f2719-f438-4a6b-b565-04f9dec1efa1)
	
Using the riscv gcc compiler `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sumton.o sumton.c`, we compiled the C program.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/c8e7d12b-253b-40b4-a150-102d1d281fd2)

To get the assembly code for the C program, `riscv64-unknown-elf-objdump -d sumton.o | less` .

In order to view the main section, type `/main`.

Here, since we used `-O1` optimisation, the number of instructions are 11.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/690d164d-e499-452b-967c-906550e9e78c)

When we use `-Ofast` optimisation, we can see that the number of instructions are 11.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/e2f76f68-489d-4383-bcac-4fcb08261c01)

</details>

<details>
<summary> Spike Simulation and Debug </summary>
	
`spike pk sum1ton.o` is used to check whether the instructions produced are right to give the correct output.

`spike -d pk sum1ton.c` is used for debugging.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b5d622d9-f5d6-4d6b-bea5-bd4ca0c2134c)

The contents of the registers can also be viewed.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/9f74dc64-004f-4c1d-a580-6494ca8134d1)

</details>

## Integer Number Representation 

<details>
<summary> 64-Bit Unsigned Numbers </summary>
	
- Unsigned numbers, also known as non-negative numbers, are numerical values that represent magnitudes without indicating direction or sign.
- Range: 0 to 2^(N) - 1.

</details>

<details>
<summary> 64-Bit Signed Numbers </summary>
	
- Signed numbers are numerical values that can represent both positive and negative magnitudes, along with zero.
- Range : -(2^(N-1)) to 2^(N-1) - 1.

</details>
 
<details>
<summary> Labwork for 64 bit Unsigned and Signed Numbers </summary>
	
**Unsigned 64-bit Number**

``` c
#include <stdio.h>
#include <math.h>

int main()
{
	unsigned long long int max = (unsigned long long int) (pow(2,64) -1);
	unsigned long long int min = (unsigned long long int) (pow(2,64) *(-1));
	printf("lowest number represented by unsigned 64-bit integer is %llu\n",min);
	printf("highest number represented by unsigned 64-bit integer is %llu\n",max);
	return 0;
}
```

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/35c08d95-91ec-492b-bf87-a43c327180b3)


**Signed 64-bit Number**
``` c
#include <stdio.h>
#include <math.h>

int main(){
	long long int max = (long long int) (pow(2,63) -1);
	long long int min = (long long int) (pow(2,63) *(-1));
	printf("lowest number represented by signed 64-bit integer is %lld\n",min);
	printf("highest number represented by signed 64-bit integer is %lld\n",max);
	return 0;
}
```

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/ab2af06b-1e1b-402c-8fcc-61d0ebbb31d5)

</details>

# Day-2
## Application Binary Interface

<details>
<summary> Introduction to ABI </summary>
	
+ An Application Binary Interface (ABI) is a set of rules and conventions that dictate how binary code interacts with and communicates with other binary code, typically at the level of machine code or compiled code. In simpler terms, it defines the interface between two software components or systems that are written in different programming languages, compiled by different compilers, or running on different hardware architectures.
+ The ABI is crucial for enabling interoperability between different software components, such as different libraries, object files, or even entire programs. It allows components compiled independently and potentially on different platforms to work seamlessly together by adhering to a common set of rules for communication and data representation.

</details>

<details>
<summary> Memory Allocation for Double Words </summary>
	
64-bit number (or any multi-byte value) can be loaded into memory in little-endian or big-endian. It involves understanding the byte order and arranging the bytes accordingly

1. **Little-Endian:**
In little-endian representation, you store the least significant byte (LSB) at the lowest memory address and the most significant byte (MSB) at the highest memory address.

2. **Big-Endian:**
In big-endian representation, you store the most significant byte (MSB) at the lowest memory address and the least significant byte (LSB) at the highest memory address.

#### For example, consider the 64-bit hexadecimal value 0x0123456789ABCDEF. 

In Little-Endian representation, it would be stored as follows in memory:

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/307fabf6-7f58-4337-8171-6d62d99a4386)

In Big-Endian representation, it would be stored as follows in memory:

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/aa53e082-5878-4e3f-948a-f6f080ed0ed2)

</details>

<details>
<summary> Load, Add and Store instructions </summary>
	
Load, Add, and Store instructions are fundamental operations in computer architecture and assembly programming. They are often used to manipulate data within a computer's memory and registers.

1. **Load Instructions:**
Load instructions are used to transfer data from memory to registers. They allow you to fetch data from a specified memory address and place it into a register for further processing.

Example `ld x6, 8(x5)`

In this Example
- `ld` is the load double-word instruction.
- `x6` is the destination register.
- `8(x5)` is the memory address pointed to by register `x5` (base address + offset).

2. **Store Instructions:**
Store instructions are used to write data from registers into memory.They store values from registers into memory addresses

Example `sd x8, 8(x9)`

In this Example
- `sd` is the store double-word instruction.
- `x8` is the source register.
- `8(x9)` is the memory address pointed to by register `x9` (base address + offset).

3. Add Instructions:
  Add instructions are used to perform addition operations on registers. They add the values of two source registers and store the result in a destination register.

Example `add x9, x10, x11`

In this Example
- `add` is the add instruction.
- `x9` is the destination register.
- `x10` and `x11` are the source registers.

</details>

<details>
<summary> 32-Registers and their ABI Names </summary>
	
The choice of the number of registers in a processor's architecture, such as the RISC-V RV64 architecture with its 32 general-purpose registers, involves a trade-off between various factors. While modern processors can have more registers but increasing the number of registers could lead to larger instructions, which would take up more memory and potentially slow down instruction fetch and decode.

#### ABI Names

ABI names for registers serve as a standardized way to designate the purpose and usage of specific registers within a software ecosystem. These names play a critical role in maintaining compatibility, optimizing code generation, and facilitating communication between different software components. 

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/b735fc44-0c08-40e8-8303-c338647dbd9f)

</details>

## Labwork using ABI Function Calls

<details>
<summary> Algorithm for C Program using ASM </summary>
	
- Incorporating assembly language code into a C program can be done using inline assembly or by linking separate assembly files with your C code.
- When you call an assembly function from your C code, the C calling convention is followed, including pushing arguments onto the stack or passing them in registers as required.
- The program executes the assembly function, following the assembly instructions you've provided.

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/1d76b7ef-cac9-4331-9190-31af36525e0c)

</details>

<details>
<summary> Review ASM Function Calls </summary>
	
- You write your C code in one file and your assembly code in a separate file.
- In the assembly file, you declare assembly functions with appropriate signatures that match the calling conventions of your platform.

**C Program**
`1to9_custom.c`
  ``` c
  #include <stdio.h>
  
  extern int load(int x, int y);
  
  int main()
  {
      int result = 0;
      int count = 9;
      result = load(0x0, count+1);
      printf("Sum of numbers from 1 to %d is %d\n",count,result);
  }
```

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/71571dc0-dc10-4ffc-8414-c9510b9dde9d)

**Asseembly File**
`load.S`
``` s
.section .text
.global load
.type load, @function

load:   add   a4, a0, zero  //initialize sum register a4 with 0x0
        add   a2, a0, a1    //store count of 10 in register a2,Register a1 is loaded with 0xa (decimal 10) from main program
        add   a3, a0, zero  //initialize intermediate sum register a3 by 0

loop:   add   a4, a3, a4    //Incremental addition
        addi  a3, a3, 1     //Increment intermidiate register by 1
        blt   a3, a2, loop  //if a3 is less than a2,branch to label named <loop>
        add   a0, a4, zero  //store final result to register a0 so that it can be read by main program
        ret
```

we can see the Assembly File load.S:

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/76496203-7aa0-42a2-8e51-dfc085403d37)

</details>

<details>
<summary> Simulate C Program using Function Call </summary>
	
**Compilation:** To compile C code and Asseembly file use the command `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S` this would generate object file `1to9_custom.o`.

**Execution:** To execute the object file run the command `spike pk 1to9_custom.o`

</details>

# Day-3

## Introduction to Open-Source Simulator iVerilog

<details>
<summary> Introduction to iVerilog Design Testbench </summary>
	
- **What is a Simulator?**
  - Simulator is a tool which is used for checking and simulate the design,its a software tool used to simulate and analyze the behavior of 
    digital circuits described in RTL (Register-Transfer Level) or gate-level representations.
  - RTL design is checked for adherence to the spec by simulating the design.
  - In this course we will be using **"iverilog"**
  - **How does a Simulator work?**
    - Simulator looks for the changes in the values of input signals.
    - upon change to the input, the output is evaluated.
    - if there is no change to input, then output is unchanged.

- **Introduction to Iverilog**
  - Icarus Verilog, often abbreviated as "iverilog,"is an open-source Verilog simulator used primarily for the simulation and verification of 
    digital circuits described in the Verilog hardware description language (HDL).
  - Icarus Verilog can be interacted through a command-line interface (CLI) ( -iverilog -o my_design my_design.v my_testbench.v ).
  - In iverilog we enter both the design and the testbench which gives a vdc file also known as "value change dump" file which is later used to 
    run and open in GTKwave(an open source waveform viewer).

     ![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/8bc3a765-5f01-45f1-beba-fe08f1830cee)


- **What is Design?**
  - Design is the actual verilog code or set of verilog codes which has the intended functionality to meet with the required specifications.

- **What is a Testbench?**
  - A "testbench" is a separate module or set of modules specifically created to test and verify the functionality of another module or design 
    under different conditions and scenarios.
  - Testbench is the setup to apply stimulus(test_vectors) to the design to check its functionality.
    
	![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5536f81a-96d7-45f8-8e81-a2d23fa15e33)

</details>

## Labs using Iverilog and GTKwave

<details>
<summary> Introduction to Lab </summary>

- git clone sky130RTLDesignAndSynthesisWorkshop
- once done we get sky130RTLDesignAndSynthesisWorkshop directory which contains the following files my_lib, lib , verilog_model, verilog_files 
  which we will use in out course 

</details>

<details>
<summary> Introduction to iVerilog GTKwave Part-1 </summary>	

in this we learn how to work with iVerilog and GTKwave:

- First we load the design files in iVerilog by choosing the file through Verilog_files folder where for every design we have an 
  associated testbench(ex:tb_design file).
  
- so for our first design we load a Mux into the Simulator:

Design file (good_mux.v):

`vim good_mux.v`
``` verilog

module good_mux (input i0 , input i1 , input sel , output reg y);
always @ (*)
begin
        if(sel)
                y <= i1;
        else
                y <= i0;
end
endmodule                 
```

Testbench file( tb_good_mux.v):

`vim tb_good_mux.v`
``` verilog

`timescale 1ns / 1ps
module tb_good_mux;
        // Inputs
        reg i0,i1,sel;
        // Outputs
        wire y;

        // Instantiate the Unit Under Test (UUT)
        good_mux uut (
                .sel(sel),
                .i0(i0),
                .i1(i1),
                .y(y)
        );

        initial begin
        $dumpfile("tb_good_mux.vcd");
        $dumpvars(0,tb_good_mux);
        // Initialize Inputs
        sel = 0;
        i0 = 0;
        i1 = 0;
        #300 $finish;
        end

always #75 sel = ~sel;
always #10 i0 = ~i0;
always #55 i1 = ~i1;
endmodule
```
-we can load the design file and testbench into the iverilog using the command:

`iverilog good_mux.v tb_good_mux.v` 

-this gives us a output file `a.out` which we will execute to run it:

![Screenshot from 2023-08-29 19-47-41](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5addc88b-a08a-490b-839e-c5d416e2796f)

-now execute the a.out file to give a `.vcd` (value change dump) file which can be used to run in GTKwave:

![Screenshot from 2023-08-29 19-51-32](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5a87c841-db29-4395-9a22-f05e528eee7e)

-the output file that `./a.out` given is now loaded into GTKwave waveform viewer using the command 

`gtkwave tb_good_mux.vcd`

this will give us a clear view of the design file:

![Screenshot from 2023-08-29 20-00-44](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/daf0ccab-e7db-4934-9181-085ab44df412)

</details>

<details>
<summary> Introduction to iVerilog GTKwave Part-2 </summary>
-to view the contents of the testbench file and the design file simultaneously  u can execute

`vim good_mux.v -o tb_good_mux.v`

![Screenshot from 2023-08-29 20-07-12](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/471100fd-998a-4f45-b795-256b85f571cc)

</details>

## Introduction to Yosys and Logic Synthesis

<details>
<summary> Introduction to Yosys </summary>

+ **What is Synthesizer?**
   -  a synthesizer refers to a software tool or program that takes a high-level hardware description of a digital circuit, typically written in a hardware description language (HDL) such as VHDL or Verilog, and translates it into a lower-level representation that can be implemented on specific hardware devices like FPGAs (Field-Programmable Gate Arrays) or ASICs (Application-Specific Integrated Circuits).
   -  in simple words Synthesizer is tool used for converting RTL to Netlist
   -  In this course "Yosys" is the Synthesizer used
 
	![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/8a9f006d-0372-4bd7-a953-b16d96305ac2)

   - here we apply design and .lib to Yosys to get the netlist file.
   - "Netlist file" is the representation of the design in standard cells in the .lib
 
+  **What is Yosys?**
        - Yosys is an open-source framework and tool suite for RTL (Register-Transfer Level) synthesis and formal verification of digital circuits.

+ **Yosys Setup:**
 
  - in Yosys setup we use the following commands to use the simulator and run it-
    
     - `read_verilog` command: to read the design
     - `read_liberty` command: to read the .lib
     - `write_verilog` command: to write the netlist file
 
- executing the write_verilog gives us the netlist file

   	![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/cf3d86b3-c0a7-4485-bef1-b15e6de0f54c)

 + **Verification of Synthesis:**
     - To verify if we have done the Synthesis without damaging our design files:

	![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/737a777b-6004-4487-a8b7-0d974173d19b)


	- we give our Netlist file and testbench to our simuluator iverilog.
   	- this gives us the Vcd (value change dump file), This vdc file is then loaded into GTKwave form viewer.
	- which gives us a stimulus as output

      -  NOTE: this stimulus should be same as the output observed during RTL simulation.
      -  NOTE: the set of Primary inputs/Primary outputs will remain same between the RTL design and the Synthesized Netlist where (same testbench can be used).

</details>

<details>
<summary> Introduction to Logic Synthesis </summary>

+ **What is Logic Synthesis?**
	- Logic synthesis is the process of converting a high-level hardware description into a netlist of lower-level digital logic gates, flip-flops, and interconnections.
 	- Logic synthesis is a critical step in the digital design process because it bridges the gap between a high-level hardware description and the physical implementation on specific hardware devices.
  	-  It allows designers to work at a higher level of abstraction, focusing on functionality and behavior, while leaving the details of hardware implementation to the synthesis tool.

	+ **What is RTL design?**
   		- RTL, which stands for Register-Transfer Level, is a level of abstraction used in digital circuit design to describe the behavior and functionality of a digital system.
  		- RTL design is a critical step in the development of digital systems because it provides a structured and systematic way to design and describe the behavior of complex digital circuits, making them easier to understand, simulate, verify, and implement in hardware.
  		-  it is the behavioral representation of the required specification where the specification is written in a HDL or Verilog language.

  	+ **What is Synthesis?**
  	  	- "synthesis" refers to the process of transforming a high-level hardware description written in a hardware description language (HDL), such as Verilog or VHDL, into a lower-level netlist representation that can be implemented on specific hardware devices like FPGAs (Field-Programmable Gate Arrays) or ASICs (Application-Specific Integrated Circuits).
  	  	- it is a RTL to Gate level translation.
  	  	- the design is converted into Gates and the connections are made between the Gates
  	  	- this is given out as a file called Netlist

			![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/0ed6c2b0-e19d-41ee-8a5a-2aa588967576)


	+ **What is .lib ?**
   		- ".lib" file is a library file that contains information about the electrical characteristics and timing specifications of standard cells or other digital logic elements.
  		- ".lib" files are essential for accurate digital circuit design, as they provide the necessary data for EDA tools to perform synthesis, optimization, and timing analysis.
  		- in simple words .lib is a collection of logic modules.
  		- it includes basic logic gates like AND, OR, NOT, etc.
  		- it has different flavours of same GATE.

+ **Why we need Different flavours of Gate?**
	- Different flavors or variants of logic gates are designed to meet various requirements and trade-offs in digital circuit design.
	- These variations enable trade-offs between factors like speed, power, area, and reliability, ensuring that digital circuits can be optimized for their intended applications.
	- in order for our circuit to be fast and quick we keep the clock frequency very high but the time period of clock should be as low as possible giving a relation between them,given by

 	                `F clock(max)=1/T clock(min)`

+ **Why do we need Cells?**
  	- particularly standard cells or library cells, are integral to modern digital circuit design. They offer a structured and efficient way to build digital circuits, allowing designers to leverage pre-designed, well-characterized components to achieve their design goals while saving time and resources.
  	- there are two types of cells Fast cells and Slow cells.

+ **What are fast cells and slow cells?**
  
    - "fast cells" refer to a specific type of standard cell library cells that are optimized for high-speed operation. These cells are designed to meet stringent timing requirements and are often used in applications where the speed of the circuit is critical.
  - we use fast cells for High-Speed Operation,Reduced Propagation Delay,Design Complexity,etc
  - but we need to ensure to balance their benefits with potential trade-offs in power consumption and design complexity and to ensure there is no SETUP time issues in our circuit.

  - "slow cells" are a type of standard cell library cells that are optimized for low-power operation rather than high-speed performance.
  - These cells are designed to minimize power consumption at the expense of speed.
  - hey are a valuable resource in digital circuit design for applications where power efficiency is critical, and where performance can be sacrificed to achieve extended battery life or reduced power consumption.
  - we choose slow cells when balancing power, speed, and area trade-offs to meet specific design requirements as to ensure there are no HOLD time issues in our circuit.

  - hence we need cells that work fast to meet the required performance and we need cells that work slow to meet HOLD time issues.

+ **Faster Cells vs Slower Cells**
  - Load in digital circuit is of Capacitence.
  - Faster the charging or dicharging of capacitance, lesser is the cell delay.
  - However, for a quick charge/ discharge of capacitor, we need transistors capable of sourcing more current i.e, we need **wide transistors**.
  - Wider transistors have lesser delay but consume more area and power.
  - Narrow transistors have more delay but consume less area and performance.
  - Faster cells come with a cost of area and power.
 
- hence:
  	- more use of faster cells we get a bad circuit in terms of power and area and hold time violations.
  	- more use of slower cells sluggish is the circuit does not meet the performance needs.
 
</details>

## Labs using Yosys and Sky130 PDKs

<details>
<summary> Yosys good_mux  </summary>	

**1st Step:** to run Yosys in terminal type **Yosys** in the verilog_files directory.

**2nd Step:** once in yosys we need to read the liberty files which can be done using- 
`read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`

**3rd Step:** Now we read the design file that we want to synthesize-
`read_verilog good_mux.v`

**4th Step:** to synthesize the design file type-
`synth -top good_mux`

![Screenshot from 2023-08-27 10-15-15](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b9ca010b-20ff-4a9c-9886-e35dad51b278)

**5th Step:** to generate the Netlist type-
`abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`

  doing this gives us a report of what cells are used and the number of input and output signals. 

  ![Screenshot from 2023-08-27 10-19-38](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/6d6a0706-d22d-4a1b-bf8d-0b506cc9673c)

**6th Step:** to see the Gate level logic circuit type-
`show`

  ![Screenshot from 2023-08-27 10-21-22](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/ce3b3485-2b57-4892-9a5b-c062eeefd020)

**7th Step:** to write the netlist file- 
`write_verilog good_mux_net.v`
`!vim good_mux_net.v`

![Screenshot from 2023-08-27 10-33-28](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/ae6386c0-043e-42cc-a4a3-6169abeba188)

**8th Step:** to make it in a more simplified form type-
`write_verilog -noattr good_mux_net.v`
`!vim good_mux_net.v`

![Screenshot from 2023-08-27 10-34-25](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/d90b48d4-f202-4ba4-8b7c-3ffa80d4dc0f)

</details>

# Day-4
## Introduction to Timing .Libs

<details>
<summary> Introduction to .Lib </summary>	

+ What a .Lib contains?

- .lib file typically refers to a library file that contains information related to digital cell libraries or standard cell libraries.
- These ".lib" files are used by electronic design automation (EDA) tools, such as synthesis tools and static timing analysis tools, to perform various tasks in the digital IC design process, including logic synthesis, timing analysis, and power optimization.

+ Contents of a .Lib file:
  
	- To view the contents in the .lib type  `vim ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
 
	![Screenshot from 2023-08-27 11-15-44](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/485fd020-8f2d-4506-92a5-ddd7971630be)

	- in this we see that the the first line tells us the name of the library that is ("sky130_fd_sc_hd__tt_025C_1v80").
	- tt : indicates variations due to process, it indicates **Typical Process**.
	- 025C : indicates the variations due to temperatures where the silicon will be used.
	- 1v80 : indicates the variations due to the voltage levels where the silicon will be incorporated.
  
	- when we look into library there are 3 words coming into picture that is PVT:
      	  
	- PVT-( Process, Voltage, Tempreture)
	- these 3 are very important for a design to work.
	- Process- is the variations due to fabrication.
	- Voltage- is the variations due to voltage.
	- Tempreture- is the variations due to tempreture.
	- all these 3 determine how our silicon is going to work. ie( faster or slower)

	- it also tells us the technology used ex: here the technology used is Cmos technology.
	- also mentions about the delay model here the delay model is table lookup.
	- mentions us the voltage process and tempreture units.

	- since .Lib is a bucket of cells, we have different flavours of different cells and different flavours of same cells.

	![Screenshot from 2023-08-27 11-18-43](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/95e49ca4-4cec-40dd-9d01-732aeebdffd6)

	- we see that for each cell the .lib shows its features ex: leakage power, timing information, area it occupies and etc.

</details>

## Hierarchical vs Flat Synthesis

<details>
<summary> Hierarchical Synthesis and Flat Synthesis </summary>	

+ What is Hierarchical Synthesis?

  - Hierarchical synthesis is a technique used in digital circuit design and synthesis to manage and optimize complex designs by breaking them down into smaller, more manageable and reusable hierarchical blocks or modules.
  -  Instead of designing the entire circuit as a single monolithic entity, designers use a hierarchical approach to organize the design into multiple levels of abstraction.
  -  Each level represents a different degree of detail and functionality, and the levels are interconnected to form the complete design.

+ the file used in this lab is `multiple_modules.v`:

	![Screenshot from 2023-08-27 11-51-01](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/95ca0ef5-379f-4552-b8ae-1f876b43d945)

`vim multiple_modules.v`
``` verilog
module sub_module2 (input a, input b, output y);
        assign y = a | b;
endmodule

module sub_module1 (input a, input b, output y);
        assign y = a&b;
endmodule


module multiple_modules (input a, input b, input c , output y);
        wire net1;
        sub_module1 u1(.a(a),.b(b),.y(net1));  //net1 = a&b
        sub_module2 u2(.a(net1),.b(c),.y(y));  //y = net1|c ,ie y = a&b + c;
endmodule

```

- this multiple_modules.v has 2 submodules `sub_module1` and `sub_module2`where sub_module1 is an AND gate and sub_module2 an OR gate:

![Screenshot from 2023-08-27 11-51-14](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/8185959d-f4a6-439f-b699-6c3c2fd90ca3)

- here in multiple_modules.v we see that we have 3 inputs (a,b,c) and an output y
- inputs a and b are connected to sub_module1 and its ouput is connected to sub_module2 with another input as c and its output is given to y.

+ now we synthesize it:

- to synthesize launch **yosys**
- read the libirty files using `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- read the verilog file using `read_verilog multiple_modules.v`
- now synthesise it using `synth -top multiple_modules`

![Screenshot from 2023-08-27 11-54-25](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/040ae662-fe84-49d6-a8f3-8d45612fd15a)

![Screenshot from 2023-09-03 01-24-49](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/52e0886d-b3ef-4a59-a652-3977a9d28d87)

- abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
- to view the netlist design type `show multiple_modules.v`

![Screenshot from 2023-09-03 01-26-58](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/71673c6e-63f3-4f97-b6b6-0b74bb02ca07)

- to write out the Netlist we type `write_verilog -noattr multiple_modules_hier.v`
- !vim multiple_modules_hier.v

![Screenshot from 2023-08-27 12-09-54](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/81271576-218f-4ce0-9c9f-2e2baee05878)


+ What is Flat Synthesis?

	- flat or flattened Symthesis is a process of Flattening a netlist in the context of electronic design refers to the process of transforming a hierarchical representation of a digital circuit into a single-level, non-hierarchical representation.
	- This is typically done as part of the digital design process, especially during synthesis and optimization stages.
	-  This can be beneficial for synthesis, optimization, simulation, and layout tasks, but it also comes with challenges related to increased complexity and the loss of hierarchical information.
 

+ to write flattened netlist:

   	- launch **yosys**
	- read the libirty files using `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
	- read the verilog file using `read_verilog multiple_modules.v`
	- now synthesise it using `synth -top multiple_modules`
	- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
	- to write out a flattened netlist type `flatten`
	- `write_verilog -noattr multiple_modules_flat.v`
	- `!vim multiple_modules_flat.v`

	![Screenshot from 2023-08-27 12-20-41](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/65f6ee25-c9d1-47cf-a942-8e92dfbab8e8)


+ when we try to see the difference between both the Netlist `multiple_modules_flat.v` and `multiple_modules_hier.v`:

  	- we see that the hierarchy of submodule1 and submodule2 are preserved in hier netlist while in flat netlist we dont see them its a single netlist.
  	- these hierarchys are flattened out.
  	- we see the direct instructions of AND and OR gate in the module called multiple_modules.
 
  	  ![Screenshot from 2023-08-27 12-18-07](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f6e5a27e-9b75-4054-b6a0-0369396db13a)

+ To do a Submodule synthesis:

 	- launch **yosys**
	- read the libirty files using `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
	- read the verilog file using `read_verilog multiple_modules.v`
	- now synthesise it using `synth -top sub_module1`

	![Screenshot from 2023-08-27 12-23-14](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/4920d16e-f18e-4976-b719-88f701f731e4)

- here we see that it is inferring a sub_module1 as it uses an AND gate.

	- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
	- `show`

 	![Screenshot from 2023-08-27 12-24-06](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/016a4275-e8d4-4331-b0db-4cc214e05919)

</details>

## Various Flop Coding Styles and Optimization

<details>
<summary> Why Flops and Flop Coding Styles</summary>	

**Why do we need a Flop?**

- In digital electronic circuits and digital system design, a "flop" typically refers to a flip-flop, which is a fundamental building block used for storing and manipulating binary information.
- Flip-flops are crucial components in digital logic circuits and serve several essential purposes such as Memory Element, Synchronization, Sequential Logic, Clocking, Edge Detection, Pipelining, State Storage, Memory Cells.
- flip-flops are essential components in digital electronics because they provide the means to store, manipulate, and control binary information, enabling the design and operation of a wide range of digital systems and devices, from simple registers to complex microprocessors and digital signal processors.
- Their role in sequential logic, synchronization, and memory storage is fundamental to the functioning of digital circuits and systems.
- It's a type of sequential logic element that stores binary information (0 or 1) and can change its output based on clock signals and input values.
- There will be multiple glitches for multiple combinational circuits.
- Hence, we need flops to store the data from the combinational circuits.
- When a flop is used, the output of combinational circuit is stored in it and it is propagated only at the posedge or negedge of the clock so that the next combinational circuit gets a glitch free input thereby stabilising the output.
- There are of two types synchronous and asynchronous.

**D Flip-Flop with Asynchronous Reset**

- A D flip-flop with an asynchronous reset is a type of digital flip-flop circuit that includes a "D" (data) input and an asynchronous reset input. It is a fundamental building block in digital electronics and sequential logic circuits.
- a D flip-flop with asynchronous reset stores data at the input (D) and transfers it to the output (Q) on a clock edge (depending on the flip-flop type).
- The asynchronous reset input (R) provides a means to force the output to a known state independently of the clock and data input, which is particularly useful for initializing or resetting digital circuits.
- The precise behavior and timing of the flip-flop depend on its specific type and implementation.
- in simple terms:
	- When the reset is high, the output of the flip-flop is forced to 0, irrespective of the clock signal.
 	- Else, on the positive edge of the clock, the stored value is updated at the output.

- `vim dff_asyncres_syncres.v`

![Screenshot from 2023-09-03 19-35-40](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/abaa27ed-f752-4568-8d8e-2aed5fe27bd2)

**D Flip-Flop with Asynchronous set**

- A D flip-flop with an asynchronous set input, also known as a D flip-flop with SET, is a digital logic circuit that combines the functionality of a D flip-flop with the capability to asynchronously set its output (Q) to a high logic level (usually 1) at any time, regardless of the clock signal and data input (D).
- in simple terms:
	- When the set is high, the output of the flip-flop is forced to 1, irrespective of the clock signal.
	- Else, on positive edge of the clock, the stored value is updated at the output.

- `vim dff_async_set.v`

![Screenshot from 2023-09-03 19-44-44](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5adae067-f728-4661-bcc1-d28d3a078060)

**D Flip-Flop with Synchronous Reset**
- When the reset is high on the positive edge of the clock, the output of the flip-flop is forced to 0.
- Else, on the positive edge of the clock, the stored value is updated at the output.

- `vim dff_syncres.v`

![Screenshot from 2023-09-03 19-49-59](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/ae1ae2f6-ec7e-485d-8cc9-cb6b0faf33c6)

</details>

<details>
<summary> Lab Flop Synthesis Simulations </summary>	

**D Flip-Flop with Asynchronous Reset**

+ **Simulation**

![Screenshot from 2023-08-27 15-36-55](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f2cf4684-2f6a-4bae-9eef-3121df9db264)

  - `gtkwave tb_dff_asyncres.vcd`

![Screenshot from 2023-08-27 15-39-46](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/456da409-7056-41bd-88a8-27da609d098a)

+ **Synthesis**

  - `cd vsd/sky130RTLDesignAndSynthesisWorkshop/verilog_files`
  - `yosys`
  - `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `read_verilog dff_asyncres.v`
  - `synth -top dff_asyncres`
  - `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `show`
 
![Screenshot from 2023-08-27 16-02-12](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/594d460d-8956-449e-8033-e2a0dd080824)

**D Flip_Flop with Asynchronous Set**

+ **Simulation**

![Screenshot from 2023-08-27 15-44-22](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/d30e9b85-c31e-4ade-8b49-1133be2bc570)

- `gtkwave tb_dff_async_set.vcd`

![Screenshot from 2023-08-27 15-47-11](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/c3454804-50c0-4796-bfee-bc3286887d26)

+ **Synthesis**
  - `cd vsd/sky130RTLDesignAndSynthesisWorkshop/verilog_files`
  - `yosys`
  - `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `read_verilog dff_async_set.v`
  - `synth -top dff_async_set`
  - `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `show`
 
![Screenshot from 2023-08-27 16-06-02](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5dfd04df-5881-482d-89bb-21baa4700419)

**D Flip-Flop with Synchronous Reset**

+ **Simulation**

![Screenshot from 2023-08-27 15-51-14](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/3cf31180-378e-4c6a-8caf-ed3d73c0ec14)

- `gtkwave tb_dff_syncres.vcd`

![Screenshot from 2023-08-27 15-56-10](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/095d6c5c-d58e-4f7a-b25e-42e9599f6781)

+ **Synthesis**
  - `cd vsd/sky130RTLDesignAndSynthesisWorkshop/verilog_files`
  - `yosys`
  - `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `read_verilog dff_syncres.v`
  - `synth -top dff_syncres`
  - `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
  - `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  - `show`

![Screenshot from 2023-09-03 20-17-28](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/807ff240-1f99-48b5-a410-757f852255cc)

</details>

<details>
<summary> Interesting Optimisations </summary>

- `vim mult_2.v`

![Screenshot from 2023-08-27 16-12-23](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5199fce0-1174-449e-b4ff-a9c9483731f4)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog mult_2.v`
- `synth -top mul2`

![Screenshot from 2023-08-27 17-29-21](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/c39d68dc-a6fc-4af5-ae01-c3ba85e7295a)

- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-27 17-31-02](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/72586be9-72b3-4ef3-a8fe-7b6219acd93b)

- `write_verilog -noattr mul2_netlist.v`
- `!gvim mul2_netlist.v`

![Screenshot from 2023-08-27 17-36-35](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/a865c4b5-a9f0-4f27-afc7-b6ff2d78a4b2)

- `vim mult_8.v`

![Screenshot from 2023-08-27 16-12-10](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/1ab8f82d-e7bf-4d56-8c8b-8e158631c4a4)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  `
- `read_verilog mult_8.v`
- `synth -top mult8`

![Screenshot from 2023-08-27 17-41-21](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/9c0c0e3c-6718-45dd-abc2-9a48da9837f0)


- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-27 17-42-08](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/dbc409f8-6de1-4a0c-bb14-40069445768a)

- `write_verilog -noattr mult8_netlist.v`
- `!gvim mult8_netlist.v`

![Screenshot from 2023-08-27 17-46-38](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b09f3790-570e-4598-95b6-36b545e0a24d)

</details>

# Day 5
## Introduction to Optimisations 

<details>
<summary> Combinational Optimisation </summary>

- Combinational logic optimization refers to the process of improving the efficiency, performance, and resource utilization of a digital combinational circuit.
- Combinational circuits are a type of digital logic circuit where the output is solely determined by the current input values, and there are no feedback loops or memory elements like flip-flops.
-  Optimising the combinational logic circuit is squeezing the logic to get the most optimized digital design so that the circuit finally is area and power efficient.
- Techniques for Optimisations:
  - **Constant propagation** is an optimization technique used in compiler design and digital circuit synthesis to improve the efficiency of code and circuit implementations by replacing variables or expressions with their constant values where applicable.
  - **Boolean logic optimization**, also known as logic minimization or Boolean function simplification, is a process in digital design that aims to simplify Boolean expressions or logic circuits by reducing the number of terms, literals, and gates required to implement a given logical function.
 
</details>

<details>
<summary> Sequential Logic Optimisations </summary>	

- Sequential logic optimization refers to the process of improving the efficiency, performance, and resource utilization of digital sequential circuits.
- unlike combinational logic circuits, sequential circuits have memory elements, such as flip-flops, which store information and provide feedback.
- Sequential logic is commonly used in applications that require memory, state retention, and control over time.
- The main goals of sequential logic optimization are similar to those of combinational logic optimization but also include considerations related to state transitions and timing.
- Optimizing sequential logic is crucial in ensuring that digital circuits meet timing requirements, consume minimal power, and occupy the least possible area while maintaining correct functionality.
- Optimisation methods:
  - **Sequential constant propagation**, also known as constant propagation across sequential elements, is an optimization technique used in digital design to identify and propagate constant values through sequential logic elements like flip-flops and registers. This technique aims to replace variable values with their known constant values at various stages of the logic circuit, optimizing the design for better performance and resource utilization.
  - **State optimization**, also known as state minimization or state reduction, is an optimization technique used in digital design to reduce the number of states in finite state machines (FSMs) while preserving the original functionality.
  - **Sequential logic cloning**, also known as retiming-based cloning or register cloning, is a technique used in digital design to improve the performance of a circuit by duplicating or cloning existing registers (flip-flops) and introducing additional pipeline stages. This technique aims to balance the critical paths within a circuit and reduce its overall clock period, leading to improved timing performance and better overall efficiency.
  - **Retiming** is an optimization technique used in digital design to improve the performance of a circuit by repositioning registers (flip-flops) along its paths to balance the timing and reduce the critical path delay. The primary goal of retiming is to achieve a shorter clock period without changing the functionality of the circuit.
 
</details>

## Combinational Logic Optimisations

<details>
<summary> opt_checks(1,2,3,4)</summary>	

- the files we will be using in this is Opt_files shown below:

![Screenshot from 2023-08-28 17-39-14](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/dc550baf-9f9c-43d0-9d42-df087638f420)

+ **Opt_check**

- `vim opt_check.v`

![Screenshot from 2023-08-28 17-40-32](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5576bbc1-9a86-4e82-9206-347395a3852c)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog opt_check.v`

![Screenshot from 2023-08-28 17-44-22](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/1042ada6-c5fe-483f-a540-5a4b2be9a1ad)

- `synth -top opt_check`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 17-45-03](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/7eadaf2a-2506-40ba-8693-66857b717030)

![Screenshot from 2023-08-28 17-45-48](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/be30c0d8-7d25-44be-9cec-85c0f38ce8d9)

+ **Opt_check2**

- `vim opt_check2.v`

![Screenshot from 2023-08-28 17-42-18](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/9c4ef5cf-77a2-44f8-aba7-6b5398b28d9b)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog opt_check2.v`
- `synth -top opt_check2`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 17-48-02](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/864c8626-5d33-476a-b3e9-fa77f9407f5c)

+ **opt_check3**

- `vim opt_check3.v`

![Screenshot from 2023-08-28 17-42-28](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/43338f0d-d434-4f77-953b-1d99f34d5f8d)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog opt_check3.v`
- `synth -top opt_check3`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 18-14-56](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/987a43ae-fe35-45bd-bd9e-f99685b0a88d)

+ **opt_check4**

- `vim opt_check4.v`

![Screenshot from 2023-08-28 17-42-51](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/3b9a9ffc-e360-447d-aba3-36c5c9918a93)


- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog opt_check4.v`
- `synth -top opt_check4`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 18-18-48](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/4c8f0e01-dd33-4c4d-a67b-67b31d8bcb07)

</details>


<details>
<summary> multiple_module_opt </summary>

- `vim multiple_module_opt.v`

![Screenshot from 2023-09-03 21-34-08](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/87ee6acb-22a5-457e-b083-e3bdcb8548bf)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog multiple_module_opt.v`
- `synth -top multiple_module_opt`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-09-03 21-36-32](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/bf36420e-df21-4260-b204-ec24c10edf12)

![Screenshot from 2023-09-03 21-37-41](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/723f0678-9229-4e47-a855-a9d13b615797)

- **multiple_module_opt2**

- `vim multiple_module_opt2.v`

![Screenshot from 2023-09-03 21-40-53](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/db0db0b5-62d6-4464-9a90-3fa2ba734202)


- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog multiple_module_opt2.v`
- `synth -top multiple_module_opt2`
- `opt_clean -purge`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 18-33-57](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/d9205a6a-d3e8-4b8c-a19b-a97fc793be13)


</details>

## Sequential Logic Optimisations


<details>
<summary> dff_const(1,2,3,4,5) </summary>	

the files we will be using in this are dff_const files shown below:

![Screenshot from 2023-08-28 18-51-26](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f5493663-26f9-4cdb-866d-3117539307a4)

- **dff_const1**

- `vim dff_const1.v`

![Screenshot from 2023-08-28 18-53-26](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/3d8344d0-6e6d-4c37-887f-bc40e7ad1744)

**Simulation**

- `iverilog dff_const1.v tb_dff_const1.v`
- `/a.out`
- `gtkwave tb_dff_const1.vcd`

![Screenshot from 2023-08-28 19-13-22](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/0e6d8d63-3e1d-4627-8927-1c4806cea6ea)

**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog dff_const1.v`
- `synth -top dff_const1`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 19-23-17](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/801b4c4e-078b-475c-8193-58a2839c193c)

![Screenshot from 2023-08-28 19-19-27](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/4682d0f4-b186-4011-b2c0-661c1a5ae382)

- **dff_const2**

- `vim dff_const2.v`

![Screenshot from 2023-08-28 18-53-37](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/1541ce11-8f8e-40e4-a0ab-55fe6152f80f)

**Simulation**

- `iverilog dff_const2.v tb_dff_const2.v`
- `/a.out`
- `gtkwave tb_dff_const2.vcd`

![Screenshot from 2023-08-28 19-14-29](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/85b93a46-4637-42db-abb7-5fa56a480c19)

**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog dff_const2.v`
- `synth -top dff_const2`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 19-23-46](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5df628eb-eb79-4838-a1ed-fc11c04dd196)

![Screenshot from 2023-08-28 19-24-13](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/308a5c99-d6ae-4588-b4f0-987bd9251cec)

- **dff_const3**

- `vim dff_const3.v`

![Screenshot from 2023-08-28 19-25-18](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5803d512-2c4d-442a-bda8-81dfa446633e)

**Simulation**

- `iverilog dff_const3.v tb_dff_const3.v`
- `/a.out`
- `gtkwave tb_dff_const3.vcd`

![Screenshot from 2023-08-28 19-42-40](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b3d69f68-01a6-48b0-9cba-78421e6e30b0)

**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog dff_const3.v`
- `synth -top dff_const3`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 19-43-48](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/a1144857-6896-4a69-835a-9205c5d59750)

![Screenshot from 2023-08-28 19-45-06](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b667b65f-021f-4af5-a932-88b05af8dba3)

- **dff_const4**

- `vim dff_const4.v`

![Screenshot from 2023-08-28 19-47-49](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f43972e5-e2ca-4a51-923e-709eed321709)

**Simulation**

- `iverilog dff_const4.v tb_dff_const4.v`
- `/a.out`
- `gtkwave tb_dff_const4.vcd`

![Screenshot from 2023-08-28 19-47-25](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/4ea4e1dd-853b-4e95-b373-4afcb334b112)

**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog dff_const4.v`
- `synth -top dff_const4`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 19-50-20](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/1e28a6c0-a956-4e84-b1e3-96dc519b4fb7)

- **dff_const5**

- `vim dff_const5.v`

![Screenshot from 2023-08-28 19-48-22](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/cb4e0e16-fb46-4340-a955-ec07adfd3625)


**Simulation**

- `iverilog dff_const5.v tb_dff_const5.v`
- `/a.out`
- `gtkwave tb_dff_const5.vcd`

![Screenshot from 2023-08-28 19-49-17](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/373159e5-a403-4eb7-9b56-b60529bf0e46)

**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog dff_const5.v`
- `synth -top dff_const5`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib `
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 19-51-19](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/a23f8dca-6d1c-43a6-bf65-aa1666b9a9eb)
  	
</details>


## Sequential Optimisations for Unused Outputs

<details>
<summary> counter_opt(1,2)</summary>

+ **counter_opt1**

- `vim counter_opt.v`

![Screenshot from 2023-08-28 19-59-30](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f5138423-e533-4e6e-ad7e-1a176ae79d01)

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog counter_opt.v`
- `synth -top counter_opt`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 21-41-31](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b229cee2-5753-47cc-bf82-887e11bbe307)

![Screenshot from 2023-08-28 21-41-56](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/5c77a654-d444-4734-afb6-9ddcfc4d9be0)

+ **counter_opt2**

- `vim counter_opt2.v`

![Screenshot from 2023-08-28 21-45-35](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/05a369d8-0f18-42ce-84ce-4407850da0c2)


- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog counter_opt2.v`
- `synth -top counter_opt2`
- `dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-28 21-50-11](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/8d84fcba-9c15-4529-b35d-26461ab319ca)

![Screenshot from 2023-08-28 21-53-50](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/d3de6454-388c-4c36-b9f9-be1f3f5169a7)

</details>

# Day 6
## GLS Synthesis-Simulation Mismatch and Blocking Non-blocking Statements


<details>
<summary> GLS Concepts And Flow Using Iverilog </summary>	

+ **(GLS) Gate Level Simualtion**

	- Gate-level simulation is a type of digital logic simulation used in the field of digital design and electronic circuit testing. It involves simulating the behavior of a digital circuit at the gate-level of abstraction.
	- In digital design, circuits are typically built using basic logic gates like AND gates, OR gates, NAND gates, NOR gates, XOR gates, and flip-flops.
	- Gate-level simulation operates at this lower level of abstraction and is often used to verify the correctness of a design before it is implemented in hardware.
	- Gate-level simulation is a technique used in digital design and verification to validate the functionality of a digital circuit at the gate-level implementation.
	- It involves simulating the circuit using the actual logic gates and flip-flops that make up the design, as opposed to higher-level abstractions like RTL (Register Transfer Level) descriptions.
	- This type of simulation is typically performed after the logic synthesis process, where a high-level description of the design is transformed into a netlist of gates and flip-flops.
	- We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met.
  
<img width="608" alt="image" src="https://github.com/Veda1809/pes_asic_class/assets/142098395/6298b067-2f45-4dbc-ad25-762ac3d8be63">

+ **Synthesis-Simulation Mismatch**
  
	- Synthesis-simulation mismatch refers to a situation in digital design and electronic design automation (EDA) where there are discrepancies or inconsistencies between the behavior of a digital circuit as described in a hardware description language (HDL) during simulation and its actual behavior after synthesis and implementation on hardware.
  	- This discrepancy can occur due to various reasons, such as timing issues, optimization conflicts, and differences in modeling between the simulation and synthesis tools.
	- This mismatch is a critical concern in digital design because it indicates that the actual hardware implementation might not perform as expected, potentially. 

+ **Blocking Statements**

	- Blocking statements are a type of statement used in hardware description languages (HDLs) like Verilog and VHDL for specifying sequential and concurrent behavior within digital circuits.
	- Blocking statements are used to define operations that are executed in a deterministic order, meaning one operation is completed before the next begins.
	- Blocking statements are executed sequentially in the order they appear in the code and have an immediate effect on signal assignments.

+ **Non-Blocking Statements**

	- Non-blocking statements are a type of statement used in hardware description languages (HDLs) like Verilog and VHDL to describe concurrent assignments within digital circuits.
	- Non-blocking assignments allow multiple assignments to be scheduled to occur simultaneously, enabling the modeling of combinational logic and parallel execution of statements within the same procedural block.
	- They are particularly useful for describing the behavior of flip-flops and sequential logic in a way that resembles hardware behavior.
	- Non-blocking assignments are used to model concurrent signal updates, where all assignments are evaluated simultaneously and then scheduled to be updated at the end of the time step.


+ **Caveats with Blocking Statements**

	- Blocking statements are commonly used in hardware description languages (HDLs) like Verilog and VHDL to describe sequential behavior and to specify the execution order of statements. While they are essential for modeling certain aspects of digital circuits, there are some important caveats and considerations to keep in mind when using blocking statements:
	- Sequential Execution, Inaccurate Modeling of Combinational Logic, Sensitivity Lists, Lack of Parallelism,Race Conditions,Behavioral Differences.
	- To mitigate these caveats and ensure accurate modeling of digital circuits, it's essential to understand the differences between blocking and non-blocking assignments, choose the appropriate assignment type for each scenario, and carefully design and verify your code.

</details>


## Labs on GLS and Synthesis-Simulation Mismatch

<details>
<summary> ternary_operator_mux </summary>	

- `vim teranry_operator_mux.v`

![Screenshot from 2023-08-28 23-20-19](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/a9ffb286-516d-4cf7-a374-3149229e4ef2)

**Simulation**

![Screenshot from 2023-08-28 23-22-26](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/7de0b3b5-f5fe-4c87-9acc-5921f504f768)

![Screenshot from 2023-08-28 23-23-19](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/c1dcd584-fb51-4594-b871-ecdd6d495e2d)


**Synthesis**

+ `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `read_verilog ternary_operator_mux.v`
+ `synth -top ternary_operator_mux`
+ `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `show`

![Screenshot from 2023-08-28 23-24-23](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f15de854-95cf-4836-b303-a7714e3889e7)

![Screenshot from 2023-08-28 23-25-50](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b0782f5e-9369-44e9-8649-40600d235542)

**GLS to Gate-Level Simulation**

![Screenshot from 2023-08-28 23-28-06](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/827e2ac2-1ab4-4e2c-b0f9-e8fc23535fe2)

![Screenshot from 2023-08-28 23-30-05](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/4b55463a-fde0-409a-9d8e-05c27e0cb1c7)

</details>

<details>
<summary> bad_mux </summary>	

- `vim bad_mux.v`

![Screenshot from 2023-08-28 23-20-27](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/41a8833b-ff77-4a6f-a5f4-259021d95d2e)


**Simualtion**

![Screenshot from 2023-08-28 23-36-25](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/abf1ce5d-e043-42e9-b105-1bb61e9770f0)


![Screenshot from 2023-08-28 23-38-37](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/2f7cfdf4-005e-4ac4-8e69-d1f8c61950de)


**Synthesis**

+ `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `read_verilog bad_mux.v`
+ `synth -top bad_mux`
+ `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
+ `show`

![Screenshot from 2023-08-28 23-41-25](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/669428eb-3c2b-4e82-81a5-64fdadd36384)

![Screenshot from 2023-09-04 00-08-56](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/f2786a74-8e4f-4551-b7d6-fca8a82e4d99)

**GLS to Gate-Level Simulation**

![Screenshot from 2023-08-28 23-43-46](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b75efeb5-0434-4a68-b1bd-04866de20ba7)

![Screenshot from 2023-08-28 23-45-15](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/abb3979f-87fb-4271-b884-d46c6e4b02dd)

</details>

## Labs on Synth-Sim Mismatch for Blocking Statement

<details>
<summary> blocking_caveat </summary>	

- `vim blocking_caveat.v`

![Screenshot from 2023-08-29 12-54-33](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/2a740abe-81b0-4944-80c3-851fdd336d22)

**Simualtion**

- `iverilog blocking_caveat.v tb_blocking_caveat.v`
- `./a.out`
- `gtkwave tb_blocking_caveat.vcd`

![Screenshot from 2023-08-29 12-57-57](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/d10d69a3-984c-4285-9603-9a52ca168b2a)


**Synthesis**

- `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `read_verilog blocking_caveat.v`
- `synth -top blocking_caveat`
- `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
- `show`

![Screenshot from 2023-08-29 13-00-21](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/7c9d5116-b2ec-4ba9-a050-560b605f8002)

**GLS to Gate-Level Simulation**

- `iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v blocking_caveat_net.v tb_blocking_caveat.v`
- `./a.out`
- `gtkwave tb_blocking_caveat.vcd`

![Screenshot from 2023-08-29 13-03-30](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/77970316-0f35-49b0-af60-1a8fd0b04d9f)







