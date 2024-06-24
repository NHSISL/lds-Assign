UPRNUI ; ; 9/10/20 10:53am
 ;set ^%W(17.6001,"B","GET","ui/login","LOGIN^UPRNUI",0)=""
 ;set ^%W(17.6001,"B","POST","check/login","CHECK^UPRNUI",8)=""
 ;set ^%W(17.6001,"B","POST","ui/calculate","CALC^UPRNUI",8)=""
 set ^%W(17.6001,"B","POST","api/fileupload","UPLOAD^UPRNUI",123)=""
 set ^%W(17.6001,123,0)="POST"
 set ^%W(17.6001,123,1)="api/fileupload"
 set ^%W(17.6001,123,2)="UPLOAD^UPRNUI"
 set ^%W(17.6001,"B","GET","api/fileresponse","RETFILE^UPRNUI",45)=""
 S ^%W(17.6001,45,0)="GET"
 S ^%W(17.6001,45,1)="api/fileresponse"
 S ^%W(17.6001,45,2)="RETFILE^UPRNUI"
 
 set ^%W(17.6001,"B","GET","api/filedownload","DOWNLOAD^UPRNUI",124)=""
 set ^%W(17.6001,124,0)="GET"
 set ^%W(17.6001,124,1)="api/filedownload"
 set ^%W(17.6001,124,2)="DOWNLOAD^UPRNUI"
 
X set ^%W(17.6001,130,0)="GET"
 set ^%W(17.6001,130,1)="api/sessionid"
 set ^%W(17.6001,130,2)="SESSION^UPRNUI"
 set ^%W(17.6001,"B","GET","api/sessionid","SESSION^UPRNUI",130)=""
 quit
 
DOWNLOAD(result,arguments) 
 K ^TMP($J)
 set file=$get(arguments("filename"))
 set user=$get(arguments("userid"))
 I file'["/opt/" S file="/opt/files/"_file
 s c=1,^TMP($J,c)="[",c=c+1,l="" f  s l=$order(^NGX(user,file,l)) q:l=""  S ^TMP($J,c)=^(l)_$C(13,10),c=c+1
 S z=$o(^TMP($J,""),-1)
 i z'="" s json=^TMP($J,z) i $e(json,$l(json)-2)="," s ^TMP($J,z)=$e(json,1,$l(json)-3)
 s ^TMP($J,c)="]"
 S result("mime")="text/plain, */*"
 S result=$NA(^TMP($J))
 QUIT

IP() ;
 S IP=$GET(HTTPREQ("header","x-forwarded-for"))
 S OK=1
 I '$D(^IPCHK(IP)) S OK=0
 QUIT OK
 
LOGIN(result,arguments) ;
 kill ^TMP($J)
 I '$$IP() D H("<B>sorry</B>") G XBYE
 d H("<html>")
 d H("<form action="""_$GET(^ICONFIG("URL"))_"/check/login"" method=""post"">")
 d H("<table border=1>")
 d H("<td>UserName:</td><td><input type=""text"" name=""username"" /></td><tr>")
 d H("<td>Password:</td><td><input type=""password"" name=""pwd"" /></td><tr>")
 d H("<td><input type=""submit""></td><td></tr><tr>")
 d H("</table>")
 d H("</form>")
 d H("</html>")
 
XBYE set result("mime")="text/html"
 set result=$na(^TMP($J))
 quit
 
GETFILENAM(disposition) 
 ;
 quit
 
