ad_page_contract {

    Upload photos dragged into the java applet

} { }

set q [ns_parsequery [ns_conn query]]
set album_id [ns_set get $q album_id]
set package_id [ns_set get $q package_id]

# ns_log notice "HANDLING UPLOAD via Java Applet : $album_id : $package_id"

# Set the form conn

set formvar [ns_conn form]

set variable_count [ns_set size $formvar]
set total_file_count [expr {$variable_count / 3}]

for {set i 0} {$i < $variable_count} {incr i} {
    set aname [ns_set key $formvar $i]
    append var_string "$aname "
    # ns_log notice "HAM : $aname *************"
}

# ns_log notice "$variable_count : $total_file_count"

# upload the image file
for {set i 0} {$i < $total_file_count} {incr i} {

    set file_variable_name "userfile\[$i\]"
    set tmpfile_name "${file_variable_name}.tmpfile"

    set filename [ns_set value $formvar [ns_set find $formvar $file_variable_name]]

    if {$filename==""} {
        continue
    }

    # Get rid of UNIX style directory names.

    set filename [file tail [DoubleApos $filename]]
    set filetype [string tolower [file extension ${filename}]]

    # Get rid of DOS style directory names.

    regsub {.*\\([^\\]+)$} $filename {\1} filename

    # Get the file uploaded to the server

    set input_file_location [ns_set value $formvar [ns_set find $formvar $tmpfile_name]]

    # create a new photo

    # ns_log notice " ********** $input_file_location ***************"

    set new_photo_ids [pa_load_images \
                        -remove 1 \
                        -client_name $filename \
                        -description "" \
                        -story "" \
                        -caption "" \
                        -package_id $package_id \
                        ${input_file_location} $album_id 568]

    # ns_log notice "uploading : $new_photo_ids *************"

}

pa_flush_photo_in_album_cache $album_id

ns_return 200 "text/html" "<html><body><br><br><center><img src='/resources/ajaxhelper/images/indicator_big.gif'><br><br><font face='arial,verdana,sans serif'>One moment please ....</font></center></body></html>"