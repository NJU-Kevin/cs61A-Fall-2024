;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

; ===== Utility Functions =====
(define (tree length level)
  (if (> level 0)
      (begin
        ; Set branch/leaf color
        (if (> level 1)
            (color "brown")
            (color "green"))
        (pendown)
        (forward length)
        (left 20)
        ; Left subtree
        (tree (* length 0.7) (- level 1))
        (right 40)
        ; Right subtree
        (tree (* length 0.7) (- level 1))
        (left 20)
        (penup)
        (back length))))

(define (draw)
  ; Configure initial turtle state
  (speed 0)                ; Fastest speed
  (penup)                  ; Lift pen
  (setposition 0 -200)     ; Start at bottom center
  (setheading 90)          ; Face upward
  (tree 100 5)             ; Draw tree (size=100, depth=5)
  (exitonclick))           ; Finish on click

; Start drawing
(draw)