SESSION(result,arguments) 
 ;set ^TMP($J,1)=$$UUID^AUTH()
 ;S J="{""name"":""John"", ""age"":31, ""city"":""New York""}"
 S J="{""session"":"""_$$UUID^AUTH()_"""}"
 set ^TMP($J,1)=J
 set result("mime")="text/plain, */*"
 set result=$na(^TMP($J))
 quit
 
RETFILE(result,arguments) 
 K ^TMP($J)
 ;k ^PS25
 S ^PS23="IN RETFILE"
 set file=$get(arguments("filename"))
 s file="/opt/files/"_file
 S ^PS24=file
 ;m ^TMP($J)=^FILE(file)
 S c="",line=1
 LOCK ^UPRNUI("process",file):1
 s processing=0
 i '$t s processing=1
 LOCK -^UPRNUI("process",file)
 i processing s ^TMP($J,line)="*** still processing ***"_$c(13,10),line=line+1
 f  s c=$o(^FILE(file,c)) q:c=""  D
 .s ^TMP($J,line)=^(c)_$c(13,10)
 .;S ^PS25($J,line)=^(c)_$c(13,10)
 .s line=line+1
 .QUIT
 i processing s ^TMP($J,line)="*** still processing ***"
 set result("mime")="text/plain, */*"
 set result=$na(^TMP($J))
 QUIT
 
UPLOAD(arguments,body,result) 
 new file,line
 K ^TMP($J)
 ;M ^FILES=body
 
 S X=$O(body(""),-1)
 S ZZ=body(X)
 
 set result("mime")="text/html"
 
 set file=$piece(body(1),$c(10),2)
 set file=$piece(file,"""",4)
 
 lock ^UPRNUI("process",file):1
 i '$t s ^UPRNUI("process",file)="Already being processed "_$h quit
 lock -^UPRNUI("process",file)
 do 6^ZOS("/opt/files")
 set file="/opt/files/"_file
 ;
 if $data(body(1)) set body(1)=$p(body(1),$c(10),5,9999999999)
 
 set line=$order(body(""),-1)
 if line'="" set body(line)=$piece(body(line),"------WebKitFormBoundary",1)
 
 ;open file:newversion
 O file:(newversion:stream:nowrap:chset="M")
 set line=""
 for  set line=$order(body(line)) q:line=""  do
 .use file write body(line)
 .quit
 close file
 ;
 s ^TMP($J,1)="{""upload"": { ""status"": ""OK""}}"
 set result=$na(^TMP($J))
 
 S USER=$P($P(ZZ,"name=""userid"""_$C(13,10,13,10),2),$C(13,10))
 
 S I=$O(^ACTIVITY(USER,""),-1)+1
 S ^ACTIVITY(USER,I)=$H_"~"_file_" uploaded ok~"_file
 
 Job PROCESS(file,USER)
 quit 1

ETCODE ;
 ;;S HTTPLOG("DT")=+$H
 ;;S HTTPLOG("ID")=99999
 ;;D LOGERR^VPRJREQ
 S I=$O(^ACTIVITY(user,""),-1)+1
 S ^ACTIVITY(user,I)=$H_"~"_$ZSTATUS
 S $ETRAP=""
 QUIT
 
