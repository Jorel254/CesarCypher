clear;% LIMPIA VARIABLES
close all; % CIERRA LAS IMAGENES EN USO
alfabet = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "ñ" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"]; %ALFABETO PARA EL CIFRADO CESAR
CountAlpha = 0; % VARIABLE PARA ALMACENAR LA POSICION DEL ALFABETO
temp = ""; %TEMPORAL PARA GUARDAR LOS CARACTERES DE LA CADENA INGRESADA POR EL USUARIO
Tc = ""; % VARIABLE PARA EL TEXTO CIFRADO
opcion = 0; % VARIABLE PARA EL CICLO WHILE
opcion2 = 0; % VARIABLE PARA EL CICLO WHILE INTERNO

while true %WHILE PARA EL MENU DEL PROGRAMA
    clc; %CLC PARA LIMPIAR PANTALLA
    close all; % CIERRA LAS IMAGENES EN USO
    fprintf("1-Cifrar texto\n"); %OPCION DEL MENU
    fprintf("2-Descifrar texto\n"); %OPCION DEL MENU
    fprintf("3-Salir\n"); %OPCION DEL MENU
    opcion = input("Ingresa tu opcion: \n "); %CAPTURA DE LA OPCION DEL MENU

    switch (opcion) %SWITCH PARA LAS OPCIONES DEL MENU
        case 1
                        Tc = ""; %LIMPIAR VARIABLE
                        Tp = input("Ingresa  la cadena a cifrar: \n ", 's'); % CONSULTA AL USUARIO PARA LA OBTENER EL TEXTO PLANO
                        Key = input('Ingresa tu llave \n '); % CONSULTA AL USUARIO PARA EL TAMAÑO DE LA LLAVE
                        Tp = lower(Tp); % CONVERSION DE LA CADENA EN MINUSCULAS
                        Tp = strrep(strrep(strrep(strrep(strrep(Tp, "á", "a"), "é", "e"), "í", "i"), "ó", "o"), "ú", "u"); % USO DEL METODO STRREP PARA REMPLAZAR LAS VOCALES CON ACENTO
                        Tp = strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(Tp, "0", "cero"), "1", "uno"), "2", "dos"), "3", "tres"), "4", "cuatro"), "5", "cinco"), "6", "seis"), "7", "siete"), "8", "ocho"), "9", "nueve"); % USO DEL METODO STRREP PARA REMPLAZAR NUMERO PARA SU CONTRA PARTE ALFABETICA
                        Tp = strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(Tp, "!", ""), "¡", ""), "?", ""), "¿", ""), "(", ""), ")", ""), ";", ""), ",", ""), ".", ""), ":", ""), "-", ""), "_", ""), "<", ""), ">", ""), "..", ""), "...", ""), "/", ""), "}", ""), "{", ""), "[", ""), "]", ""), "+", ""), "*", ""), "$", ""), "%", ""), "&", ""), "=", ""), "|", ""); % USO DEL METODO STRREP PARA REMPLAZAR SIGNOS
                        Tp = strtrim(Tp); %LIMPIAR ESPACIOS AL INICIO Y AL FINAL
                        a = Tp.strlength; % VARIABLE PARA ALMACENAR EL TAMAÑO DEL TEXTO PLANO
                        for index = 1:a % CICLO FOR PARA CIFRAR EL TEXTO PLANO CON CON UN RANGO DE 1 AL TAMAÑO DEL TEXTO PLANO
                            temp = strcat(temp, Tp.extract(index)); % SUSTRACCION DE CARACTERES DEL TEXTO PLANO POR POSICION
                            if find(alfabet == temp) % IF PARA VALIDAR QUE EL CARACTER ESTE EN EL ALFABETO
                                CountAlpha = find(alfabet == temp); % BUSQUEDA DEL CARACTER EN EL ALFABETO PARA GUARDAR SU INDICE
                                newindex = CountAlpha + Key; % VARIABLE PARA ASIGNAR EL NUEVO INDICE SEGUN EL CIFRADO CESAR ES IGUAL A LA POSICION ACTUAL DEL CARACTER MÁS LA LLAVE
                                if newindex > length(alfabet) %IF PARA VALIDAR SI EL TAMAÑO DEL NUEVO INDICE ES MAYOR AL TAMAÑO DEL ALFABETO SI ES ASI ENTRE AL IF
                                    newindex = mod(newindex, length(alfabet)); % SI EL NUEVO INDICE ES MAYOR SE APLICA EL MODULO DEL INDICE CON RESPECTO AL TAMAÑO DEL ALFABETO PARA OBTENER LA NUEVA POSICION
                                    if newindex == 0 % SI EL NUEVO INDICE ES CERO AIGNA EL TAMAÑO DEL ALFABETO
                                        newindex = length(alfabet); % SE LE ASIGNA AL NUEVO INDICE EL TAMAÑO DEL ALFABETO
                                    end % FIN DEL IF
                                end % FIN DEL IF
                                    Tc = strcat(Tc, strrep(temp, alfabet(CountAlpha), alfabet(newindex))); %SE REMPLAZA EL CARACTER ANTERIOR CON EL NUEVO Y SE CONCATENA PARA OBTENER EL TEXTO CIFRADO
                            end % FIN DEL IF
                                    temp = ""; % SE RESETEA LA VARIABLE TEMPORAL
                        end % FIN DEL FOR
                        disp("EL texto cifrado es: " + Tc); % SE IMPRIME EL TEXTO CIFRADO
                        pause(5); %PAUSA PARA MOSTRAR EN PANTALLA EL RESULTADO
                        Tp = ""; %LIMPIAR VARIABLE
        case 2
                        while true %WHILE PARA EL MENU DEL DESCIFRADO
                            clc; %CLC PARA LIMPIAR PANTALLA
                            fprintf("1-Descifrar el texto anterior\n"); %OPCION DEL MENU
                            fprintf("2-Descifrar nuevo texto\n"); %OPCION DEL MENU
                            fprintf("3-Salir\n"); %OPCION DEL MENU
                            opcion2 = input("Ingresa tu opcion: \n "); %CAPTURA DE LA OPCION DEL MENU
                            switch opcion2 %SWITCH PARA LAS OPCIONES DEL MENU
                                case 1
                                    Tp = ""; %LIMPIAR VARIABLE
                                    a = Tc.strlength; % VARIABLE PARA ALMACENAR EL TAMAÑO DEL TEXTO PLANO
                                    for index = 1:a % CICLO FOR PARA CIFRAR EL TEXTO PLANO CON CON UN RANGO DE 1 AL TAMAÑO DEL TEXTO PLANO
                                        temp = strcat(temp, Tc.extract(index)); % SUSTRACCION DE CARACTERES DEL TEXTO PLANO POR POSICION
                                        if find(alfabet == temp) % IF PARA VALIDAR QUE EL CARACTER ESTE EN EL ALFABETO
                                            CountAlpha = find(alfabet == temp); % BUSQUEDA DEL CARACTER EN EL ALFABETO PARA GUARDAR SU INDICE
                                            newindex = CountAlpha - Key; % VARIABLE PARA ASIGNAR EL NUEVO INDICE SEGUN EL CIFRADO CESAR ES IGUAL A LA POSICION ACTUAL DEL CARACTER MENOS LA LLAVE
                                            if newindex < 1 %IF PARA VALIDAR SI EL TAMAÑO DEL NUEVO INDICE ES MENOR A 1 SI ES ASI ENTRA AL IF
                                                newindex = mod(newindex, length(alfabet)); % SI EL NUEVO INDICE ES MENOR SE APLICA EL MODULO DEL INDICE CON RESPECTO AL TAMAÑO DEL ALFABETO PARA OBTENER LA NUEVA POSICION
                                                if newindex == 0 % SI EL NUEVO INDICE ES CERO AIGNA EL TAMAÑO DEL ALFABETO
                                                    newindex = length(alfabet); % SE LE ASIGNA AL NUEVO INDICE EL TAMAÑO DEL ALFABETO
                                                end % FIN DEL IF
                                            end % FIN DEL IF
                                                Tp = strcat(Tp, strrep(temp, alfabet(CountAlpha), alfabet(newindex))); %SE REMPLAZA EL CARACTER ANTERIOR CON EL NUEVO Y SE CONCATENA PARA OBTENER EL TEXTO CIFRADO
                                        end % FIN DEL IF
                                                temp = ""; % SE RESETEA LA VARIABLE TEMPORAL
                                    end % FIN DEL FOR
                                                disp("EL texto descifrado es: " + Tp); % SE IMPRIME EL TEXTO CIFRADO
                                                pause(5); %PAUSA PARA MOSTRAR EN PANTALLA EL RESULTADO
                                case 2
                                        Tp = ""; %LIMPIAR VARIABLE
                                        Tc = input("Ingresa la cadena a descifrar: \n ", 's'); % CONSULTA AL USUARIO PARA LA OBTENER EL TEXTO PLANO
                                        Key = input('Ingresa tu llave \n '); % CONSULTA AL USUARIO PARA EL TAMAÑO DE LA LLAVE
                                        Tc = lower(Tc); % CONVERSION DE LA CADENA EN MINUSCULAS
                                        Tc = strrep(strrep(strrep(strrep(strrep(Tc, "á", "a"), "é", "e"), "í", "i"), "ó", "o"), "ú", "u"); % USO DEL METODO STRREP PARA REMPLAZAR LAS VOCALES CON ACENTO
                                        Tc = strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(Tc, "0", "cero"), "1", "uno"), "2", "dos"), "3", "tres"), "4", "cuatro"), "5", "cinco"), "6", "seis"), "7", "siete"), "8", "ocho"), "9", "nueve"); % USO DEL METODO STRREP PARA REMPLAZAR NUMERO PARA SU CONTRA PARTE ALFABETICA
                                        Tc = strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(Tc, "!", ""), "¡", ""), "?", ""), "¿", ""), "(", ""), ")", ""), ";", ""), ",", ""), ".", ""), ":", ""), "-", ""), "_", ""), "<", ""), ">", ""), "..", ""), "...", ""), "/", ""), "}", ""), "{", ""), "[", ""), "]", ""), "+", ""), "*", ""), "$", ""), "%", ""), "&", ""), "=", ""), "|", ""); % USO DEL METODO STRREP PARA REMPLAZAR SIGNOS
                                        Tc = strtrim(Tc); %LIMPIAR ESPACIOS AL INICIO Y AL FINAL
                                        a = Tc.strlength; % VARIABLE PARA ALMACENAR EL TAMAÑO DEL TEXTO PLANO
                                            for index = 1:a % CICLO FOR PARA CIFRAR EL TEXTO PLANO CON CON UN RANGO DE 1 AL TAMAÑO DEL TEXTO PLANO
                                                temp = strcat(temp, Tc.extract(index)); % SUSTRACCION DE CARACTERES DEL TEXTO PLANO POR POSICION
                                                if find(alfabet == temp) % IF PARA VALIDAR QUE EL CARACTER ESTE EN EL ALFABETO
                                                    CountAlpha = find(alfabet == temp); % BUSQUEDA DEL CARACTER EN EL ALFABETO PARA GUARDAR SU INDICE
                                                    newindex = CountAlpha - Key; % VARIABLE PARA ASIGNAR EL NUEVO INDICE SEGUN EL CIFRADO CESAR ES IGUAL A LA POSICION ACTUAL DEL CARACTER MENOS LA LLAVE
                                                    if newindex < 1 %IF PARA VALIDAR SI EL TAMAÑO DEL NUEVO INDICE ES MENOR A 1 SI ES ASI ENTRA AL IF
                                                        newindex = mod(newindex, length(alfabet)); % SI EL NUEVO INDICE ES MENOR SE APLICA EL MODULO DEL INDICE CON RESPECTO AL TAMAÑO DEL ALFABETO PARA OBTENER LA NUEVA POSICION
                                                        if newindex == 0 % SI EL NUEVO INDICE ES CERO AIGNA EL TAMAÑO DEL ALFABETO
                                                            newindex = length(alfabet); % SE LE ASIGNA AL NUEVO INDICE EL TAMAÑO DEL ALFABETO
                                                        end % FIN DEL IF
                                                    end % FIN DEL IF
                                                        Tp = strcat(Tp, strrep(temp, alfabet(CountAlpha), alfabet(newindex))); %SE REMPLAZA EL CARACTER ANTERIOR CON EL NUEVO Y SE CONCATENA PARA OBTENER EL TEXTO CIFRADO
                                                end % FIN DEL IF
                                                        temp = ""; % SE RESETEA LA VARIABLE TEMPORAL
                                            end % FIN DEL FOR
                                            disp("EL texto descifrado es: " + Tp); % SE IMPRIME EL TEXTO CIFRADO
                                            pause(5); %PAUSA PARA MOSTRAR EN PANTALLA EL RESULTADO
                                otherwise
                                    disp('Opcion no reconocida') %MENSAJE DE OPCION NO VALIDA
                            end % FIN DEL SWITCH
                            if opcion2 == 3
                            break; % BREAK PARA SALIR DEL WHILE
                            end % FIN DEL IF
                        end % FIN DEL WHILE
        case 3
            disp('Adios');
            pause(3); %PAUSA PARA MOSTRAR EN PANTALLA EL RESULTADO
        otherwise
            disp('Opcion no reconocida') %MENSAJE DE OPCION NO VALIDA
    end % FIN DEL SWITCH
        if opcion == 3 %IF PARA TERMINAR EL PROGRAMA
            clear;% LIMPIA VARIABLES
            close all; % CIERRA LAS IMAGENES EN USO
            break % BREAK PARA SALIR DEL WHILE
        end % FIN DEL IF
end % FIN DEL WHILE
