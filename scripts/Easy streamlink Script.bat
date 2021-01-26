@ECHO OFF
SET /P URL="Copy your video URL here: "
ECHO.
SET /P NAME="Name of recording here: "
ECHO.
streamlink %URL% best -o %NAME%.ts
PAUSE
EXIT