PROCESS(file,user) ;
 S $ETRAP="G ETCODE^UPRNUI"
 LOCK ^UPRNUI("process",file):1
 I '$T S ^UPRNUI("process",file)="Already being processed "_$h quit
 K ^FILE(file),^NGX(user,file)
 close file
 o file:(readonly):0
 S cnt=1
 f  u file r str q:$zeof  do
 .S ZID=$$TR^LIB($P(str,",",1),"""","")
 .I ZID=""!(ZID=$C(13)) QUIT
 .s adrec=$$TR^LIB($p(str,",",2,99),$C(13),"")
 .D GETUPRN^UPRNMGR(adrec)
 .s json=^temp($j,1)
 .K B,C
 .D DECODE^VPRJSON($name(json),$name(B),$name(C))
 .S UPRN=$GET(B("UPRN"))
 .S ADDFORMAT=$GET(B("Address_format"))
 .S ALG=$GET(B("Algorithm"))
 .S CLASS=$GET(B("Classification"))
 .S MATCHB=$GET(B("Match_pattern","Building"))
 .S MATCHF=$GET(B("Match_pattern","Flat"))
 .S MATCHN=$GET(B("Match_pattern","Number"))
 .S MATCHP=$GET(B("Match_pattern","Postcode"))
 .S MATCHS=$GET(B("Match_pattern","Street"))
 .S ABPN=$GET(B("ABPAddress","Number"))
 .S ABPP=$GET(B("ABPAddress","Postcode"))
 .S ABPS=$GET(B("ABPAddress","Street"))
 .S ABPT=$GET(B("ABPAddress","Town"))
 .S QUAL=$GET(B("Qualifier"))
 .S J=$$JSON(UPRN,ADDFORMAT,ALG,CLASS,MATCHB,MATCHF,MATCHN,MATCHP,MATCHS,ABPN,ABPP,ABPS,ABPT,QUAL,$$ESC^VPRJSON(adrec),ZID)
 .I '$D(^NGX(user,file,ZID)) set ^NGX(user,file,ZID)=J
 .I $D(^NGX(user,file,ZID)) DO
 ..S Z=$O(^NGX(user,file,ZID,""),-1)+1
 ..S ^NGX(user,file,ZID,Z)=J
 ..QUIT
 .quit
 
 ; remove extra comma
 S cnt=$o(^NGX(user,file,""),-1)
 I cnt'="" do
 .s rec=^NGX(user,file,cnt)
 .s rec=$e(rec,1,$l(rec)-1)
 .S ^NGX(user,file,cnt)=rec
 .quit
 
 close file
 LOCK -^UPRNUI("process",file)
 S I=$O(^ACTIVITY(user,""),-1)+1
 S ^ACTIVITY(user,I)=$H_"~"_file_" processed ok~"_file
 QUIT
 
JSON(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,ZID)
 S JS="{""ID"":"""_ZID_""","
 S JS=JS_"""UPRN"":"""_A_""","
 S JS=JS_"""add_format"":"""_B_""","
 S JS=JS_"""alg"":"""_C_""","
 S JS=JS_"""class"":"""_D_""","
 S JS=JS_"""match_build"":"""_E_""","
 S JS=JS_"""match_flat"":"""_F_""","
 S JS=JS_"""match_number"":"""_G_""","
 S JS=JS_"""match_postcode"":"""_H_""","
 S JS=JS_"""match_street"":"""_I_""","
 S JS=JS_"""abp_number"":"""_J_""","
 S JS=JS_"""abp_postcode"":"""_K_""","
 S JS=JS_"""abp_street"":"""_L_""","
 S JS=JS_"""abp_town"":"""_M_""","
 S JS=JS_"""qualifier"":"""_N_""","
 S JS=JS_"""add_candidate"":"""_O_"""},"
 QUIT JS
 
CALC(arguments,body,result) ;
 new data,a
 K ^TMP($J),^BODY
 I '$$IP() D H("<B>sorry</B>") G XBYE 
 
 M ^BODY=body
 
 S data=""
 f i=1:1:$o(body(""),-1) set ^TMP($J,i)=body(i)_"<br>",data=data_body(i)
 s i=i+1
 ;s ^TMP($J,i)="<b>ZWR ^BODY</b>"
 
 K ^TMP($J)
 ;S ^TMP($J,1)=$$REL(data)
 
 set cnt=1,data=$$REL(data)
 F i=1:1:$L(data,$c(13)) set:$p(data,$c(13),i)'=$C(10) a(cnt)=$p(data,$c(13,10),i),cnt=cnt+1
 
 s zi=""
 f  s zi=$o(a(zi)) q:zi=""  do
 .s adrec=a(zi)
 .D GETUPRN^UPRNMGR(adrec)
 .s json=^temp($j,1)
 .K B,C
 .D DECODE^VPRJSON($name(json),$name(B),$name(C))
 .set UPRN=$GET(B("UPRN"))
 .S ^TMP($J,cnt)=adrec_" = "_UPRN_"<BR>"
 .S cnt=cnt+1
 .quit
 
 set result("mime")="text/html"
 set result=$na(^TMP($J))
 Q 1
 
