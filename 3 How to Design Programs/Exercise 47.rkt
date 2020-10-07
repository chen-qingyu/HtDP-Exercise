;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 47|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

(define BACKGROUND-HEIGHT 100)
(define BACKGROUND-WIDTH 20)
(define BACKGROUND (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT))


; AnimationState -> AnimationState
; with each clock tick, happiness decreases by 0.1
(define (tock as)
  (cond
    [(<= as 0) 0]
    [else (- as 0.1)]))

; AnimationState -> Image
; places the bar into the BACKGROUND scene,
; according to the given world state 
(define (render as)
  (place-image/align
   (rectangle BACKGROUND-WIDTH (if (< as 0) 0 as) "solid" "red")
   (/ BACKGROUND-WIDTH 2)
   BACKGROUND-HEIGHT
   "center"
   "bottom"
   BACKGROUND
   ))

; AnimationState String -> AnimationState
(define (key-event-handler as ks)
  (cond
    [(key=? ks "up") (* as (+ 1 1/3))]
    [(key=? ks "down") (* as (- 1 1/5))]
    [else as]))

; AnimationState -> AnimationState
; launches the program from the happiness (0 ~ BACKGROUND-HEIGHT)
(define (gauge-prog as)
  (big-bang as
    [on-tick tock]
    [to-draw render]
    [on-key key-event-handler]))
