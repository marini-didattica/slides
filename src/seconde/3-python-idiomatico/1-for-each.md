---
layout: cover
---

# Python idiomatico
Il `for each`

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Il punto di partenza

Negli esercizi precedenti avevamo delle regole volutamente povere:

- niente `in`, `sum()`, `max()`, `min()`;
- niente metodi come `.sort()`, `.count()`, `.index()`;
- cicli solo con `for i in range(...)` o `while`;
- accesso agli elementi **solo tramite indice**: `lista[i]`.

Quelle regole servivano per allenare la logica. Ora che la logica c'è, possiamo imparare a scrivere lo **stesso programma** in modo più corto, leggibile e meno soggetto a errori.

> **Idea della lezione** A ogni problema affianchiamo la soluzione "non idiomatica" che conosciamo già e una soluzione "idiomatica" con la sintassi nuova.

---

# Il `for` che conosciamo

Finora per scorrere una lista abbiamo sempre fatto così:

```python
lista = [10, 20, 30]

for i in range(len(lista)):
    print(lista[i])
```

Il ciclo produce gli **indici** `0, 1, 2`; dentro il blocco usiamo `lista[i]` per ottenere il valore.

Funziona, ma stiamo usando un giro di informazione in più: a noi interessano i **valori**, non le posizioni.

---

# Il `for each`

Python permette di scorrere direttamente gli **elementi** di una sequenza:

```python
lista = [10, 20, 30]

for valore in lista:
    print(valore)
```

A ogni giro `valore` assume il contenuto di un elemento: prima `10`, poi `20`, poi `30`.

- Non serve `range()`.
- Non serve `len()`.
- Non serve `lista[i]`.

> **N.B.** `for valore in lista` si legge "per ogni valore in lista". La variabile `valore` è solo un nome: possiamo chiamarla `x`, `voto`, `nome`, come preferiamo.

---

# Confronto diretto

<div class="w-fit mx-auto">

```python
# Con l'indice
for i in range(len(lista)):
    print(lista[i])

# Con il for each
for valore in lista:
    print(valore)
```

</div>

Le due versioni stampano **la stessa cosa**. La seconda dice esattamente quello che vogliamo: *per ogni valore della lista, stampalo*.

> **N.B.** Il `for each` funziona su qualsiasi sequenza: liste, stringhe, e più avanti anche su altri tipi di collezioni.

---

# Esercizio 12 — Il numero è nella lista?

Riprendiamo l'esercizio della ricerca: controlla se il numero `15` è presente nella lista.

| Input                    | Output           |
| ------------------------ | ---------------- |
| `[4, 8, 15, 16, 23, 42]` | `Trovato: True`  |
| `[1, 2, 3]`              | `Trovato: False` |

> **Nota** Nella versione non idiomatica dobbiamo scorrere la lista e mantenere una variabile `trovato`.

---

# Soluzione non idiomatica

```python
lista = [4, 8, 15, 16, 23, 42]
cercato = 15

trovato = False
i = 0
while i < len(lista) and trovato == False:
    if lista[i] == cercato:
        trovato = True
    i = i + 1

print("Trovato:", trovato)
```

Stiamo gestendo **a mano** tre cose: l'indice, la condizione di stop e la variabile booleana. Sono tutti dettagli che non riguardano il problema.

---

# Soluzione idiomatica: l'operatore `in`

```python
lista = [4, 8, 15, 16, 23, 42]
cercato = 15

print("Trovato:", cercato in lista)
```

`x in sequenza` restituisce:

- `True` se `x` compare almeno una volta nella sequenza;
- `False` altrimenti.

Esiste anche la forma negata:

```python
if cercato not in lista:
    print("Non c'è")
```

> **N.B.** `in` funziona anche sulle stringhe: `"a" in "casa"` vale `True`.

---

# Esercizio 6 — Calcolare la media

Data una lista di voti, calcola la media.

| Input            | Output |
| ---------------- | ------ |
| `[7, 4, 9, 6]`   | `6.5`  |

Nella versione non idiomatica sommiamo gli elementi con l'indice e poi dividiamo per `len(voti)`.

---
layout: two-cols-header
---

# Media — non idiomatico vs idiomatico

::left::

### Non idiomatico

```python
voti = [7, 4, 9, 6]

somma = 0
for i in range(len(voti)):
    somma = somma + voti[i]

media = somma / len(voti)
print(media)
```

::right::

### Idiomatico

```python
voti = [7, 4, 9, 6]

somma = 0
for voto in voti:
    somma = somma + voto

media = somma / len(voti)
print(media)
```

::bottom::
L'accumulatore `somma` resta, ma sparisce tutta la gestione dell'indice: il ciclo ora dice *"per ogni voto, aggiungilo alla somma"*.

---

# Bonus: `sum()`

