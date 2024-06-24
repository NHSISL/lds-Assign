;; This is a generated file; do not modify. Generated M code corresponds to below SQL query
;; ---------------------------------------------------------
;  \d;
;; ---------------------------------------------------------

octoPlan0(cursorId,wrapInTp)
    DO:'$GET(^%ydbAIMOctoCache("pg_catalog.pg_class","relkind","completed?")) xrefPlan^%ydboctoXshCkYmkhcl0PGlqoldODIH(cursorId)
    NEW %ydboctop,%ydboctoexpr
    TSTART:wrapInTp ():(serial)
    DO octoPlan1(cursorId)
    TCOMMIT:wrapInTp
    QUIT

octoPlan1(cursorId)
    NEW %ydboctoz,%ydboctoexpr KILL %ydboctocursor(cursorId,"keys",4,"","")
    NEW %ydboctoin0
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",19))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",20))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",21))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",22))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",23))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",24))
    SET %ydboctoin0(%ydboctoexpr)=""
    DO
    . SET %ydboctoexpr=$ZYSQLNULL
    SET %ydboctoin0(%ydboctoexpr)=""
    SET %ydboctoin0="" FOR  DO:$DATA(%ydboctoin0(%ydboctoin0))  SET %ydboctoin0=$ORDER(%ydboctoin0(%ydboctoin0)) QUIT:""=%ydboctoin0
    . SET %ydboctoexpr=%ydboctoin0
    . SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")=%ydboctoexpr IF '$ZYISSQLNULL(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")) IF $DATA(^%ydbAIMDPCFxqhhaAIvyNRmO2IVHF5(16,$$strcolval2aimsubs^%ydboctoplanhelpers(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")))) DO
    . . SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")=""
    . . FOR  SET %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")=$ORDER(^%ydbAIMDPCFxqhhaAIvyNRmO2IVHF5(16,$$strcolval2aimsubs^%ydboctoplanhelpers(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")),%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid"))) QUIT:(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")="")  DO
    . . . SET %ydboctoexpr=1
    . . . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")
    . . . SET %ydboctoexpr(1,0)=%ydboctoexpr
    . . . SET %ydboctoexpr=$$String2Boolean^%ydboctoplanhelpers($$pgTableIsVisible^%ydboctopgfunctions(%ydboctoexpr(1,0)))
    . . . DO:%ydboctoexpr
    . . . . SET %ydboctoz(2)=0
    . . . . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_class",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")))),"|",2) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . . . . SET %ydboctoexpr=+%ydboctoexpr
    . . . . SET %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")=%ydboctoexpr IF '$ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")) IF $DATA(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid"))) DO
    . . . . . SET %ydboctoz(2)=1
    . . . . . DO octoLeftJoin2
    . . . . DO:0=%ydboctoz(2)
    . . . . . SET %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")=$ZYSQLNULL
    . . . . . DO octoLeftJoin2
    . . . . ZKILL %ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")
    ZKILL %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")
    ZKILL %ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")
    NEW %ydboctoi  SET %ydboctoi(0)=1
    SET %ydboctoi(1)="" FOR  DO:$DATA(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1)))  SET %ydboctoi(1)=$ORDER(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1)),1)  QUIT:(%ydboctoi(1)="")
    . SET %ydboctoi(2)="" FOR  DO:$DATA(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2)))  SET %ydboctoi(2)=$ORDER(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2)),1)  QUIT:(%ydboctoi(2)="")
    . . SET %ydboctoi(3)="" FOR  SET %ydboctoi(3)=$ORDER(%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2),%ydboctoi(3))) QUIT:(%ydboctoi(3)="")  DO
    . . . SET %ydboctocursor(cursorId,"keys",4,"","",%ydboctoi(0))=%ydboctocursor(cursorId,"keys",4,"","","OrderBy",%ydboctoi(1),%ydboctoi(2),%ydboctoi(3))
    . . . IF $INCREMENT(%ydboctoi(0))
    KILL %ydboctocursor(cursorId,"keys",4,"","","OrderBy")
    SET %ydboctocursor(cursorId,"keys",4,"","")=%ydboctoi(0)-1
    QUIT

