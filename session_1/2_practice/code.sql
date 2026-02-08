-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

-- 1. **List all loans**  
-- Show book title, member name, and loan date.
/* SELECT Books.title AS "Book Title", Members.name AS "Member Name", DATE(Loans.loan_date) AS "Loan Date"
FROM Loans LEFT JOIN Books ON Books.id = Loans.book_id
LEFT JOIN Members ON Members.id = Loans.member_id; */


-- 2. **Books and loans**  
-- List all books and any loans associated with them.
/* SELECT Books.title as Books, Loans.loan_date as Loans
FROM Books JOIN Loans ON Books.id = Loans.book_id */

-- 3. **Branches and books**  
-- List all library branches and the books they hold.
/*SELECT LibraryBranch.name as "Library Branches", Books.title as Books
FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id = Books.branch_id*/

-- 4. **Branch book counts**  
-- Show each library branch and the number of books it holds.
/* SELECT LibraryBranch.name, COUNT(Books.id) AS NoOfBooks
FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id = Books.branch_id
GROUP BY LibraryBranch.id, LibraryBranch.name; */

-- 5. **Branches with more than 7 books**  
-- Show branches that hold more than 7 books.
/* SELECT LibraryBranch.name, COUNT(Books.id) as NoOfBooks
FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id = Books.branch_id
GROUP BY LibraryBranch.id, LibraryBranch.name
HAVING NoOfBooks > 7 */

-- 6. **Members and loans**  
-- List all members and the number of loans they have made.
/* SELECT Members.name as Members, COUNT(Loans.id) as NoOfLoans
FROM Members LEFT JOIN Loans ON Members.id=Loans.member_id
GROUP BY Members */

-- 7. **Members who never borrowed**  
-- Identify members who have never borrowed a book.
SELECT Members.name, Loans.loan_date
FROM Members LEFT JOIN Loans ON Members.id = Loans.member_id
WHERE Loans.loan_date IS NULL
-- 8. **Branch loan totals**  
-- For each library branch, show the total number of loans for books in that branch.

-- 9. **Members with active loans**  
-- List members who currently have at least one active loan.

-- 10. **Books and loans report**  
-- Show all books and all loans, including books that were never loaned. Include a column classifying each row as “Loaned book” or “Unloaned book.”. You will need to look up how to do this (hint: a case statement would work).