Quando serve sommare tutti gli elementi di una lista, Python ha già una funzione pronta:

```python
voti = [7, 4, 9, 6]

media = sum(voti) / len(voti)
print(media)      # 6.5
```

- `sum(sequenza)` restituisce la somma di tutti gli elementi.
- `len(sequenza)` restituisce il numero di elementi.

Da qui in avanti useremo `sum()` senza reimplementarla: il ciclo con accumulatore resta utile quando la somma non è l'unica operazione da fare.

---

# Esercizio 8 — Massimo e minimo

Trovare il valore più grande e il più piccolo di una lista.

| Input             | Output          |
| ----------------- | --------------- |
| `[3, 7, 2, 9, 5]` | `massimo: 9`<br>`minimo: 2` |

Nella versione non idiomatica partiamo dal primo elemento e aggiorniamo il massimo (e il minimo) durante il ciclo.

---
layout: two-cols-header
---

# Massimo e minimo con il `for each`

::left::

### Non idiomatico

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
for i in range(len(lista)):
    if lista[i] > massimo:
        massimo = lista[i]

print(massimo)
```

::right::

### Idiomatico

```python
lista = [3, 7, 2, 9, 5]

massimo = lista[0]
for valore in lista:
    if valore > massimo:
        massimo = valore

print(massimo)
```

::bottom::
La stessa struttura funziona per il minimo: basta partire da `lista[0]` e usare `<`. Le funzioni `max()` e `min()` arriveranno tra poco e elimineranno anche l'accumulatore.

---

# Quando il `for each` non basta

Il `for each` è comodo quando ci serve **solo il valore** di ogni elemento.

Ma in alcuni problemi l'indice è parte della soluzione:

- dobbiamo **modificare** la lista nella posizione corrente;
- dobbiamo confrontare elementi **vicini**;
- dobbiamo guardare l'elemento "speculare" rispetto alla fine.

In questi casi il `for i in range(...)` **resta superiore**: non è sintassi primitiva, è lo strumento giusto.

---
layout: two-cols-header
---

# Controesempio 1 — inversione in place

Vogliamo invertire la lista **senza crearne una nuova**.

::left::

```python
v = [1, 2, 3, 4, 5]

for i in range(len(v) // 2):
    j = len(v) - 1 - i
    temp = v[i]
    v[i] = v[j]
    v[j] = temp

print(v)   # [5, 4, 3, 2, 1]
```

::right::

Perché serve l'indice:

- dobbiamo scambiare `v[i]` con `v[j]`;
- per scrivere nella lista serve una **posizione**, non solo il valore;
- `for valore in v` ci dà una copia del valore, non la casella da modificare.

> **N.B.** In Python esistono `v.reverse()` e `v[::-1]`, ma l'algoritmo di inversione in place è un ottimo esercizio di logica.

---
layout: two-cols-header
---

# Controesempio 2 — parola palindroma

Una parola è **palindroma** se si legge uguale da sinistra a destra e da destra a sinistra.

::left::

```python
s = "anna"

palindroma = True
for i in range(len(s) // 2):
    if s[i] != s[len(s) - 1 - i]:
        palindroma = False

print(palindroma)   # True
```

::right::

Perché serve l'indice:

- confrontiamo il primo carattere con l'ultimo;
- poi il secondo con il penultimo;
- e così via.

Con `for c in s` avremmo solo un carattere alla volta, senza il suo "specchio" dall'altra parte.

> **Tra poco** vedremo che lo slicing permette di scrivere questo controllo in una riga.

---
layout: two-cols-header
---

# Controesempio 3 — lista crescente

Una lista è **crescente** se ogni elemento è maggiore o uguale al precedente.

::left::

```python
lista = [1, 3, 5, 7]

crescente = True
for i in range(1, len(lista)):
    if lista[i] < lista[i - 1]:
        crescente = False

print(crescente)   # True
```

::right::

Perché serve l'indice:

- ogni elemento va confrontato con il **precedente**;
- il ciclo parte da `1`, così `lista[i - 1]` esiste sempre.

Con il `for each` si può fare tenendo da parte il valore precedente in una variabile, ma il codice diventa meno diretto: qui l'indice descrive meglio il problema.

---

# Riepilogo — `for each`

- `for valore in sequenza:` scorre direttamente i **valori**.
- È la scelta migliore quando l'indice **non serve**.
- Evita `range(len(...))` e `lista[i]`, quindi riduce gli errori.
- `x in sequenza` e `x not in sequenza` controllano l'appartenenza.
- Il `for i in range(...)` resta la scelta giusta per:
  - modificare gli elementi in place;
  - confrontare elementi vicini;
  - accedere a posizioni speculari (palindroma, inversione).

> **N.B.** "Idiomatico" non significa "sempre più corto": significa usare la sintassi che descrive meglio l'operazione.
