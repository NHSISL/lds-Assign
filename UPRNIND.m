UPRNIND ;Rebuilds all the UPRN indexes [ 05/22/2023  11:42 AM ]
	n
	set $ZINT="I $$JOBEXAM^UPRNIND($ZPOS)"
	S ^STATS("START")=$H
	s d="~"
	K ^UPRNX
	;
REDO ;First the name uprn BLPU table
	D BLPU
	;
	;
GO ;Next the post office DPA table
	D INDMAIN
	;
	;
	;Next the local authority LPI table
	S ^STATS("END")=$H
	Q
	;
BLPU ;Index on BLPU record
	s i=1
	s d="~"
	s uprn=""
	for  s uprn=$O(^UPRN("U",uprn)) q:uprn=""  d
	. s rec=^(uprn)
	. ;i '$$isok(uprn) q
	. s post=$p(rec,d,2)
	. S i=i+1
	. S ^UPRNX("X1",post,uprn)=""
	. I '(i#10000) w !,i," X1 index set"
	q
	;
UPC ;Checks for any parent child links
	Q
	q
	;
INDMAIN ;Index on DPA table
	;set $ZINT="I $$JOBEXAM^UPRNIND($ZPOS)"
	SET ^STATS("INDMAIN",1)=$H
	s i=1
	s d="~"
	s (uprn,key)=""
REENT for  s uprn=$O(^UPRN("U",uprn)) q:uprn=""  d
	. ;I '$$isok(uprn) q
	. s table=""
	. for  s table=$O(^UPRN("U",uprn,table)) q:table=""  d
	. . for  s key=$O(^UPRN("U",uprn,table,key)) q:key=""  d
	. . . s rec=^UPRN("U",uprn,table,key)
	. . . q:rec=""
	. . . s flat=$p(rec,d,1)
	. . . s build=$p(rec,d,2)
	. . . s bno=$p(rec,d,3)
	. . . s depth=$p(rec,d,4)
	. . . s street=$p(rec,d,5)
	. . . s deploc=$p(rec,d,6)
	. . . s loc=$p(rec,d,7)
	. . . s town=$p(rec,d,8)
	. . . s post=$p(rec,d,9)
	. . . s org=$p(rec,d,10)
	. . . s dep=$p(rec,d,11)
	. . . s ptype=$p(rec,d,12)
	. . . d setind
	. . . s i=i+1
	. . . I '(i#10000) set ^I=i w i," "
	SET ^STATS("INDMAIN",2)=$H
	q
