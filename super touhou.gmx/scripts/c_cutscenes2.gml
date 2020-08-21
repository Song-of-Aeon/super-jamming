switch goingdoing {
    case 0:
        IMMORTALIZE.state = c_lock;
        o_view.target = o_camerahook;
        
    case 1:
        if !instance_exists(o_textbox) {
            with instance_create(view_xview+320, view_yview+280, o_textbox) {
                txt_drink1();
            }
        }
        
        break;
    case 2:
        instance_destroy();
        IMMORTALIZE.state = c_drinking;
        break;
}
