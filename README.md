# Memory
Simple programs involving reading from and writing to memory in ARM Assembly language.

SymmetricDifference.s is a simple program which takes the symmetric difference of two sets A and B, placing it into a third set C. I.e. C = A/B U B/A. A is a set of size ASize whose elements are word sized values located in AElems. B is a set of size BSize whose elements are word sized and located in BElems. C's elements are stored in CElems and its size is stored in CSize by the program.

Countdown.s determines whether one null-terminated string in memory is a substring of another, and stores the result in register R0. Specifically it determines whether the string at cdWord is a substring of the one at cdLetters. R0 stores #1 if it is a substring, #0 otherwise.