setind ;Sets indexes
	d setind1
	i flat["/"!(bno["/") d
	. s xflat=flat,xbno=bno
	. d setind1
	. s flat=xflat,bno=xbno
	. quit
	quit
	;
setind1 ;Sets indexes
	n i
	s ZONE=$e(post,1)
	i town'="" S ^UPRNS("TOWN",town)=""
	i loc'="" S ^UPRNS("TOWN",loc)=""
	i $l(street," ")>6 q
	i $l(build," ")>6 q
	s pstreet=$$plural^UPRNU(street)
	s pbuild=$$plural^UPRNU(build)
	s pdepth=$$plural^UPRNU(depth)
	s same=0
	i pstreet=street,pbuild=build,pdepth=depth s same=1
	s indrec=post_" "_flat_" "_build_" "_bno_" "_depth_" "_street_" "_deploc_" "_loc
	for  q:(indrec'["  ")  s indrec=$$tr^UPRNL(indrec,"  "," ")
	s indrec=$$lt^UPRNL(indrec)
	S ^UPRNX("X",indrec,uprn,table,key)=""
	i 'same d
	. s indrec=post_" "_flat_" "_pbuild_" "_bno_" "_pdepth_" "_pstreet_" "_deploc_" "_loc
	. for  q:(indrec'["  ")  s indrec=$$tr^UPRNL(indrec,"  "," ")
	. s indrec=$$lt^UPRNL(indrec)
	. S ^UPRNX("X",indrec,uprn,table,key)=""
	i deploc'="" d
	. s ^UPRNX("X5",post,street_" "_deploc,bno,build,flat,uprn,table,key)=""
	i depth'="" d
	. s ^UPRNX("X5",post,depth_" "_street,bno,build,flat,uprn,table,key)=""
	. s ^UPRNX("X5",post,street,bno,depth,flat_" "_build,uprn,table,key)=""
	. i 'same d
	. . s ^UPRNX("X5",post,pstreet,bno,pdepth,flat_" "_pbuild,uprn,table,key)=""
	s ^UPRNX("X5",post,street,bno,build,flat,uprn,table,key)=""
	i 'same d
	. s ^UPRNX("X5",post,pstreet,bno,pbuild,flat,uprn,table,key)=""
	i depth'="" d
	. set ^UPRNX("X3",ZONE,depth,bno,post,uprn,table,key)=""
	. set ^UPRNX("X3",ZONE,pdepth,bno,post,uprn,table,key)=""
	. D indexstr("STR",depth)
	. i pdepth'=depth D indexstr("STR",pdepth)
	i deploc'="",street="" d
	. S ^UPRNX("X5",post,deploc,bno,build,flat,uprn,table,key)=""
	i depth'="",street="" d
	. S ^UPRNX("X5",depth,bno,build,flat,uprn,table,key)=""
	. i 'same d
	. . S ^UPRNX("X5",pdepth,bno,pbuild,flat,uprn,table,key)=""
	i street'="" d
	. set ^UPRNX("X3",ZONE,street,bno,post,uprn,table,key)=""
	. i 'same d
	. . set ^UPRNX("X3",ZONE,pstreet,bno,post,uprn,table,key)=""
	. set ^UPRNX("X3",ZONE,$tr(street," "),bno,post,uprn,table,key)=""
	. I depth'="" d
	. . set ^UPRNX("X3",ZONE,depth_" "_street,bno,post,uprn,table,key)=""
	. . i 'same d
	. . . set ^UPRNX("X3",ZONE,pdepth_" "_pstreet,bno,post,uprn,table,key)=""
	. do indexstr("STR",street)
	. i pstreet'=street do indexstr("STR",pstreet)
	i build'="" d
	. set ^UPRNX("X3",ZONE,build,flat,post,uprn,table,key)=""
	. set ^UPRNX("X3",ZONE,$tr(build," "),flat,post,uprn,table,key)=""
	. i 'same d
	. . set ^UPRNX("X3",ZONE,pbuild,flat,post,uprn,table,key)=""
	. do indexstr("BLD",build)
	. i pbuild'=build do indexstr("BLD",pbuild)
	i build'="",street'="" d
	. set ^UPRNX("X2",build,street,flat,post,bno,uprn,table,key)=""
	I flat'="",bno'="",street'="",build'="" d
	. S ^UPRNX("X4",post,street,bno,flat,build,uprn,table,key)=""
	if build="",org'="" d
	. set ^UPRNX("X5",post,street,bno,org,flat,uprn,table,key)=""
	. i 'same d
	. . set ^UPRNX("X5",post,pstreet,bno,org,flat,uprn,table,key)=""
	. if flat'="" d
	. . set ^UPRNX("X3",ZONE,org,flat,post,uprn,table,key)=""
	. . do indexstr("BLD",org)
	I street'="",build'="" d
	. S ^UPRNX("X5A",post,street,build,flat,bno,uprn,table,key)=""
	. i 'same d
	. . S ^UPRNX("X5A",post,pstreet,pbuild,flat,bno,uprn,table,key)=""
	I pstreet'=street!(pbuild'=build) d
	. I deploc'="" d
	. . s ^UPRNX("X5",post,pstreet_" "_deploc,bno,pbuild,flat,uprn,table,key)=""
	. I pdepth'="" d
	. . s ^UPRNX("X5",post,pdepth_" "_pstreet,bno,pbuild,flat,uprn,table,key)=""
	I town'="",street'="",bno'="" d
	. s ^UPRNX("X6",street,bno,town,build,flat,uprn,table,key)=""
	I build'="" d
	. i town'="" d
	. . S ^UPRNX("X7",$tr(build," "),town,uprn,table,key)=""
	. I loc'="" d
	. . S ^UPRNX("X7",$tr(build," "),town,uprn,table,key)=""
eind q
indexstr(index,term)         ;Indexes street or building etc
	n i,word
	S ^UPRNX("X."_index,ZONE,term)=term
	f i=1:1:$l(term," ") d
	. s word=$p(term," ",i)
	. i $L(word)<5 q
	. S ^UPRNX("X.W",ZONE,word)=""
	q
isok(uprn)        ;
	n (uprn)
	s class=$G(^UPRN("CLASS",uprn))
	i class="" q 1
	i '$D(^UPRN("CLASSIFICATION",class)) q 1
	s res=$G(^UPRN("CLASSIFICATION",class,"residential"))
	i res="Y" q 1
	q 0
	;
JOBEXAM(%ZPOS)
	s idx=$o(^interupt(""),-1)+1
	S ^interupt(idx)=$get(%ZPOS)
	D LOG
	QUIT

LOG ;
	S %D=$H,%I="exam"
	S %TOP=$STACK(-1),%N=0
	L ^LOG:10
	I '$T QUIT
	S ID=$I(^LOG)
	F %LVL=0:1:%TOP S %N=%N+1,^LOG("log",ID,%D,$J,%I,"error","stack",%N)=$STACK(%LVL,"PLACE")_":"_$STACK(%LVL,"MCODE")
	N %X,%Y
	S %X="^LOG(""log"",ID,%D,$J,%I,""error"",""symbols"","
	S %Y="%" F  M:$D(@%Y) @(%X_"%Y)="_%Y) S %Y=$O(@%Y) Q:%Y=""
	L -^LOG
	QUIT