CHECK(arguments,body,result) ;
 k ^TMP($J)
 I '$$IP() D H("<B>sorry</B>") G XBYE
 M ^BODY=body
 f i=1:1:$o(body(""),-1) set ^TMP($J,i)=body(i)_"<br>"
 s i=i+1
 s ^TMP($J,i)="<b>end</b>"
 
 ;set result("mime")="text/html"
 ;set result=$na(^TMP($J))
 ;m ^A=^TMP($J)
 ; check the username/password
 
 kill ^TMP($J)
 
 d H("<html>")
 d H("<form action=""https://apiuprn.discoverydataservice.net:8443/ui/calculate"" method=""post"">")
 d H("<textarea rows=""4"" cols=""50"" name=""addrlines"">")
 d H("Yvonne carter Building,58 turner street,london,E1 2AB"_$C(10))
 d H("top flat,133 shepherdess walk,,london,,n17qa"_$C(10))
 d H("5 uferstrasse,,,stuebach,Germany,g1 4sg"_$C(10))
 d H("Crystal Palace football club,  SE25 6PU"_$C(10))
 d H("10 Downing St,Westminster,London,SW1A2AA"_$C(10)) 
 d H("</textarea>")
 
 d H("<input type=""submit"">")
 d H("</form>")
 d H("</html>")
 
 set result("mime")="text/html"
 set result=$na(^TMP($J))
 quit 1
 
H(H) ;
 n c
 s c=$order(^TMP($J,""),-1)+1
 s ^TMP($J,c)=H_$c(13)_$c(10)
 quit
 
TR(ZX,ZY,ZZ) ;Extrinsix function to translate a string [ 01/19/92  5:03 PM ]
         ;ZX is the variable
         ;ZY is the string to translate
         ;ZZis the string to tranlsate to
         N ZW
         S ZW=0
         FOR  S ZW=$F(ZX,ZY,ZW) Q:ZW=0  S ZW=ZW-$L(ZY)-1 S ZX=$E(ZX,0,ZW)_ZZ_$E(ZX,ZW+$L(ZY)+1,99999),ZW=ZW+$L(ZZ)+1
         Q ZX
 
REL(data) 
         S data=$$TR(data,"+"," ")
         D HEX
         S A=""
         F  S A=$O(^TOPT($J_"HEX",A)) Q:A=""  D
         .S HEX=$P(A,"%",2)
  .;W $$FUNC^%HD("2C")
         .;S data=$$TR(data,A,$C($$FUNC^%HD(HEX)))
		 .S data=$$TR(data,A,$C($$FUNCFM(HEX)))
         .Q
         Q data

FUNCFM(h) ;
 n c,d,dg
 s d=0,h=$tr(h,"abcdef","ABCDEF")
 f c=1:1:$l(h) s dg=$f("0123456789ABCDEF",$e(h,c)) q:'dg  s d=(d*16)+(dg-2)
 quit d
 
HEX      K ^TOPT($J_"HEX")
  ; %0D%0A%0D%0A
  S ^TOPT($J_"HEX","%0D")="",^TOPT($J_"HEX","%0A")=""
         S ^TOPT($J_"HEX","%20")="",^TOPT($J_"HEX","%C2")=""
         S ^TOPT($J_"HEX","%22")="",^TOPT($J_"HEX","%A3")=""
         S ^TOPT($J_"HEX","%3D")="",^TOPT($J_"HEX","%2B")=""
         S ^TOPT($J_"HEX","%5E")="",^TOPT($J_"HEX","%7E")=""
         S ^TOPT($J_"HEX","%2F")="",^TOPT($J_"HEX","%28")=""
         S ^TOPT($J_"HEX","%29")="",^TOPT($J_"HEX","%2C")=""
         S ^TOPT($J_"HEX","%26")="",^TOPT($J_"HEX","%21")=""
         S ^TOPT($J_"HEX","%5B")="",^TOPT($J_"HEX","%5D")=""
         S ^TOPT($J_"HEX","%3F")="",^TOPT($J_"HEX","%24")=""
         S ^TOPT($J_"HEX","%25")="",^TOPT($J_"HEX","%7B")=""
         S ^TOPT($J_"HEX","%7D")="",^TOPT($J_"HEX","%5C")=""
         S ^TOPT($J_"HEX","%23")="",^TOPT($J_"HEX","%3A")=""
         S ^TOPT($J_"HEX","%3B")="",^TOPT($J_"HEX","%27")=""
         S ^TOPT($J_"HEX","%3C")="",^TOPT($J_"HEX","%3E")=""
		 S ^TOPT($J_"HEX","%09")=""
         Q
