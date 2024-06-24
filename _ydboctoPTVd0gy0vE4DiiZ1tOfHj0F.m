;; This is a generated file; do not modify. Generated M code corresponds to below SQL query
;; ---------------------------------------------------------
;  select 1;
;; ---------------------------------------------------------

octoPlan0(cursorId,wrapInTp)
    NEW %ydboctop,%ydboctoexpr
    TSTART:wrapInTp ():(serial)
    DO octoPlan1(cursorId)
    TCOMMIT:wrapInTp
    QUIT

octoPlan1(cursorId)
    NEW %ydboctoz,%ydboctoexpr KILL %ydboctocursor(cursorId,"keys",3,"","")
    SET %ydboctocursor(cursorId,"keys",1,"octoonerowtable","id")=""
    FOR  SET %ydboctocursor(cursorId,"keys",1,"octoonerowtable","id")=$ORDER(^%ydboctoocto("tables","octoOneRow",%ydboctocursor(cursorId,"keys",1,"octoonerowtable","id"))) QUIT:(%ydboctocursor(cursorId,"keys",1,"octoonerowtable","id")="")  DO
    . SET %ydboctoexpr=1
    . DO:%ydboctoexpr
    . . SET:1&$INCREMENT(%ydboctocursor(cursorId,"keys",3,"","")) %ydboctoz=42
    . . SET %ydboctoexpr=$GET(%ydboctocursor(cursorId,"parameters",1))
    . . SET %ydboctoexpr=$$str2mval^%ydboctoplanhelpers(%ydboctoexpr)
    . . SET %ydboctocursor(cursorId,"keys",3,"","",%ydboctocursor(cursorId,"keys",3,"",""))=%ydboctoexpr
    ZKILL %ydboctocursor(cursorId,"keys",1,"octoonerowtable","id")
    QUIT
