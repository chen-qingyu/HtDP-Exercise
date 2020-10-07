;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 37|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; Produces a string like the given one str with the first character removed.
; given: "Hello", expect: "ello"
; given: "World", expect: "orld"
(define (string-rest str)
  (substring str 1))
