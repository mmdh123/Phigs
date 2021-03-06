      SUBROUTINE E03114 (USEPRM)

C   E03114 tests the handling of error 114

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

C   relative input priority
      INTEGER     PHIGHR,    PLOWER
      PARAMETER  (PHIGHR=0,  PLOWER=1)

C  clipping indicator
      INTEGER     PNCLIP,    PCLIP
      PARAMETER  (PNCLIP=0,  PCLIP=1)

      INTEGER   USEPRM, ISIZ, SIZB4,SIZAFT, IDUM1
      REAL      ROTMAT(3,3), MAPMAT(3,3), LIMIT(4)
      LOGICAL   STREQ, STRCON

      CURCON = 'the view index value is less than zero'
      CALL SETVS ('114', EXPERR, EXPSIZ)
      ERRSRS = '13'
      CALL ESETUP (USEPRM)

      CALL POPST (101)
      CALL PLB   (801)
      CALL RSVWI (-1)
      CALL TSTIGN (STREQ('O*O*') .AND. STRCON(101, '67,801'))

      CALL PCLST

      CALL POPWK (WKID, CONID, WTYPE)

      CALL IDMAT (3, ROTMAT)
      CALL IDMAT (3, MAPMAT)
      CALL SETRVS ('0.,0.5,0.,0.5', LIMIT, ISIZ)
      CALL PSVWR (WKID, 2, ROTMAT, MAPMAT, LIMIT, PCLIP)
      CALL PQEVWI (WKID, 0, ERRIND, SIZB4, IDUM1)
      CALL CHKINQ ('pqevwi', ERRIND)

      CALL RSVTIP (WKID, -1, 2, PLOWER)
      CALL PQEVWI (WKID, 0, ERRIND, SIZAFT, IDUM1)
      CALL CHKINQ ('pqevwi', ERRIND)
      CALL TSTIGN (STREQ('OO**') .AND. SIZB4.EQ.SIZAFT)

      CALL PCLWK (WKID)

      CALL ENDERR

      END
