# Lisbonacci

A small Common Lisp project to show interactive programming possibilities using Emacs and Sly (a Slime fork). Because of an article at Hacker News [Why Lisp? ](https://news.ycombinator.com/item?id=29202021) and to give a short answer to the question 'what is so special about the common Lisp REPL?'.

The goal is to present the usage of a Common Lisp REPL to people using a small program to calculate a number, so that this number and the given value form a golden ratio.

The 3 minute video at YouTube [Common Lisp and Emacs (Sly) REPL example at YouTube](https://www.youtube.com/watch?v=9AyfcGZow34)

The video consists of the following parts:

1. the file [./src/main.lisp](./src/main.lisp) is compiled and sent to the REPL (Sly, a Slime fork that for example has [Stickers](https://joaotavora.github.io/sly/#Stickers), a kind of special debugging breakpoint)
2. the Lisp package (that's like a module in other languages) `lisbonacci` is loaded - see files [./lisbonacci.asd](./lisbonacci.asd) and [./src/main.lisp](./src/main.lisp) for the package's definition
3. the main loop is started by calling the function `main-loop`. This loop asks the user to input a number, it then calculates a value that forms a golden ratio with this given number. Afterwards it asks the user if he wants to quit. The `^G` you see is the function `yes-or-no-p` that 'rings' an ASCII bell before asking its question.
4. the function `fibonacci`, that calculates the n-th Fibonacci number, is changed in the editor and compiled. The function is changed at the same time in the REPL, the new version of the function is called.
5. now the main loop is changed and compiled. This time, because the main loop still runs, we have to break the program (by typing `<Ctrl>-<c> <Ctrl>-<c>`) and let the REPL reload the running function `mainloop`.

So, hot-reloading in a Common Lisp REPL is not totally different to other languages, but it is still a bit easier to do and has less limitations, like being able to change a running function.

| The Emacs keybinding to compile the Lisp file and send it to Sly is `C-c C-k`, to compile the current function use `C-c C-c` in the lisp buffer. You do not need to call `M-x sly-compile-...`, this is for better visibility in the video |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |

## The Golden Ratio

Lisbonacci is a program to calculate a number, so that this number and the given value form a golden ratio.

In mathematical terms:

- let `a` be the given non-negative number.
- Lisbonacci returns a number `b`, so that `a : b == b : a + b`.

To calculate the golden ratio, Lisbonacci uses the fibonacci sequence - hence the name - as the golden ratio can be approximated by the quotient of two consecutive Fibonacci numbers.

In mathematical terms:

- let `[f0, f1, f2, ... , fn, fn+1, ... ]` be the Fibonacci sequence, then the quotient `fn/fn+1 ~=` Golden ratio. See function `golden-ratio` in [./src/main.lisp](./src/main.lisp):

    ```lisp
    (defun golden-ratio (number)
    "Calculate the golden ratio to the given number `number`.
    Return the number which forms a golden ratio with the given number `number`."
    (* number (/ (fibonacci 32) (fibonacci 31))))
    ```

- each Fibonacci number `fn` can be recursively calculated as the sum of its two predecessors. `fn = fn-1 + fn-2` (for  `n > 1`), and `f0 = 0` and `f1 = 1`. See the recursive function `fibonacci` in [./src/main.lisp](./src/main.lisp):

    ```lisp
    (defun fibonacci (n)
    "Calculate the `n`th fibonacci number.
    Return the `n`th fibonacci number"
    (if (eql n 0)
        0
        (if (eql n 1)
            1
            (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))
    ```

Links:

- Golden ratio: [Wolfram Alpha- Golden ratio](https://mathworld.wolfram.com/GoldenRatio.html) and [Wikipedia - Golden ratio](https://en.wikipedia.org/wiki/Golden_ratio)
- Fibonacci sequence [Wolfram Alpha - Fibonacci number](https://mathworld.wolfram.com/FibonacciNumber.html) and [Wikipedia - Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_numbers)

## Remarks

**This is to show off the Common Lisp style REPL to users who don't know Lisp:**

- The Lisp code is deliberately simple and uses a naive, straightforward *slow* implementation of the fibonacci sequence and golden ratio

To speed up the calculation of the golden ratio you should at least save the Fibonacci sequence to a list, so you don't compute each Fibonacci number twice in the function `golden-ratio` in [./src/main.lisp](./src/main.lisp):

```lisp
(defun golden-ratio (number)
  "Calculate the golden ratio to the given number `number`.
Return the number which forms a golden ratio with the given number `number`."
  (* number (/ (fibonacci 32) (fibonacci 31))))
```

The function calls `(fibonacci 32)` and `(fibonacci 31)` should return elements of a list of Fibonacci numbers to avoid unnecessary computations.

## License

The source code [Sources at GitHub](https://github.com/Release-Candidate/Lisbonacci) is licensed under the GPL version 3.0 and newer, see file [LICENSE](LICENSE)
