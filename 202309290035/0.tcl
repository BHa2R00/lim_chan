set current_image_x0 0
set current_image_y0 10
set current_image_rotate 0
set current_image_index_a 2
set current_image_index_b 2
set current_image_index_c 2
proc load_image {} {
	global pic_path 
	global current_image_x0 current_image_y0 current_image_rotate
	global current_image_index_a current_image_index_b current_image_index_c
	.canvas delete "image"
	set current_image_0 [format "%s/0.png" $pic_path]
	image create photo bmp_image_0 -file $current_image_0 
	.canvas create image \
		$current_image_x0 $current_image_y0 \
		-anchor nw -image bmp_image_0 -tags "image"
	if {$current_image_index_a != 0} {
		set current_image_a [format "%s/A%d.png" $pic_path $current_image_index_a]
		image create photo bmp_image_a -file $current_image_a 
		.canvas create image \
			$current_image_x0 $current_image_y0 \
			-anchor nw -image bmp_image_a -tags "image"
	}
	if {$current_image_index_b != 0} {
		set current_image_b [format "%s/B%d.png" $pic_path $current_image_index_b]
		image create photo bmp_image_b -file $current_image_b 
		.canvas create image \
			$current_image_x0 $current_image_y0 \
			-anchor nw -image bmp_image_b -tags "image"
	}
	if {$current_image_index_c != 0} {
		set current_image_c [format "%s/C%d.png" $pic_path $current_image_index_c]
		image create photo bmp_image_c -file $current_image_c 
		.canvas create image \
			$current_image_x0 $current_image_y0 \
			-anchor nw -image bmp_image_c -tags "image"
	}
}
proc handle_key_press {key} {
	global current_image_x0 current_image_y0 current_image_rotate
	global current_image_index_a current_image_index_b current_image_index_c
	set tmp_a current_image_index_a
	if {$key eq "h"} {
		puts "h -- help"
		puts "q -- quit"
		puts "u -- mouse up"
		puts "j -- mouse down"
		puts "i -- eyes up"
		puts "k -- eyes down"
		puts "o -- eyebrown up"
		puts "l -- eyebrown down"
		puts "m -- speak"
		puts "b -- toggle"
	} elseif {$key eq "q"} {
		exit
	} elseif {$key eq "u"} {
		set current_image_index_a [expr {$current_image_index_a + 1}]
		if {$current_image_index_a > 6} {
			set current_image_index_a 6
		}
	} elseif {$key eq "j"} {
		set current_image_index_a [expr {$current_image_index_a - 1}]
		if {$current_image_index_a < 0} {
			set current_image_index_a 0
		}
	} elseif {$key eq "n"} {
		if {$current_image_index_a != 6} {
			set current_image_index_a 6
		} else {
			if {$current_image_index_c == 1} {
				if {$current_image_index_b == 1} {
					set current_image_index_a 1
				} else {
					set current_image_index_a 2
				}
			} elseif {$current_image_index_c == 2} {
				set current_image_index_a 4
			} elseif {$current_image_index_c == 3} {
				set current_image_index_a 3
			} else {
				set current_image_index_a 5
			}
		}
	} elseif {$key eq "i"} {
		set current_image_index_b [expr {$current_image_index_b + 1}]
		if {$current_image_index_b > 6} {
			set current_image_index_b 6
		}
	} elseif {$key eq "k"} {
		set current_image_index_b [expr {$current_image_index_b - 1}]
		if {$current_image_index_b < 0} {
			set current_image_index_b 0
		}
	} elseif {$key eq "m"} {
		if {$current_image_index_b != 3} {
			set current_image_index_b 3
		} else {
			set current_image_index_b 2
		}
	} elseif {$key eq "o"} {
		set current_image_index_c [expr {$current_image_index_c + 1}]
		if {$current_image_index_c > 3} {
			set current_image_index_c 3
		}
	} elseif {$key eq "l"} {
		set current_image_index_c [expr {$current_image_index_c - 1}]
		if {$current_image_index_c < 0} {
			set current_image_index_c 0
		}
	} elseif {$key eq "b"} {
		if {$current_image_y0 < 10} {
			set current_image_y0 [expr {$current_image_y0 + 10}]
		} else {
			set current_image_y0 [expr {$current_image_y0 - 10}]
		}
	}
	load_image
}
