#lang racket
(define (CGOTO t i) (let ((q (- (cadar t) 1))) (CGOTO1 (caar (pfx q t)) t q i)))
  (define (CGOTO1 have t p i)
    (if (equal? have 'B)
      (if (equal? i 2)
        (U (cons (list 'U p) t))
        (if (equal? i 1) (O (cons (list 'O p) t)) (error 'GOTO:ERROR)))
      (if (equal? have 'D)
        (if (equal? i 2)
          (K (cons (list 'K p) t))
          (if (equal? i 1) (E (cons (list 'E p) t)) (error 'GOTO:ERROR)))
        (if (equal? have 'F)
          (if (equal? i 2)
            (I (cons (list 'I p) t))
            (if (equal? i 1) (G (cons (list 'G p) t)) (error 'GOTO:ERROR)))
          (if (equal? have 'L)
            (if (equal? i 1) (M (cons (list 'M p) t)) (error 'GOTO:ERROR))
            (if (equal? have 'P)
              (if (equal? i 1) (Q (cons (list 'Q p) t)) (error 'GOTO:ERROR))
              (if (equal? have 'R)
                (if (equal? i 1) (S (cons (list 'S p) t)) (error 'GOTO:ERROR))
                (if (equal? have 'V)
                  (if (equal? i 1) (W (cons (list 'W p) t)) (error 'GOTO:ERROR))
                  (error 'ERROR)))))))))
  (define (FQ have t)
    (letrec ((f
              (lambda (t0)
                (if (equal? have (caar t0))
                  (length t0)
                  (let ((bp (cadar t0))) (f (pfx (- bp 1) t)))))))
      (f t)))
  (define (pfx n t) (reverse (take n (reverse t))))
  (define (take n xs) (if (equal? n 0) '() (cons (car xs) (take (- n 1) (cdr xs)))))
  (define (travout t)
    (if (null? t) '() (begin (travout (cdr t)) (newline) (write (car t)))))
  (define (A t) (B (cons (list 'B 0) t)))
  (define (B t) (C (cons (list 'C (length t)) t)))
  (define (C t) (D (cons (list 'D (FQ 'C t)) t)))
  (define (D t) (CGOTO t 1))
  (define (E t) (F (cons (list 'F (FQ 'C t)) t)))
  (define (F t) (CGOTO t 1))
  (define (G t) (H (cons (list 'H (FQ 'E t)) t)))
  (define (H t) (CGOTO t 1))
  (define (I t) (J (cons (list 'J 1) t)))
  (define (J t) (cons 'END-OF-TRAVERSAL t))
  (define (K t) (L (cons (list 'L (FQ 'C t)) t)))
  (define (L t) (CGOTO t 2))
  (define (M t) (N (cons (list 'N 1) t)))
  (define (N t) (cons 'END-OF-TRAVERSAL t))
  (define (O t) (P (cons (list 'P (FQ 'O t)) t)))
  (define (P t) (CGOTO t 1))
  (define (Q t) (R (cons (list 'R 1) t)))
  (define (R t) (S (cons (list 'S (length t)) t)))
  (define (S t) (T (cons (list 'T (FQ 'O t)) t)))
  (define (T t) (CGOTO t 2))
  (define (U t) (V (cons (list 'V 1) t)))
  (define (V t) (W (cons (list 'W (length t)) t)))
  (define (W t) (X (cons (list 'X (FQ 'U t)) t)))
  (define (X t) (CGOTO t 1))
  (reverse (A '((A 0))))