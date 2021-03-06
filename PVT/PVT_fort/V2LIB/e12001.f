      SUBROUTINE E12001 (USEPRM)

C  E12001 tests the handling of FORTRAN specific error 2001.

      COMMON /GLOBNU/ CTLHND, ERRSIG, ERRFIL, IERRCT, UNERR,
     1        TESTCT, IFLERR, PASSSW, ERRSW, MAXLIN,
     2        CONID, MEMUN, WKID, WTYPE, GLBLUN, INDLUN,
     3        DUMINT, DUMRL
      INTEGER         CTLHND, ERRSIG, ERRFIL, IERRCT, UNERR,
     1        TESTCT, IFLERR, PASSSW, ERRSW, MAXLIN,
     2        CONID, MEMUN, WKID, WTYPE, GLBLUN, INDLUN,
     3        DUMINT(20), ERRIND
      REAL    DUMRL(20)

      COMMON /ERRINF/ ERRCOM,FUNCOM,FILCOM, ERNMSW, EXPSIZ,EXPERR,
     1                USRERR, ERRSAV,      FUNSAV,      FILSAV,
     2                EFCNT, EFID
      INTEGER         ERRCOM,FUNCOM,FILCOM, ERNMSW, EXPSIZ,EXPERR(10),
     1                USRERR, ERRSAV(200), FUNSAV(200), FILSAV(200),
     2                EFCNT, EFID(100)
      COMMON /ERRCHR/ CURCON,     ERRSRS,    ERRMRK,    ERFLNM,
     1                CONTAB
      CHARACTER       CURCON*200, ERRSRS*40, ERRMRK*20, ERFLNM*80,
     1                CONTAB(40)*150

      INTEGER   USEPRM, IDUM1, IA210(2,10), ARNM, IA10(10),IDUM2

      CURCON = 'output parameter size is insufficient'
      CALL SETVS ('2001', EXPERR, EXPSIZ)
      ERRSRS = '2'
      CALL ESETUP (USEPRM)

      CALL AVARNM (ARNM)
      CALL POPARF (11, ARNM)
      CALL PDASAR (11)

      CALL POPST (100)
      CALL PTX (0.5, 0.5, 'TEXT100')
      CALL PEXST (101)
      CALL PEXST (102)
      CALL PCLST
      CALL POPST (101)
      CALL PTX (0.3,0.3, 'TEXT101')
      CALL PEXST (102)
      CALL PCLST
      CALL POPST (102)
      CALL PTX (0.8,0.9,'TEXT102')
      CALL PCLST

      CALL PARAST (11)

      CALL RRSID (11, 2, IDUM1, IA10)

      CALL RREPAN (11,102,0,0,1,1,IDUM1,IDUM2,IA210)

      CALL RREPDE (11,100,0,0,1,1,IDUM1,IDUM2,IA210)

      CALL PCLARF (11)

      CALL ENDERR

      END
