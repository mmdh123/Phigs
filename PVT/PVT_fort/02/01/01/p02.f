C  *********************************************************
C  *                                                       *
C  *    TEST NUMBER: 02.01.01/02                           *
C  *    TEST TITLE : Structure creation by emptying a      *
C  *                 non-existent structure                *
C  *                                                       *
C  *    PHIGS Validation Tests, produced by NIST           *
C  *                                                       *
C  *********************************************************
 
 
      COMMON /GLOBNU/ CTLHND, ERRSIG, ERRFIL, IERRCT, UNERR,
     1        TESTCT, IFLERR, PASSSW, ERRSW, MAXLIN,
     2        CONID, MEMUN, WKID, WTYPE, GLBLUN, INDLUN,
     3        DUMINT, DUMRL
      INTEGER         CTLHND, ERRSIG, ERRFIL, IERRCT, UNERR,
     1        TESTCT, IFLERR, PASSSW, ERRSW, MAXLIN,
     2        CONID, MEMUN, WKID, WTYPE, GLBLUN, INDLUN,
     3        DUMINT(20), ERRIND
      REAL    DUMRL(20)
 
      COMMON /GLOBCH/ PIDENT,    GLBERR,    TSTMSG,     FUNCID,
     1                DUMCH
      CHARACTER       PIDENT*40, GLBERR*60, TSTMSG*900, FUNCID*80,
     1                DUMCH(20)*20
 
      INTEGER    PSEMPT
      PARAMETER (PSEMPT = 1)
 
C PHIGS parameter types
      INTEGER NSTID, NSTR, STRID, STRSTI
 
      CALL INITGL ('02.01.01/02')
 
C open PHIGS
      CALL XPOPPH (ERRFIL, MEMUN)
 
      CALL SETMSG ('2', 'Emptying a non-existent structure ' //
     1             'should create one new structure with '   //
     2             'the specified identifier in the CSS.')
 
      STRID = 100
C empty structure
      CALL PEMST (STRID)
 
C nstid = number of structure identifiers
C nstr  = Nth structure identifier
      CALL PQSID  (1, ERRIND, NSTID, NSTR)
      CALL IFPF   (ERRIND .EQ. 0   .AND.
     1             NSTID  .EQ. 1   .AND.
     2             NSTR   .EQ. STRID)
 
      CALL SETMSG ('2', 'Emptying a non-existent structure '    //
     1             'should create an empty structure '          //
     2             'with the specified identifier in '          //
     3             'the CSS.')
 
C strsti = structure status identifier
      CALL PQSTST (STRID, ERRIND, STRSTI)
      CALL CHKINQ ('pqstst', ERRIND)
      CALL IFPF   (STRSTI .EQ. PSEMPT)
 
      CALL ENDIT
      END
 
