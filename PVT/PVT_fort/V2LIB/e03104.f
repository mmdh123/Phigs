      SUBROUTINE E03104 (USEPRM)

C   E03104 tests the handling of error number 104

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

C  type of retured value
      INTEGER      PSET,        PREALI
      PARAMETER   (PSET=0,      PREALI=1)

      INTEGER  USEPRM, IX, NLTYP1, MXTYPE, LINETY, LINECL
      INTEGER  IDUM1,IDUM2,IDUM3, UNTYPE, THISLT, SPECWT
      REAL     LINESC, RDUM1, RDUM2, RDUM3
      LOGICAL  STREQ, APPEQ

      CURCON = 'the specified linetype is not available on the '//
     1         'specified workstation'
      CALL SETVS ('104', EXPERR, EXPSIZ)
      ERRSRS = '4'
      CALL ESETUP (USEPRM)

      CALL POPWK (WKID, CONID, WTYPE)
      CALL PQWKC (WKID, ERRIND, CONID, SPECWT)
      CALL CHKINQ ('pqwkc', ERRIND)

      CALL PQPLF (SPECWT, 1, ERRIND, NLTYP1, MXTYPE, IDUM2, RDUM1,
     1            RDUM2, RDUM3, IDUM3)
      CALL CHKINQ ('pqplf', ERRIND)
      DO 50 IX = 1, ABS(NLTYP1)
         CALL PQPLF (SPECWT, IX, ERRIND, IDUM1, THISLT, IDUM2,
     1                  RDUM1, RDUM2, RDUM3, IDUM3)
         CALL CHKINQ ('pqplf', ERRIND)
         IF (THISLT .GT. MXTYPE) MXTYPE = THISLT
50    CONTINUE
      UNTYPE = MXTYPE + 1
C
      CALL PSPLR (WKID, 1, THISLT, .9, 0)
      CALL RSPLR (WKID, 1, UNTYPE,   .5, 1)
      CALL PQPLR (WKID, 1, PSET, ERRIND, LINETY,LINESC,LINECL)
      CALL CHKINQ ('pqplr',ERRIND)
      CALL TSTIGN (STREQ('OO**') .AND. LINETY.EQ.THISLT .AND.
     1             APPEQ(LINESC,.9,0.01,0.01) .AND. LINECL.EQ.0)

      CALL PCLWK (WKID)

      CALL ENDERR

      END