.eqv MONITOR_SCREEN  0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00

.text
	li	$k0, MONITOR_SCREEN
	
	li	$t0, RED
	sw 	$t0, 108($k0)
	
	li	$t0, RED
	sw	$t0, 112($k0)
	
	li	$t0, RED
	sw	$t0, 140($k0)
	
	li	$t0, RED
	sw	$t0, 144($k0)
	
#	li	$t0, YELLOW
#	sw	$t0, 32($k0)