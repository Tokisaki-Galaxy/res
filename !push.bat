@echo off
echo Enter a description of this push(Optional):
set /p d=
git add -A
git commit -m "Des:%d% Upd:%date:~0,4%/%date:~5,2%/%date:~8,2% %time%"
git push||git push||git push