# Memory
Simple programs involving reading from and writing to memory in ARM Assembly language.

NOTE: These .s files may require additional files to be built into executable programs. They were designed to work inside a simulation environment of Keil uVision. The usage below is for use within that environment.

SymmetricDifference.s is a simple program which takes the symmetric difference of two sets A and B, placing it into a third set C. I.e. C = A/B U B/A. A is a set of size ASize whose elements are word sized values located in AElems. B is a set of size BSize whose elements are word sized and located in BElems. C's elements are stored in CElems and its size is stored in CSize by the program. With the data provided in the DATA section, CSize should hold #10 after execution, with CElems containing the set {4, 6, 2, 19, 7, 3, 9, 9, 5, 8}. This corresponds to the symmetric difference of A and B.

Countdown.s determines whether one null-terminated string in memory is a substring of another, and stores the result in register R0. Specifically it determines whether the string at cdWord is a substring of the one at cdLetters. R0 stores #1 if it is a substring, #0 otherwise. With the data provided in the DATA section, R0 should store #1 after exection, corresponding to "beets" being a substring of "daetebzsb".

Lotto.s looks at a list of "Lottery tickets" in memory as well as a "Lottery draw". It determines how many tickets have matched 4, 5 and 6 numbers with the draw and stores these values in locations MATCH4, MATCH5 and MATCH6 respectively. COUNT is a word-sized value in memory which should store the number of tickets. TICKETS is a two-dimensional array of bytes representing ticket numbers, stored in row-major order. There are six columns and COUNT rows. Each row represents one ticket, i.e. one ticket contains six bytes. With the data provided in the DATA section, after execution MATCH4 should store 0, MATCH5 should store 0 and MATCH6 should store 1, corresponding to the third ticket in the array having six matches.

USAGE:
- Build and run the programs.
- Look in the relevant areas of memory mentioned in the .s files for each respective output.

KNOWN LIMITATIONS:
- All three programs were tested for reasonable sets in memory and no bugs were found.
