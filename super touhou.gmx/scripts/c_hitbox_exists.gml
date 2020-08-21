/// c_hitbox_exists(name_of_file)
if(file_exists("hitboxes\" + argument[0] + ".json")){
    return true;
}
if(file_exists(working_directory + argument[0] + ".json")){
    return true;
}
return false;
