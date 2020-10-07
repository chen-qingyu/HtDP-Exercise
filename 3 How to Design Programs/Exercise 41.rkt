;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 41|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

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

(define Y-CAR (/ (image-height BACKGROUND) 2))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))


; WorldState -> WorldState
; moves the car by 1 pixels for every clock tick
(define (tock x)
  (+ x 1))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render x)
  (place-image
   CAR
   x
   Y-CAR
   (place-image tree 10 (/ (image-height BACKGROUND) 2) BACKGROUND)
   ))

; WorldState -> Boolean
; stop the world when x equals the width of BACKGROUND
(define (end? x)
  (= x (image-width BACKGROUND)))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when end?]))

(main 0)