octoLeftJoin2;
    SET %ydboctoexpr=1
    DO
    . SET %ydboctoexpr(5)=0
    . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")
    . SET %ydboctoexpr(5,0)=%ydboctoexpr
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",19))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",20))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",21))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",22))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",23))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",24))
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr(5,1)=%ydboctoexpr
    . SET %ydboctoexpr(5)=%ydboctoexpr(5)!(%ydboctoexpr(5,0)=%ydboctoexpr(5,1))
    . SET %ydboctoexpr=%ydboctoexpr(5)
    . SET %ydboctoexpr(4)=%ydboctoexpr
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr(5)=%ydboctoexpr
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",25))
    . SET %ydboctoexpr=%ydboctoexpr(5)'=%ydboctoexpr
    . SET %ydboctoexpr=%ydboctoexpr(4)&%ydboctoexpr
    . SET %ydboctoexpr(3)=%ydboctoexpr
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr(4)=%ydboctoexpr
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",26))
    . SET %ydboctoexpr=%ydboctoexpr(4)'=%ydboctoexpr
    . SET %ydboctoexpr=%ydboctoexpr(3)&%ydboctoexpr
    . SET %ydboctoexpr(2)=%ydboctoexpr
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr(4)=%ydboctoexpr
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",27))
    . SET %ydboctoexpr=$$regexmatch^%ydboctoplanhelpers(%ydboctoexpr(4),%ydboctoexpr,3,0)
    . SET %ydboctoexpr='%ydboctoexpr
    . SET %ydboctoexpr=%ydboctoexpr(2)&%ydboctoexpr
    . SET %ydboctoexpr(1)=%ydboctoexpr
    . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")
    . SET %ydboctoexpr(2,0)=%ydboctoexpr
    . SET %ydboctoexpr=$$String2Boolean^%ydboctoplanhelpers($$pgTableIsVisible^%ydboctopgfunctions(%ydboctoexpr(2,0)))
    . SET %ydboctoexpr=%ydboctoexpr(1)&%ydboctoexpr
    DO:%ydboctoexpr
    . SET:1&$INCREMENT(%ydboctocursor(cursorId,"keys",4,"","")) %ydboctoz=42
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . SET %ydboctoexpr(0)=%ydboctoexpr
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_class",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")))),"|",1) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . SET %ydboctoexpr(0)=%ydboctoexpr
    . SET %ydboctoexpr=%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","relkind")
    . SET %ydboctoexpr(1,0)=%ydboctoexpr
    . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",1))
    . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",2))
    . ELSE  DO
    . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",3))
    . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",4))
    . . ELSE  DO
    . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",5))
    . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",6))
    . . . ELSE  DO
    . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",7))
    . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",8))
    . . . . ELSE  DO
    . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",9))
    . . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",10))
    . . . . . ELSE  DO
    . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",11))
    . . . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",12))
    . . . . . . ELSE  DO
    . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",13))
    . . . . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",14))
    . . . . . . . ELSE  DO
    . . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",15))
    . . . . . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",16))
    . . . . . . . . ELSE  DO
    . . . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",17))
    . . . . . . . . . IF %ydboctoexpr=%ydboctoexpr(1,0) DO
    . . . . . . . . . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",18))
    . . . . . . . . . ELSE  DO
    . . . . . . . . . . SET %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . SET %ydboctoexpr(0)=%ydboctoexpr
    . SET %ydboctoexpr=$PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_class",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")))),"|",5) SET:(""=%ydboctoexpr) %ydboctoexpr=$ZYSQLNULL
    . SET %ydboctoexpr(1,0)=%ydboctoexpr
    . SET %ydboctoexpr=$$pgGetUserById^%ydboctopgfunctions(%ydboctoexpr(1,0))
    . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . SET %ydboctoexpr=%ydboctoexpr(0)_%ydboctoexpr
    . SET %ydboctocursor(cursorId,"keys",4,"","","OrderBy","Z"_$$piecevalue2colvalue^%ydboctoplanhelpers($PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_namespace",%ydboctocursor(cursorId,"keys",2,"pg_catalog.pg_namespace","oid")))),"|",1)),"Z"_$$piecevalue2colvalue^%ydboctoplanhelpers($PIECE($SELECT($ZYISSQLNULL(%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")):$ZYSQLNULL,1:$GET(^%ydboctoocto("tables","pg_catalog","pg_class",%ydboctocursor(cursorId,"keys",1,"pg_catalog.pg_class","oid")))),"|",1)),%ydboctocursor(cursorId,"keys",4,"",""))=%ydboctoexpr
    QUIT
