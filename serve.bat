@echo off
cd /d "%~dp0"
if exist _site rmdir /s /q _site
set JEKYLL_NO_BUNDLER_REQUIRE=1
set PATH=C:\Ruby31-x64\bin;%PATH%
jekyll serve --incremental
