C
C  This file is part of MUMPS 5.1.1, released
C  on Mon Mar 20 14:34:33 UTC 2017
C
C
C  Copyright 1991-2017 CERFACS, CNRS, ENS Lyon, INP Toulouse, Inria,
C  University of Bordeaux.
C
C  This version of MUMPS is provided to you free of charge. It is
C  released under the CeCILL-C license:
C  http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html
C
      INTEGER FUNCTION ZMUMPS_IXAMAX(N,X,INCX)
      COMPLEX(kind=8) X(*)
      DOUBLE PRECISION ABSMAX
      INTEGER I,IX
      INTEGER INCX,N
      ZMUMPS_IXAMAX = 0
      IF ( N.LT.1 ) RETURN
      ZMUMPS_IXAMAX = 1
      IF ( N.EQ.1 .OR. INCX.LE.0 ) RETURN
      IF ( INCX.EQ.1 ) THEN
        ABSMAX = abs(X(1))
        DO I = 2, N
          IF ( abs(X(I)) .LE. ABSMAX ) CYCLE
          ZMUMPS_IXAMAX = I
          ABSMAX = abs(X(I))
        ENDDO
      ELSE
        IX = 1
        ABSMAX = abs(X(1))
        IX = IX + INCX
        DO I = 2, N
           IF ( abs(X(IX)).LE.ABSMAX ) GOTO 5
           ZMUMPS_IXAMAX = I
           ABSMAX = abs(X(IX))
   5       IX = IX + INCX
        ENDDO
      ENDIF
      RETURN
      END FUNCTION ZMUMPS_IXAMAX
