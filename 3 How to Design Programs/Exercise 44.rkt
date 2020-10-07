;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 44|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

(define BACKGROUND (empty-scene 300 50))

(define WHEEL-RADIUS 5)

(define WHEEL-DISTANCE
  (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHEEL-DISTANCE (* 2 WHEEL-RADIUS) "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR
  (place-image
   BOTH-WHEELS
   (/ (image-width BOTH-WHEELS) 2)
   (* WHEEL-RADIUS 4)
   (rectangle (image-width BOTH-WHEELS) (* WHEEL-RADIUS 5) "solid" "gray")
   ))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))


; AnimationState -> AnimationState
; moves the car according to a sine wave for every clock tick
(define (tock as)
  (+ as 1))

; AnimationState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render as)
  (place-image
   CAR
   as
   (+ (* (sin (/ as 10)) 10) (/ (image-height BACKGROUND) 2))
   (place-image tree 10 (/ (image-height BACKGROUND) 2) BACKGROUND)
   ))

; AnimationState Number Number String -> AnimationState
; places the car at x-mouse
; if the given me is "button-down" 
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; AnimationState -> Boolean
; stop the world when as equals the width of BACKGROUND
(define (end? as)
  (= as (image-width BACKGROUND)))

; AnimationState -> AnimationState
; launches the program from some initial state 
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-mouse hyper]
    [stop-when end?]))
