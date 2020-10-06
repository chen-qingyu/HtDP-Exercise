;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 29|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PRICE 5.0)
(define PEOPLE 120)
(define CHANGE_PRICE 0.1)
(define CHANGE_PEOPLE 15)
(define FIXED_COST 0)
(define VARIABLE_COST 1.5)


(define (attendees ticket-price)
  (- PEOPLE (* (- ticket-price PRICE) (/ CHANGE_PEOPLE CHANGE_PRICE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* VARIABLE_COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


(profit 3)
(profit 4)
(profit 5)
; Which price maximizes the profit of the movie theater? $4.
