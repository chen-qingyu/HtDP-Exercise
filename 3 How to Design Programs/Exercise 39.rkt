;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 39|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

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
