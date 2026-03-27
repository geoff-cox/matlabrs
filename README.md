# Introduction to Programming with MATLAB

**A Resource for Mathematicians, Engineers, and Scientists**

By Geoffrey W. Cox, Ph.D. — Department of Applied Mathematics, Virginia Military Institute

> **Work in Progress.** This textbook is under active development and is currently used as lecture resources.

## About

This is an interactive textbook built with [PreTeXt](https://pretextbook.org/) for learning introductory MATLAB programming. It covers core programming concepts through worked examples, interactive elements, and exercises.

## Chapter Structure

1. **Welcome to MATLAB** — Installing MATLAB, the desktop environment, the command window, and variables
2. **Scripts and Functions** — Writing scripts and defining functions
3. **If and Switch Statements** — Logical values, logical statements, if statements, and switch statements
4. **For and While Loops** — For loops, while loops, comparing the two, and additional flow control
5. **Arrays** *(incomplete)* — Array basics, creating arrays, indexing, operations, and array functions
6. **Nested Loops** *(incomplete)* — Working with nested loop structures

## Building

Requires [PreTeXt CLI](https://pretextbook.org/doc/guide/html/processing-CLI.html). See `requirements.txt` for the pinned version (`pretext == 2.37.1`).

```bash
# Install PreTeXt
pip install pretext

# Build the web version
pretext build web

# Preview locally
pretext view web

# Build PDF
pretext build pdf
```

Additional build targets (`quiz`, `quiz-key`, `dev`, `runestone`) are defined in `project.ptx`.

## License

Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
