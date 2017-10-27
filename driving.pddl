(define (domain driving)
(:requirements :typing :durative-actions :continuous-effects :fluents :duration-inequalities)
(:types vehicle location)

(:predicates (at ?v - vehicle ?l - location) (road ?a ?b - location) (driving ?v - vehicle ?a ?b - location)
		(trucking ?v - vehicle) (speeding ?v - vehicle) (usedMotorway ?v - vehicle ?a ?b - location))

(:functions (distanceTravelled ?v - vehicle) (distance ?a ?b - location) (speed ?v - vehicle)
		(fastSpeed ?v - vehicle) )


(:durative-action drive
 :parameters (?v - vehicle ?a ?b - location)
 :duration (<= ?duration 10000)
 :condition (and (at start (at ?v?a)) (at start (road ?a ?b)) (over all (driving ?v ?a ?b)))
 :effect (and (at start (assign (distanceTravelled ?v) 0))
              (increase (distanceTravelled ?v) (* #t (speed ?v)))
			  (at start (driving ?v ?a ?b)) (at start (not (at ?v ?a)))))
			  
(:durative-action useMotorway
 :parameters (?v - vehicle ?a ?b - location)
 :duration (<= ?duration 10000)
 :condition (and (over all  (driving ?v ?a ?b)) (at start (trucking ?v)))
 :effect (and (at start (not (trucking ?v))) (at end (trucking ?v))
			(at start (speeding ?v)) (at end (not (speeding ?v))) (at end (usedMotorway ?v ?a ?b))
			(increase (distanceTravelled ?v) (* #t (fastSpeed ?v)))))

(:action arrive
 :parameters (?v - vehicle ?a ?b - location)
 :precondition (and (>= (distanceTravelled ?v) (distance ?a ?b)) (driving ?v ?a ?b))
 :effect (and (not (driving ?v ?a ?b)) (at ?v ?b)))
 

)