;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 34|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; Extracts the first character from a non-empty string str.
; given: "Hello", expect: "H"
; given: "World", expect: "W"
(define (string-first str)
  (string-ith str 0))
