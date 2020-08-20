///c_input

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

shift = keyboard_check(vk_shift);
jump = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(ord("Z"));
jumprel = keyboard_check_released(ord("S")) + keyboard_check_released(ord("Z"));
attack = keyboard_check_pressed(ord("A")) + keyboard_check_pressed(ord("X"));

//subpixels and grovtripping is why shinji is allergic to the left side of walls
