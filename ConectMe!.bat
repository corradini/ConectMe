@echo off
color 0b
title Conect Me! v1.1

echo.
echo    .  *             . *    .            .      *      .
echo               .                     *             . 
echo   .     *     .            .    *         .             .
echo     .             *           .       .        .
echo   *      . ---------------------------------           .
echo    .     * -------- Conect Me! v1.1 --------     .
echo        .   ---------------------------------      * 
echo     .             *           .       .        .    .  *  
echo        *     .            .    *         .           .
echo          .     .                     *             .     
echo     .             *  .        .          .             
echo   *      .        . *    .            .      .       .
echo.
echo            Obrigado por usar nosso Software!
echo            Pressione ENTER para se conectar!
pause>nul
del /q /a: -h log.txt st.txt
del /q log.txt st.txt

cls
color 0e
echo.
echo        Reconectando, aguarde...
echo.
echo   [--] Resetando IPs
echo   [--] Reiniciando IPs
echo   [--] Depurando Cache DNS
echo   [--] Atualizando todas as concessoes DHCP e
echo        registrando novamente nomes DNS
ipconfig /release >nul
ping -n 2 localhost >nul
cls

echo.
echo        Reconectando, aguarde...
echo.
echo   [OK] Resetando IPs
echo   [--] Reiniciando IPs
echo   [--] Depurando Cache DNS
echo   [--] Atualizando todas as concessoes DHCP e
echo        registrando novamente nomes DNS
ipconfig /renew >nul
cls

echo.
echo        Reconectando, aguarde...
echo.
echo   [OK] Resetando IPs
echo   [OK] Reiniciando IPs
echo   [--] Depurando Cache DNS
echo   [--] Atualizando todas as concessoes DHCP e
echo        registrando novamente nomes DNS
ipconfig /flushdns >nul
cls

echo.
echo        Reconectando, aguarde...
echo.
echo   [OK] Resetando IPs
echo   [OK] Reiniciando IPs
echo   [OK] Depurando Cache DNS
echo   [--] Atualizando todas as concessoes DHCP e
echo        registrando novamente nomes DNS
ping -n 2 localhost >nul
ipconfig /registerdns >nul
cls

color 0a
echo.
echo        Reconectando, aguarde...
echo.
echo   [OK] Resetando IPs
echo   [OK] Reiniciando IPs
echo   [OK] Depurando Cache DNS
echo   [OK] Atualizando todas as concessoes DHCP e
echo        registrando novamente nomes DNS
ping -n 2 localhost >nul
cls

color 0e
echo.
echo   Verificando, aguarde...
ping -n 1 localhost >nul
ping google.com > log.txt
attrib +h +s log.txt
ping -n 1 localhost >nul
findstr /l /i /m /c:"ms" log.txt > st.txt
attrib +h st.txt
cls
set /p ENCONTRADO= < st.txt
IF "%ENCONTRADO%"=="log.txt" (
color 0a
echo.
echo   Conexao estabelecida com Sucesso!
echo.
echo   Status:
echo   Internet [CONECTADA]
echo.
echo   Pressione ENTER para sair
attrib -h -s log.txt
attrib -h -s st.txt
del /q /a:-H log.txt st.txt
pause>nul
goto clear

exit
)

IF "%ENCONTRADO%" NEQ "log.txt" (
color 0e
echo.
echo   IPs atualizados com Sucesso
echo   1 erro encontrado.
echo.
echo   Status:
echo   Internet [DESCONECTADA]
echo.
echo   Verifique os cabos e modem e execute 
echo   novamente o programa. Se o problema 
echo   nao for solucionado entre em contato
echo   com o Administrador do Sistema.
echo.
echo   Pressione ENTER para sair
attrib -h -s log.txt
attrib -h -s st.txt
del /q /a:-H log.txt st.txt
pause>nul
goto clear

:clear
del /q /a: -h log.txt st.txt
del /q log.txt st.txt
cls
exit
)
exit