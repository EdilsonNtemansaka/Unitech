@echo off
title Unitech Solution — Servidor Local
color 0B

echo.
echo  ================================
echo    UNITECH SOLUTION
echo    Iniciando servidor local...
echo  ================================
echo.

:: Inicia o servidor Node.js em background
start /B node -e "const http=require('http'),fs=require('fs'),path=require('path');const BASE='%~dp0';http.createServer((req,res)=>{let f=path.join(BASE,req.url==='/'?'index.html':req.url);let ext=path.extname(f);let mime={'html':'text/html','css':'text/css','js':'application/javascript','jpg':'image/jpeg','jpeg':'image/jpeg','png':'image/png','svg':'image/svg+xml','ico':'image/x-icon','webp':'image/webp','woff2':'font/woff2','woff':'font/woff'}[ext.slice(1)]||'application/octet-stream';fs.readFile(f,(e,d)=>{if(e){res.writeHead(404);res.end('Not found')}else{res.writeHead(200,{'Content-Type':mime});res.end(d)}})}).listen(3000,()=>{console.log('Servidor a correr em http://localhost:3000')})"

:: Aguarda 1 segundo para o servidor iniciar
timeout /t 1 /nobreak >nul

:: Abre o navegador
start http://localhost:3000

echo  Servidor a correr em: http://localhost:3000
echo.
echo  Pressiona qualquer tecla para PARAR o servidor...
pause >nul

:: Encerra o processo Node.js
taskkill /F /IM node.exe >nul 2>&1

echo.
echo  Servidor encerrado. Ate logo!
timeout /t 2 /nobreak >nul
