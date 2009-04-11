ad_page_contract {

    Sets up the java applet with the album id to use when uploading


    @author Hamilton Chua (ham@solutiongrove.com)

} {
    album_id:integer,notnull
    package_id:integer,notnull
}

set user_id [ad_conn user_id]

ad_return_template
