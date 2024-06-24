;; This is a generated file; do not modify. Generated M code corresponds to below SQL query
;; ---------------------------------------------------------
;  select proname,pronargs,typname,proargtypes,prosrc from pg_catalog.pg_proc inner join pg_catalog.pg_type on pg_catalog.pg_proc.prorettype = pg_catalog.pg_type.oid order by PRONAME;
;; ---------------------------------------------------------

octoPlan0(cursorId,wrapInTp)
    DO:'$GET(^%ydbAIMOctoCache("pg_catalog.pg_type","oid","completed?")) xrefPlan^%ydboctoXHezx9jR0f2WX4iUoERgf7A(cursorId)
    NEW %ydboctop,%ydboctoexpr
    TSTART:wrapInTp ():(serial)
    DO octoPlan1(cursorId)
    TCOMMIT:wrapInTp
    QUIT

octoPlan1(cursorId)
    NEW %ydboctoz,%ydboctoexpr KILL %ydboctocursor(cursorId,"keys",4,"","")
    SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid")=""
    FOR  SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid")=$ORDER(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))) QUIT:(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid")="")  DO
    . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",18) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr=+%ydboctoexpr
    . SET %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","oid")=%ydboctoexpr IF '$ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","oid")) IF $DATA(^%ydbAIMDFN7TPfjkbSeybkHPe9cbEA(30,%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","oid"))) DO
    . . SET %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname")=""
    . . FOR  SET %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname")=$ORDER(^%ydbAIMDFN7TPfjkbSeybkHPe9cbEA(30,%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","oid"),%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname"))) QUIT:(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname")="")  DO
    . . . SET %ydboctoexpr=1
    . . . DO:%ydboctoexpr
    . . . . SET:1&$INCREMENT(%ydboctocursor(cursorId,"keys",4,"","")) %ydboctoz=42
    . . . . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . . . SET %ydboctoexpr(0)=%ydboctoexpr
    . . . . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",16) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . . . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . . . . SET %ydboctoexpr(0)=%ydboctoexpr
    . . . . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname")
    . . . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . . . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . . . . SET %ydboctoexpr(0)=%ydboctoexpr
    . . . . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",19) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . . . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . . . . SET %ydboctoexpr(0)=%ydboctoexpr
    . . . . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",25) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . . . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . . . . SET %ydboctocursor(cursorId,"keys",4,"","","OrderBy","Z"_$$piecevalue2colvalue^%ydboctoplanhelpers($PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_proc",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid"))),"|",1)),%ydboctocursor(cursorId,"keys",4,"",""))=%ydboctoexpr
    . ZKILL %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","typname")
    . ZKILL %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_type","oid")
    ZKILL %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_proc","oid")
    NEW %ydboctoi  SET %ydboctoi(0)=1
    SET %ydboctoi(1)="" FOR  DO:$DATA(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1)))  SET %ydboctoi(1)=$ORDER(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1)),1)  QUIT:(%ydboctoi(1)="")
    . SET %ydboctoi(2)="" FOR  SET %ydboctoi(2)=$ORDER(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2))) QUIT:(%ydboctoi(2)="")  DO
    . . SET %ydboctocursor(cursorId,"keys",4,"","",%ydboctoi(0))=%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2))
    . . IF $INCREMENT(%ydboctoi(0))
    KILL %ydboctocursor(cursorId,"keys",4,"","","OrderBy")
    SET %ydboctocursor(cursorId,"keys",4,"","")=%ydboctoi(0)-1
    QUIT
