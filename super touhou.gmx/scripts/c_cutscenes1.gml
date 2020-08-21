switch goingdoing {
    case 0:
        if !instance_exists(o_textbox) {
            with instance_create(view_xview+320, view_yview+280, o_textbox) {
                txt_test();
            }
        }
        IMMORTALIZE.state = c_lock;
        break;
    case 1:
        instance_destroy();
        IMMORTALIZE.state = c_standard;
        break;
}
