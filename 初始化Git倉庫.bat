@echo off
chcp 65001 >nul
title Git 倉庫初始化工具
color 0A

echo ====================================================================
echo                 價格計算器 - Git 倉庫一鍵初始化工具
echo ====================================================================
echo.
echo 此工具將會：
echo 1. 初始化一個本地 Git 倉庫
echo 2. 套用 .gitignore 忽略暫存檔
echo 3. 將 HTML、Excel 範本與啟動器打包提交 (Initial Commit)
echo.
echo 正在檢查 Git 環境...
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [錯誤] 系統未檢測到 Git 安裝，或 Git 未加入環境變數！
    echo --------------------------------------------------------------------
    echo 請先安裝 Git 版本控制軟體：
    echo 💡 官方下載連結: https://git-scm.com/downloads
    echo 💡 或者使用 winget 安裝: winget install --id Git.Git -e
    echo.
    echo 安裝完成後，請重新執行此腳本即可自動完成打包！
    echo --------------------------------------------------------------------
    echo.
    pause
    exit /b 1
)

echo [OK] 檢測到 Git 環境，開始初始化...
echo.

if not exist .git (
    echo 1. 正在初始化 Git 倉庫 (git init)...
    git init
    echo.
) else (
    echo ℹ️  檢測到已存在 Git 倉庫，將直接加入新檔案...
    echo.
)

echo 2. 正在將檔案加入暫存區 (git add .)...
git add .
echo.

echo 3. 正在進行首次提交 (git commit)...
git commit -m "feat: 價格計算器自動讀取 Excel 與雙擊啟動器"
echo.

echo ====================================================================
echo 🎉 恭喜！專案已成功打包並提交至本地 Git 倉庫！
echo ====================================================================
echo.
pause
