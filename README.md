# Formica di Langton per Commodore 64

Questo repository contiene un'implementazione dell'algoritmo della **Formica di Langton** scritta in BASIC per il computer Commodore 64. Il codice è stato sviluppato con CBM prg Studio.

## Cos'è la Formica di Langton?

La formica di Langton è un automa cellulare bidimensionale con un set di regole molto semplici che porta a un comportamento emergente complesso. La formica si muove su una griglia di celle (caselle bianche o nere) secondo queste due regole:

1.  Se la formica si trova su una casella bianca, gira di 90° a destra, cambia il colore della casella in nero e avanza di una casella.
2.  Se la formica si trova su una casella nera, gira di 90° a sinistra, cambia il colore della casella in bianco e avanza di una casella.

Inizialmente caotico, il percorso della formica finisce per costruire una "strada" ricorrente.

## Come Eseguire il Codice

Per eseguire questo programma, è necessario caricarlo su un emulatore di Commodore 64 (come [VICE](http://vice-emu.sourceforge.net/)) o su un hardware reale (ad esempio tramite una SD2IEC o simile).

Una volta caricato il file `langton.bas`, digitare `RUN` e premere `RETURN`.

### Controlli

-   **F1:** Avvia la simulazione su un campo completamente bianco.
-   **F3:** Avvia la simulazione su un campo con celle colorate casualmente.

## Dettagli del Codice

Il programma è scritto in BASIC per C64 e utilizza `PEEK` e `POKE` per manipolare direttamente la memoria dello schermo e dei colori, ottenendo una buona velocità di esecuzione.

-   **Screen Memory:** `POKE 1024+x+(40*y), 102` per disegnare il carattere della formica (un cerchio nel set di caratteri PETSCII).
-   **Color Memory:** `POKE 55296+x+(40*y), c` per cambiare il colore della cella corrente.
-   **Funzioni `FN`:** Le funzioni `FN RL(M)` e `FN RR(M)` sono usate per calcolare la nuova direzione della formica (rotazione a sinistra e a destra).

