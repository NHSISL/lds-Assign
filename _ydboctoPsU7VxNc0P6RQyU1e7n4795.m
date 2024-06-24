;; This is a generated file; do not modify. Generated M code corresponds to below SQL query
;; ---------------------------------------------------------
;  select oid,typname from pg_catalog.pg_type;
;; ---------------------------------------------------------

octoPlan0(cursorId,wrapInTp)
    NEW %ydboctop,%ydboctoexpr
    TSTART:wrapInTp ():(serial)
    DO octoPlan1(cursorId)
    TCOMMIT:wrapInTp
    QUIT

octoPlan1(cursorId)
    NEW %ydboctoz,%ydboctoexpr KILL %ydboctocursor(cursorId,"keys",3,"","")
    SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname")=""
    FOR  SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname")=$ORDER(^%ydboctoocto("tables","pg_catalog","pg_type",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname"))) QUIT:(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname")="")  DO
    . SET %ydboctoexpr=1
    . DO:%ydboctoexpr
    . . SET:1&$INCREMENT(%ydboctocursor(cursorId,"keys",3,"","")) %ydboctoz=42
    . . SET %ydboctoexpr=$PIECE($GET(^%ydboctoocto("tables","pg_catalog","pg_type",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname"))),"|",30) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . SET %ydboctoexpr(0)=%ydboctoexpr
    . . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname")
    . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . . SET %ydboctocursor(cursorId,"keys",3,"","",%ydboctocursor(cursorId,"keys",3,"",""))=%ydboctoexpr
    ZKILL %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_type","typname")
    QUIT
