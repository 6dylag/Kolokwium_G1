#!/usr/bin/env bash
# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS

# TODO 1: katalog z argumentu albo domyślnie 'dane'.
# TODO 2: if -d; błąd na stderr i exit 2.
# TODO 3: for po *.log; uwzględnij katalog bez plików .log.
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku.
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.
# TODO 6: printf trzy pola oddzielone średnikami.

KATALOG="${1:-dane}"
if [ -d "$KATALOG" ]; then
    echo "katalog istnieje"
else
    echo "ERROR" >&2
fi
for PLIK in $KATALOG/*.log;do
    [ -e "$PLIK" ] || continue
    ILE=$(grep -c "ERROR" "$PLIK")
    WARN_count=$(grep -c "WARN" "$PLIK")
    if [ "$WARN_count" -ge "2" ];then
        STATUS="ALARM"
    else
        STATUS="OK"
    fi
    printf "%s;%s;%s\n" "$PLIK" "$ILE" "$STATUS"
done
