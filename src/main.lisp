;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright (C) 2021 Roland Csaszar
;;;
;;; Project: Lisbonacci
;;; File:    main.lisp
;;; Date:    13.11.2021
;;; ===========================================================================
(defpackage lisbonacci
  (:use :cl))

(in-package :lisbonacci)

(declaim (optimize (speed 0) (space 0) (debug 3)))

;;==============================================================================
;; ** main-loop
(defun main-loop ()
  "The program's main loop. Ask for a number and calculate the golden ratio to that number."
  (loop
    (let
        ((number (user-input-int "Golden ratio calculator. Calculates the golden ratio to the given number.
Input number")))
      (format *query-io* "Golden ratio ~a : ~a ~%" number (golden-ratio number))
      (if (yes-or-no-p "Exit program?") (return)))))

;; ** golden-ratio
(defun golden-ratio (number)
  "Calculate the golden ratio to the given number `number`.
Return the number which forms a golden ratio with the given number `number`."
  (* number (/ (fibonacci 32) (fibonacci 31))))

;; ** fibonacci
(defun fibonacci (n)
  "Calculate the `n`th fibonacci number.
Return the `n`th fibonacci number"
  (if (eql n 0)
      0
      (if (eql n 1)
          1
          (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

;; ** user-input-int
(defun user-input-int (prompt)
  "Prompt the user for input using `prompt` as string to display.
Return the user input converted to an integer or 0 if the conversion failed."
  (or
   (parse-integer (user-input prompt) :junk-allowed t)
   0))

;; ** user-input
(defun user-input (prompt)
  "Prompt the user for input using `prompt` as string to display.
Return the user input."
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))
