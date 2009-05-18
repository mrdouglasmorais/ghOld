      ******************************************************************
      * EMPLIST - Simple employee listing program                      *
      * Prints a fixed roster of employees to SYSOUT.                  *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLIST.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-EMPLOYEE-TABLE.
           05  WS-EMP OCCURS 5 TIMES.
               10  WS-EMP-ID       PIC 9(4).
               10  WS-EMP-NAME     PIC X(20).
               10  WS-EMP-DEPT     PIC X(12).
               10  WS-EMP-SALARY   PIC 9(7)V99.

       01  WS-INDEX                PIC 9(2) VALUE 1.
       01  WS-HEADER.
           05  FILLER              PIC X(4)  VALUE "ID  ".
           05  FILLER              PIC X(20) VALUE "NAME                ".
           05  FILLER              PIC X(12) VALUE "DEPARTMENT  ".
           05  FILLER              PIC X(12) VALUE "      SALARY".
       01  WS-LINE.
           05  WS-OUT-ID           PIC 9(4).
           05  FILLER              PIC X     VALUE SPACE.
           05  WS-OUT-NAME         PIC X(20).
           05  FILLER              PIC X     VALUE SPACE.
           05  WS-OUT-DEPT         PIC X(12).
           05  FILLER              PIC X     VALUE SPACE.
           05  WS-OUT-SALARY       PIC ZZZ,ZZZ.99.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM LOAD-EMPLOYEES
           PERFORM PRINT-HEADER
           PERFORM PRINT-EMPLOYEES
               VARYING WS-INDEX FROM 1 BY 1
               UNTIL WS-INDEX > 5
           PERFORM PRINT-FOOTER
           STOP RUN.

       LOAD-EMPLOYEES.
           MOVE 1001 TO WS-EMP-ID(1)
           MOVE "ANA SILVA" TO WS-EMP-NAME(1)
           MOVE "FINANCE" TO WS-EMP-DEPT(1)
           MOVE 3500.00 TO WS-EMP-SALARY(1)

           MOVE 1002 TO WS-EMP-ID(2)
           MOVE "BRUNO COSTA" TO WS-EMP-NAME(2)
           MOVE "IT" TO WS-EMP-DEPT(2)
           MOVE 4200.50 TO WS-EMP-SALARY(2)

           MOVE 1003 TO WS-EMP-ID(3)
           MOVE "CARLA SOUZA" TO WS-EMP-NAME(3)
           MOVE "HR" TO WS-EMP-DEPT(3)
           MOVE 3100.00 TO WS-EMP-SALARY(3)

           MOVE 1004 TO WS-EMP-ID(4)
           MOVE "DIEGO ALVES" TO WS-EMP-NAME(4)
           MOVE "SALES" TO WS-EMP-DEPT(4)
           MOVE 2800.75 TO WS-EMP-SALARY(4)

           MOVE 1005 TO WS-EMP-ID(5)
           MOVE "ELENA ROCHA" TO WS-EMP-NAME(5)
           MOVE "IT" TO WS-EMP-DEPT(5)
           MOVE 5100.00 TO WS-EMP-SALARY(5).

       PRINT-HEADER.
           DISPLAY "========================================"
           DISPLAY "       EMPLOYEE LISTING - EMPLIST"
           DISPLAY "========================================"
           DISPLAY WS-HEADER
           DISPLAY "---- -------------------- ------------ ------------".

       PRINT-EMPLOYEES.
           MOVE WS-EMP-ID(WS-INDEX) TO WS-OUT-ID
           MOVE WS-EMP-NAME(WS-INDEX) TO WS-OUT-NAME
           MOVE WS-EMP-DEPT(WS-INDEX) TO WS-OUT-DEPT
           MOVE WS-EMP-SALARY(WS-INDEX) TO WS-OUT-SALARY
           DISPLAY WS-LINE.

       PRINT-FOOTER.
           DISPLAY "========================================"
           DISPLAY " TOTAL EMPLOYEES: 5"
           DISPLAY "========================================".
