/// c_hitbox_exists(name_of_file)
if(file_exists(program_directory + argument[0] + ".json")){
    return true;
}
return false;
