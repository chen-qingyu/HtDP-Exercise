;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 51|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume 


(define BACKGROUND-HEIGHT 50)
(define BACKGROUND-WIDTH 50)
(define BACKGROUND (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT))


; TrafficLight -> Image
; places the traffic light into the BACKGROUND scene,
; according to the given world state 
(define (traffic-light-next s)
  (place-image
   (circle
   (/ BACKGROUND-HEIGHT 2)
   "solid"
   s)
   (/ BACKGROUND-HEIGHT 2)
   (/ BACKGROUND-WIDTH 2)
   BACKGROUND
  ))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(define (tock s)
  (cond
     [(string=? "red" s) "green"]
     [(string=? "green" s) "yellow"]
     [(string=? "yellow" s) "red"]))

; TrafficLight -> TrafficLight
; launches the program from the initial state
(define (traffic-light s)
  (big-bang s
    [on-tick tock]
    [to-draw traffic-light-next]))
