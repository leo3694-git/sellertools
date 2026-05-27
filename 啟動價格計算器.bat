@echo off
chcp 65001 >nul
title 速賣通價格計算器啟動器
color 0B

echo ====================================================================
echo             速賣通價格計算與運費試算系統 - 本地服務啟動器
echo ====================================================================
echo.
echo 💡 提示：此啟動器會建立微型網頁伺服器，讓網頁完美自動讀取 Excel，免手動上傳。
echo.
echo 正在檢查您電腦的環境...
echo.

:: 1. Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] 檢測到 Node.js 環境。
    echo 🚀 正在使用 npx serve 啟動本地伺服器...
    echo.
    echo -------------------------------------------------------------
    echo 本地網址: http://localhost:8080/ali_pricing_tool.html
    echo (請保持此視窗開啟以進行讀取。使用完畢後，直接關閉此視窗即可)
    echo -------------------------------------------------------------
    echo.
    start http://localhost:8080/ali_pricing_tool.html
    npx -y serve -l 8080 .
    goto end
)

:: 2. Check if Python is installed
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] 檢測到 Python 環境。
    echo 🚀 正在使用 Python http.server 啟動本地伺服器...
    echo.
    echo -------------------------------------------------------------
    echo 本地網址: http://localhost:8080/ali_pricing_tool.html
    echo (請保持此視窗開啟以進行讀取。使用完畢後，直接關閉此視窗即可)
    echo -------------------------------------------------------------
    echo.
    start http://localhost:8080/ali_pricing_tool.html
    python -m http.server 8080
    goto end
)

:: 3. Fallback: No server environment
color 0C
echo ⚠️  警告：未檢測到 Node.js 或 Python 運作環境！
echo --------------------------------------------------------------------
echo 由於瀏覽器的隱私安全性限制 (CORS)，直接點擊 HTML 網頁將無法「自動讀取」Excel。
echo 建議您安裝 Node.js (https://nodejs.org/)，便可享受完美的一鍵自動加載！
echo --------------------------------------------------------------------
echo.
echo 沒關係！我們現在將以傳統「手動拖放上傳」模式為您開啟網頁。
echo 您可以直接把 Excel 拖曳進網頁中計算。
echo.
echo 按任意鍵將直接為您打開 HTML 網頁...
pause >nul
start ali_pricing_tool.html

:end
