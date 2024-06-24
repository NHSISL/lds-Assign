;; This is a generated file; do not modify.
;; ---------------------------------------------------------
;; Generated M code maintains cross reference for relkind column in pg_catalog.pg_class table
;; ---------------------------------------------------------

xrefPlan(cursorId)
    NEW base,subs DO baseSubs(.base,.subs)
    ; XREFDATA parameters: global, subscripts, delimiter, piece, nmonly (0 here), zpiece (always 0), omitfix (always 1),
    ;   stat (always 2), AIM Metadata Type (depending if the table has it specified or not);   forceStrOrder (1 for STRING type columns so canonical strings are correctly ordered, 0 otherwise)
    NEW aimglobal SET aimglobal=$$XREFDATA^%YDBAIM(base,.subs,"|",16,0,0,1,2,0,1)
    ; Now that xref building is complete, cleanup saved cancel related state information
    KILL %ydboctoCancel("pg_catalog.pg_class","relkind","aimXref")
    ; Put the comment in again, in case it's deleted after the metadata is created but before the xref is built
    NEW comment SET comment="xref for table pg_catalog.pg_class column relkind"
    SET @aimglobal@("comment-16")=comment
    ; And mark that we are done with building xref so we won't try to build again
    SET ^%ydbAIMOctoCache("pg_catalog.pg_class","relkind","completed?")=1
    ; This is redundant, but is here just in case the ^%ydbAIMOctoCache global is deleted.
    ; Otherwise, %ydboctoDiscard will have no way to figure out how to discard the AIM global.
    SET ^%ydbAIMOctoCache("pg_catalog.pg_class","relkind","location")=$name(@aimglobal@(16))
    QUIT
    ;

xrefMetadata ; called by src/physical/emit_physical_plan.c after xref plan generation
    NEW base,subs DO baseSubs(.base,.subs)
    ; XREFDATA parameters: global, subscripts, delimiter, piece, nmonly (1 here), zpiece (always 0), omitfix (always 1),
    ;   stat (always 2), AIM Metadata Type (depending if the table has it specified or not)
    NEW aimglobal SET aimglobal=$$XREFDATA^%YDBAIM(base,.subs,"|",16,1,0,1,2,0,1)
    SET ^%ydbAIMOctoCache("pg_catalog.pg_class","relkind","location")=$name(@aimglobal@(16))
    SET ^%ydbAIMOctoCache("pg_catalog.pg_class","relkind","completed?")=0
    ; Cancelation information for _ydboctoCleanup.m
    SET %ydboctoCancel("pg_catalog.pg_class","relkind","aimXref")=""
    NEW comment SET comment="xref for table pg_catalog.pg_class column relkind"
    SET @aimglobal@("comment-16")=comment
    QUIT
    ;

baseSubs:(base,subs) ; Private entry point for use by other labels in this routine
    NEW global SET global=$NAME(^%ydboctoocto("tables","pg_catalog","pg_class",":"))
    NEW subn for subn=1:1:$QLENGTH(global) DO
    . SET subs(subn)=$QSUBSCRIPT(global,subn)
    . IF subs(subn)'[":" SET subs(subn)=$ZWRITE(subs(subn))
    SET base=$QSUBSCRIPT(global,0)
    QUIT
    ;

