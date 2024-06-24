mul ; Web Server Math Routine;2014-11-28  5:58 PM
 ;
m(result,arguments) ; multiplication
 ; result is passed by reference from VPRJRSP
 ; arguments is also passed by reference
 ;
 ; result is where you return the result
 ; result("mime") is where you specify the mime type for the client
 ; if you don't specify a mime, application/json; charset=utf-8 is returned.
 ;
 ; Get our arguments
 new m1 set m1=$get(arguments("multiplier"))
 new m2 set m2=$get(arguments("multiplicand"))
 ;
 ; If for some reason our arguments are empty, don't go any further
 if (m1="")!(m2="")  do SETERROR^VPRJRUT(400,"Input parameters are not correct") QUIT
 ;
 set result=m1*m2
 ;
 set result("mime")="text/plain; charset=utf-8"
 ;
 quit
