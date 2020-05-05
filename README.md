# lib_asm

A small library, coded in [ASM](https://en.wikipedia.org/wiki/Assembly_language). (macOS)

![Image description](https://i.ibb.co/6YtskVs/Capture-d-cran-de-2020-05-05-18-23-08-1.png)

Six basic functions :

- read
- strcmp
- strcpy
- strdup
- strlen
- write

## Usage

```bash
make

# compile test with the library
gcc test.c libasm.a

# execute test
echo "char" | ./a.out
```

### Assembly language

In computer programming, assembly language, often abbreviated asm, is any low-level programming language in which there is a very strong correspondence between the instructions in the language and the architecture's machine code instructions. Because assembly depends on the machine code instructions, every assembler has its own assembly language which is designed for exactly one specific computer architecture. Assembly language may also be called symbolic machine code.
