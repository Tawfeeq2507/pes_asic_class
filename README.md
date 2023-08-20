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
# Introduction to Basic Keywords
## Introduction
- **ISA (Instruction Set Archhitecture)**
  - ISA defines the interface between a computer's hardware and its software, specifically how the processor and its components interact with the software instructions that drive the execution of tasks.
  - It encompasses a set of instructions, addressing modes, data types, registers, memory organization, and the mechanisms for executing and managing instructions.

- **RISC-V (Reduced Instruction Set Computing - Five)**.
  - It is an open-source Instruction Set Architecture (ISA) that has gained significant attention and adoption in the world of computer architecture and semiconductor design.
  - RISC architectures simplify the instruction set by focusing on a smaller set of instructions, each of which can be executed in a single clock cycle. This approach usually leads to faster execution of individual instructions. 

<img width="536" alt="image" src="https://github.com/Veda1809/pes_asic_class/assets/142098395/4eabe0b7-4581-419b-88e7-84c7ac1dac8e">

## From Apps to Hardware
1. **Apps:** Application software, often referred to simply as "applications" or "apps," is a type of computer software that is designed to perform specific tasks or functions for end-users.
2. **System software:** System software refers to a category of computer software that acts as an intermediary between the hardware components of a computer system and the user-facing application software. It provides essential services, manages hardware resources, and enables the execution of application programs. System software plays a critical role in maintaining the overall functionality, security, and performance of a computer system.'
3. **Operating System:** The operating system is a fundamental piece of software that manages hardware resources and provides various services for both users and application programs. It controls tasks such as memory management, process scheduling, file system management, and user interface interaction. Examples of operating systems include Microsoft Windows, macOS, Linux, and Android.

4. **Compiler:** A compiler is a type of software tool that translates high-level programming code written by developers into assembly-level language.

5. **Assembler:** An assembler is a software tool that translates assembly language code into machine code or binary code that can be directly executed by a computer's processor.

6. **RTL:** RTL serves as an abstraction level in the design process that represents the behavior of a digital circuit in terms of registers and the operations that transfer data between them.

 7. **Hardware:** Hardware refers to the physical components of a computer system or any electronic device. It encompasses all the tangible parts that make up a computing or electronic device and enable it to perform various tasks.

## Detail Description of Course Content
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

# Labwork for RISCV Toolchain
## C Program
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

Using the gcc compiler, we compiled the program to get the output.

`gcc sumton.c`

`.\a.out`

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/0c9f2719-f438-4a6b-b565-04f9dec1efa1)

## RISCV GCC Compiler and Dissemble

Using the riscv gcc compiler `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sumton.o sumton.c`, we compiled the C program.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/c8e7d12b-253b-40b4-a150-102d1d281fd2)

To get the assembly code for the C program, `riscv64-unknown-elf-objdump -d sumton.o | less` .

In order to view the main section, type `/main`.

Here, since we used `-O1` optimisation, the number of instructions are 11.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/690d164d-e499-452b-967c-906550e9e78c)

When we use `-Ofast` optimisation, we can see that the number of instructions are 11.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/e2f76f68-489d-4383-bcac-4fcb08261c01)

## Spike Simulation and Debug

`spike pk sum1ton.o` is used to check whether the instructions produced are right to give the correct output.

`spike -d pk sum1ton.c` is used for debugging.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/b5d622d9-f5d6-4d6b-bea5-bd4ca0c2134c)

The contents of the registers can also be viewed.

![image](https://github.com/Tawfeeq2507/pes_asic_class/assets/142083027/9f74dc64-004f-4c1d-a580-6494ca8134d1)

# Integer Number Representation 

## Unsigned Numbers
- Unsigned numbers, also known as non-negative numbers, are numerical values that represent magnitudes without indicating direction or sign.
- Range: 0 to 2^(N) - 1.

## Signed Numbers
- Signed numbers are numerical values that can represent both positive and negative magnitudes, along with zero.
- Range : -(2^(N-1)) to 2^(N-1) - 1.
 
## Labwork
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


# Application Binary Interface
## Introduction to ABI
+ An Application Binary Interface (ABI) is a set of rules and conventions that dictate how binary code interacts with and communicates with other binary code, typically at the level of machine code or compiled code. In simpler terms, it defines the interface between two software components or systems that are written in different programming languages, compiled by different compilers, or running on different hardware architectures.
+ The ABI is crucial for enabling interoperability between different software components, such as different libraries, object files, or even entire programs. It allows components compiled independently and potentially on different platforms to work seamlessly together by adhering to a common set of rules for communication and data representation.
## Memmory Allocation for Double Words
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
## Load, Add and Store Instructions
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
## 32-Registers and their ABI Names
The choice of the number of registers in a processor's architecture, such as the RISC-V RV64 architecture with its 32 general-purpose registers, involves a trade-off between various factors. While modern processors can have more registers but increasing the number of registers could lead to larger instructions, which would take up more memory and potentially slow down instruction fetch and decode.
#### ABI Names
ABI names for registers serve as a standardized way to designate the purpose and usage of specific registers within a software ecosystem. These names play a critical role in maintaining compatibility, optimizing code generation, and facilitating communication between different software components. 

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/b735fc44-0c08-40e8-8303-c338647dbd9f)
# Labwork using ABI Function Calls
## Algorithm for C Program using ASM
- Incorporating assembly language code into a C program can be done using inline assembly or by linking separate assembly files with your C code.
- When you call an assembly function from your C code, the C calling convention is followed, including pushing arguments onto the stack or passing them in registers as required.
- The program executes the assembly function, following the assembly instructions you've provided.

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/1d76b7ef-cac9-4331-9190-31af36525e0c)

## Review ASM Function Calls
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

## Simulate C Program using Function Call
**Compilation:** To compile C code and Asseembly file use the command `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S` this would generate object file `1to9_custom.o`.

**Execution:** To execute the object file run the command `spike pk 1to9_custom.o`























