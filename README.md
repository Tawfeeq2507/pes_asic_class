![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools.

**Course Name** : VLSI Physical Design for ASICs  
**Instructor** : Kunal Ghosh 

# VLSI Physical Design for ASICs
The objective of VLSI (Very Large Scale Integration) physical design for ASICs (Application-Specific Integrated Circuits) is to transform a digital circuit's logical representation into a physical layout that meets various performance, power, area, and manufacturability requirements.
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












      






















