#lang racket

;=============================================================
; This part is a LLL-code that is generated for the first data
; i.e. for Church numeral 3
;=============================================================
; function CGOTO_1 is a part of the common CGOTO function that
; corresponds to data 1
(define (CGOTO_1 have t p i)
  (if (equal? have 'P)
      (if (equal? i 1) (Q (cons (list 'Q p) t)) (error 'GOTO:ERROR))
      (if (equal? have 'R)
          (if (equal? i 1) (S (cons (list 'S p) t)) (error 'GOTO:ERROR))
          (if (equal? have 'T)
              (if (equal? i 1) (U (cons (list 'U p) t)) (error 'GOTO:ERROR))
              'ERROR))))
; a set of functions for each node in data 1
(define (O t) (P (cons (list 'P (FQ 'O t)) t)))
(define (P t) (CGOTO t 1))
(define (Q t) (R (cons (list 'R (FQ 'O t)) t)))
(define (R t) (CGOTO t 1))
(define (S t) (T (cons (list 'T (FQ 'O t)) t)))
(define (T t) (CGOTO t 1))
(define (U t) (V (cons (list 'V (FQ 'O t)) t)))
(define (V t) (CGOTO t 2))

;==============================================================
; This part is a LLL-code that is generated for the second data
; i.e. for Church numeral 2
;==============================================================
; function CGOTO_2 is a part of the common CGOTO function that
; corresponds to data 2
(define (CGOTO_2 have t p i)
  (if (equal? have 'X)
      (if (equal? i 1) (Y (cons (list 'Y p) t)) (error 'GOTO:ERROR))
      (if (equal? have 'Z) (if (equal? i 1) (AA (cons (list 'AA p) t)) (error 'GOTO:ERROR)) 'ERROR)))
; a set of functions for each node in data 2
(define (W t) (X (cons (list 'X (FQ 'W t)) t)))
(define (X t) (CGOTO t 1))
(define (Y t) (Z (cons (list 'Z (FQ 'W t)) t)))
(define (Z t) (CGOTO t 1))
(define (AA t) (AB (cons (list 'AB (FQ 'W t)) t)))
(define (AB t) (CGOTO t 2))

;===============================================================
; This part is a LLL-code that is generated for the program part
; i.e. for function multiply
;===============================================================
; function CGOTO_0 is a part of the common CGOTO function that
; corresponds to program part
(define (CGOTO_0 have t p i)
  (if (equal? have 'B)
      (if (equal? i 4)
          (AG (cons (list 'AG p) t))
          (if (equal? i 3)
              (AC (cons (list 'AC p) t))
              (if (equal? i 2)
                  (W (cons (list 'W p) t))
                  (if (equal? i 1) (O (cons (list 'O p) t)) (error 'GOTO:ERROR)))))
      (if (equal? have 'D)
          (if (equal? i 2)
              (M (cons (list 'M p) t))
              (if (equal? i 1) (E (cons (list 'E p) t)) (error 'GOTO:ERROR)))
          (if (equal? have 'F)
              (if (equal? i 2)
                  (K (cons (list 'K p) t))
                  (if (equal? i 1) (G (cons (list 'G p) t)) (error 'GOTO:ERROR)))
              (if (equal? have 'H)
                  (if (equal? i 1) (I (cons (list 'I p) t)) (error 'GOTO:ERROR))
                  (if (equal? have 'AD)
                      (if (equal? i 1) (AE (cons (list 'AE p) t)) (error 'GOTO:ERROR))
                      'ERROR))))))
; a set of functions for each node in program
(define (A t) (B (cons (list 'B 0) t)))
(define (B t) (C (cons (list 'C (length t)) t)))
(define (C t) (D (cons (list 'D (FQ 'C t)) t)))
(define (D t) (CGOTO t 1))
(define (E t) (F (cons (list 'F (FQ 'C t)) t)))
(define (F t) (CGOTO t 2))
(define (G t) (H (cons (list 'H (FQ 'C t)) t)))
(define (H t) (CGOTO t 3))
(define (I t) (J (cons (list 'J (FQ 'G t)) t)))
(define (J t) (CGOTO t 1))
(define (K t) (L (cons (list 'L (FQ 'E t)) t)))
(define (L t) (CGOTO t 1))
(define (M t) (N (cons (list 'N (FQ 'C t)) t)))
(define (N t) (CGOTO t 4))
(define (AC t) (AD (cons (list 'AD 1) t)))
(define (AD t) (AE (cons (list 'AE (length t)) t)))
(define (AE t) (AF (cons (list 'AF (FQ 'AC t)) t)))
(define (AF t) (CGOTO t 1))
(define (AG t) (AH (cons (list 'AH 1) t)))
(define (AH t) (cons 'END-OF-TRAVERSAL t))

;===============================================================================================
; auxiliary functions that are common for program and data
; all functions except the function CGOTO_common are independent of the program and data at all.
; Function CGOTO_common depends only on the number of data in the program.
;===============================================================================================
(define (CGOTO t i) (let ((q (- (cadar t) 1))) (CGOTO_common (caar (pfx q t)) t q i)))
(define (CGOTO_common have t p i)
  (let ((res (CGOTO_2 have t p i)))
    (if (not (equal? res 'ERROR))
        res
        (let ((res (CGOTO_1 have t p i)))
          (if (not (equal? res 'ERROR))
              res
              (let ((res (CGOTO_0 have t p i))) (if (not (equal? res 'ERROR)) res 'ERROR)))))))
(define (FQ have t)
  (letrec ((f
            (lambda (t0)
              (if (equal? have (caar t0))
                  (length t0)
                  (let ((bp (cadar t0))) (f (pfx (- bp 1) t)))))))
    (f t)))
(define (pfx n t) (reverse (take n (reverse t))))
(define (take n xs) (if (equal? n 0) '() (cons (car xs) (take (- n 1) (cdr xs)))))
(define (travout t) (if (null? t) '() (begin (travout (cdr t)) (newline) (write (car t)))))

;========================
; Run traversal generator
;========================
(reverse (A '((A 0))))