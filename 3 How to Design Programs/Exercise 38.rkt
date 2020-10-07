;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 38|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; Produces a string like the given one str with the last character removed.
; given: "Hello", expect: "Hell"
; given: "World", expect: "Worl"
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))
