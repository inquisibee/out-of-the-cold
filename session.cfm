<!--- Kill extra output. --->
<cfsilent>

    <!---
        Param the URL id. This ID will contain a comma
        delimited list of the CFID / CFTOKEN values.
    --->
    <cfparam
        name="URL.id"
        type="string"
        default=""
        />


    <!---
        Check to see if the the ID list is less than 5.
        Technically, 2 values is all we really need to
        test the cookies, but I like to give it a few
        extra to see if something really weird is happening.
    --->
    <cfif (ListLen( URL.id ) LT 5)>


        <!---
            Append the currrent session information
            to the URL id list.
        --->
        <cfset URL.id = ListAppend(
            URL.id,
            "#SESSION.CFID#-#SESSION.CFTOKEN#"
            ) />

        <!---
            Relocate back to this page with the updated
            ID list.
        --->
        <cflocation
            url="#CGI.script_name#?id=#URL.id#"
            addtoken="false"
            />

    </cfif>


    <!---
        ASSERT: If we have gotten this far then we know
        that this page has been called 5 times and that
        we now have an ID list with 5 items containing
        this user's session information.
    --->


    <!---
        Break the ID list into an array for faster access
        and easier notation.
    --->
    <cfset arrID = ListToArray( URL.id ) />

</cfsilent>


<cfoutput>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>
    <head>
        <title>ColdFusion Session Cookie Test</title>

        <style type="text/css">
            p.confirm {
                background-color: ##F9FBFF ;
                border: 2px solid ##6699FF ;
                font-size: 28px ;
                padding: 20px 0px 20px 0px ;
                text-align: center ;
                }
        </style>
    </head>
    <body>

        <h2>
            ColdFusion Session Cookie Test
        </h2>

        <p>
            In order for you to be able to log into
            this site, you must have Cookies enabled in
            your browser. If cookies are enabled, the
            following 5 values will be identical:
        </p>


        <ol>
            <!--- Loop over values and output them. --->
            <cfloop
                index="intI"
                from="1"
                to="5"
                step="1">

                <li>
                    #arrID[ intI ]#
                </li>

            </cfloop>
        </ol>


        <p class="confirm">

            <strong>Cookies Accepted:</strong>


            <!---
                We will know that the session cookie
                information held from request to request
                if all the values in the list are identical.
                Check each value against the next.
            --->
            #YesNoFormat(
                (arrID[ 1 ] EQ arrID[ 2 ]) AND
                (arrID[ 2 ] EQ arrID[ 3 ]) AND
                (arrID[ 3 ] EQ arrID[ 4 ]) AND
                (arrID[ 4 ] EQ arrID[ 5 ])
                )#
        </p>

        <p>
            If your cookies are not being accepted, please
            copy and paste the contents of this page into an
            email and send it to nikki@girls-like-girls.com.
        </p>


        <!---
            Output some browser related information that
            might help the tech team debug just what is
            going on.
        --->

        <h3>
            Browser Information
        </h3>

        <p>
            <strong>User Agent:</strong><br />

            #CGI.http_user_agent#
        </p>

        <p>
            <strong>Request Cookies:</strong><br />

            <!---
                When outputting the browser's cookie, just
                try to replace out references to CFIDE and
                ADMINISTRATOR (if they are there) so people
                don't get any funny ideas.
            --->
            #ToString( CGI.http_cookie ).ReplaceAll(
                "(?i)cfide|administrator|cfadmin",
                "temp"
                )#
        </p>

    </body>
    </html>

</cfoutput>
