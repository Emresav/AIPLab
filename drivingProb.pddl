(define (problem driver)
 (:domain driving)
 
 (:objects bigRed - vehicle 
           Houston Austin elpaso - location)
 
 (:init (road Houston Austin) (at bigRed Houston) (= (distance Houston Austin) 165)
        (= (speed bigRed) 40) (= (distance Austin ElPaso) 574) (road Austin ElPaso)
		(trucking bigRed) (= (fastSpeed bigred) 20) )
		
 (:goal (and (at bigRed ElPaso) (usedmotorway bigred houston austin) (usedmotorway bigred austin elpaso))))