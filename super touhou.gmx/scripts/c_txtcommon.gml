///c_txtcommon();
//because i keep changing the parameters that o_textbox takes

choice[0] = "";


message_current = 0;
message_end = array_length_1d(message) - 1; //it goes by itself now
message_end2[0] = 99 //this one doesn't, though. only needed if there's a choice
message_draw = ""; //what its goin
increase = 0.5; //the base speed at which new characters are added
characters = 0; //how many characters have already been drawn
hold = 1; //rate of message increase when z is held

message_length = string_length(message[message_current]); //get the number of characters in the first message

