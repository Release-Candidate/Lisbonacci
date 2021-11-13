# Lisbonacci

A small Common Lisp project to show interactive programming possibilities using Emacs and Sly (a Slime fork).

The goal is to present the usage of a Common Lisp REPL to people using a small program to calculate a number, so that this number and the given value form a golden ratio.
In mathematical terms: let `a` be the given non-negative number Lisbonacci returns a number `b`, so that `a : b == b : a + b`.
To calculate the golden ratio, Lisbonacci uses the fibonacci sequence - hence the name - as the golden ratio can be approximated by the quotient of two consecutive Fibonacci numbers.
In mathematical terms: let `[f0, f1, f2, ... , fn, fn+1, ... ]` be the Fibonacci sequence, then the quotient `fn/fn+1 ~=` Golden ratio.
Each Fibonacci number `fn` can be recursively calculated as the sum of its predecessor. `fn = fn-1 + fn-2` (for  `n >1`), and `f0 = 0` and `f1 = 1`.

Links:

 - Golden ratio: [Wolfram Alpha- Golden ratio](https://mathworld.wolfram.com/GoldenRatio.html) [Wikipedia - Golden ratio](https://en.wikipedia.org/wiki/Golden_ratio)
- Fibonacci sequence [Wolfram Alpha - Fibonacci number](https://mathworld.wolfram.com/FibonacciNumber.html) [Wikipedia - Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_numbers)

## Remarks

This is to show off the Common Lisp style REPL to users who don't know Lisp:
The Lisp code is deliberately simple and uses a naive, straightforward _slow_ implementation of the fibonacci sequence
