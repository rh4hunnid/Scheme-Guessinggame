(#%require (only racket/base random))

(define players '())



(define (guessing-game)
  (display "HIIII\n")
  (display "Would you like to play? enter 'q' to quit or anything to play): ")
  (define play "q")
  (let ((play (read)))
    (if (equal? play "q")
        (display "BYEE\n")
        (begin
          (play-game)
          ))))

(define (play-game)
  (define answer (random 10))
  (define name (get-player-name))

  (let loop ((attempts 1))
    (display "Guess a num between 1 and 10: ")
    (let ((guess (read)))
      (cond
       ((= guess answer)
        (display "Congratulations, ")
        (display name)
        (display "! You guessed the correct number in ")
        (display attempts)
        (display " attempts.\n")
        (add-to-leaderboard name attempts)
        (display-leaderboard)
      (guessing-game) )
       ((< guess answer)
        (display "Too low. Try again!\n")
        (loop (+ attempts 1)))
       ((> guess answer)
        (display "Too high. Try again!\n")
        (loop (+ attempts 1)))
       (else
        (display "Please enter a number between 1 and 10.\n")
        (loop attempts))))))

(define (get-player-name)
  (display "Enter your name: ")
  (read))

(define (add-to-leaderboard name attempts)
  (set! players (cons (list name attempts) players)))

(define (display-leaderboard)
  (display "Leaderboard:\n")
  (for-each
   (lambda (player)
     (display (car player))
     (display ": ")
     (display (cadr player))
     (display " attempts\n"))
   players)
  (newline))

(guessing-game)

