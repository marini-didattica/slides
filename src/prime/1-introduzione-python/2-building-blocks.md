---
layout: cover
---

# I mattoncini di costruzione

### Le tre cose con cui scriveremo ogni programma

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>


---

# Sempre gli stessi tre mattoni

Ogni programma che scriveremo userà solo **tre mattoni**:

- **Variabili** → immagazzinano dati;
- **Cicli (`while`)** → ripetono istruzioni;
- **`if` / `elif` / `else`** → decidono cosa eseguire.

A questi si aggiunge **`print()`**, la "voce" del programma: senza di lei il risultato non si vede.

> **N.B.** Anche il programma più complicato è una combinazione di questi mattoni.

---

# Variabili

Una **variabile** è un nome che fa riferimento a un valore: una "scatola" etichettata in cui mettiamo un dato per riutilizzarlo.

```python
eta = 36      # crea la variabile
nome = "Ada"
eta = 37      # aggiorna: ora eta vale 37
```

- `eta` e `nome` sono i **nomi**;
- `36` e `"Ada"` sono i **valori**;
- con `=` si **assegna**: da quel momento il nome vale quel valore;
- il valore può **cambiare**: `eta` è passata da `36` a `37`.

> **N.B.** I valori hanno un **tipo**; Python lo deduce da solo.

---
layout: two-cols-header
---

# Inizializziamo, poi aggiorniamo

::left::
### Inizializzazione
La **prima** volta che il nome compare: creiamo la variabile e le diamo un valore.

```python
x = 2
```

::right::
### Aggiornamento
Le volte successive: **sostituiamo** il vecchio valore.

```python
x = 13
```

::bottom::
> **N.B.** `=` non significa "è uguale a": significa "**metti dentro**". E una variabile va **inizializzata prima di usarla**, altrimenti `NameError`.

---

# Una variabile speciale: la lista

Una **lista** è una **variabile** che contiene **più valori**, tenuti **in ordine**.

```python
voti = [7, 4, 9]   # tre elementi
vuota = []         # nessun elemento
```

- le **parentesi quadre** `[ ]` racchiudono i valori;
- i valori sono separati da una **virgola**;
- l'**ordine** conta: `[7, 4, 9]` non è la stessa lista di `[9, 4, 7]`;
- una lista senza elementi si scrive `[ ]`.

> **N.B.** Una variabile normale contiene **un solo** valore; una lista ne contiene **molti**, tutti dentro un unico nome.

---

# Accedere agli elementi

Ogni elemento ha una **posizione** (detta **indice**), che parte da **0**.

```python
voti = [7, 4, 9]
print(voti[0])     # 7
print(voti[1])     # 4
print(voti[2])     # 9
```

- si accede con **nome + indice tra quadre**: `voti[0]`;
- il **primo** elemento è `voti[0]`, l'**ultimo** è `voti[len(voti) - 1]`;
- `len(voti)` restituisce **quanti** elementi ci sono (`3`);
- un elemento si può anche **cambiare**: `voti[1] = 5`.

> **N.B.** Le posizioni valide vanno da `0` a `len(voti) - 1`: chiedere `voti[3]` causa un `IndexError`.

---
class: table-sm
---

# I metodi principali delle liste

| Metodo               | Cosa fa                                |
| -------------------- | -------------------------------------- |
| `lista.append(x)`    | aggiunge `x` **in fondo**              |
| `lista.insert(i, x)` | inserisce `x` nella posizione `i`      |
| `lista.remove(x)`    | elimina la **prima** occorrenza di `x` |
| `lista.pop(i)`       | elimina l'elemento in posizione `i`    |
| `lista.sort()`       | ordina dal più piccolo al più grande   |
| `lista.reverse()`    | inverte l'ordine degli elementi        |

```python
voti = [7, 4, 9]
voti.append(6)     # [7, 4, 9, 6]
```

> **N.B.** `len(voti)` è una **funzione**; `voti.append(6)` è un **metodo** (col **punto**).

---

# `print()`: la voce del programma

`print()` **mostra a schermo** il valore che le passi tra parentesi.

```python
print("Ciao")        # Ciao
print(7 + 3)         # 10
print("x =", 5)      # x = 5
```

- puoi passarle più cose separate da **virgola**: vengono stampate una dopo l'altra;
- se le passi un'**espressione**, stampa il **risultato** (`7 + 3` → `10`).

> **N.B.** `input()` è il fratello di `print()`: chiede un dato all'utente. Lo incontreremo più avanti.

---

# Il ciclo `while`

Un **ciclo** ripete un **blocco** di istruzioni. `while` ripete **finché** una condizione è vera.

```python
i = 0
while i < 3:
    print(i)
    i = i + 1
```

- `i = 0` → **prima** del ciclo: inizializza la variabile di controllo;
- `while i < 3:` → **condizione**, controllata prima di ogni giro;
- le righe indentate sono il **corpo** del ciclo;
- `i = i + 1` → **aggiorna** la variabile: senza, il ciclo non termina mai.

> **N.B.** Se la condizione non diventa mai falsa si ha il **ciclo infinito**: il programma non finisce più.

---
class: table-sm
---

# Un ciclo, passo passo

```python
i = 0
while i < 3:
    print(i)
    i = i + 1
print("fine")
```

| Controllo `i < 3` | Corpo eseguito   | `i` dopo |
| ----------------- | ---------------- | -------- |
| `0 < 3` vero      | stampa `0`       | `1`      |
| `1 < 3` vero      | stampa `1`       | `2`      |
| `2 < 3` vero      | stampa `2`       | `3`      |
| `3 < 3` falso     | — esci dal ciclo | `3`      |

> **N.B.** Output: `0` `1` `2` `fine`. Il corpo viene eseguito **3 volte**; la condizione è controllata **4 volte**: l'ultima fallisce e fa uscire dal ciclo.

---

# `if` / `elif` / `else`

Servono a eseguire un blocco **solo se** una condizione è vera.

```python
voto = 7
if voto >= 9:
    print("Ottimo")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

- `if condizione:` → primo controllo, **obbligatorio**;
- `elif condizione:` → controlli successivi, solo se i precedenti erano falsi;
- `else:` → **nessuna condizione**, è l'ultima alternativa e può mancare;
- di tutta la catena viene eseguito **un solo blocco**.

---
class: table-sm
---

# Le condizioni che useremo

Una **condizione** confronta valori e produce `True` o `False`.

| Confronto  | Significato              | Esempio  | Risultato |
| ---------  | ------------------------ | -------- | --------- |
| `==`       | uguale                   | `5 == 5` | `True`    |
| `!=`       | diverso                  | `5 != 5` | `False`   |
| `<` , `>`  | minore / maggiore        | `5 > 3`  | `True`    |
| `<=` , `>=`| minore/maggiore o uguale | `5 >= 6` | `False`   |

Per combinarne più di una: `and` (entrambe vere), `or` (almeno una vera), `not` (nega).

```python
if voto >= 6 and voto <= 10:
    print("Voto valido e sufficiente")
```

> **N.B.** `=` **assegna**, `==` **confronta**: `if x = 5:` è un errore di sintassi.

---

# Bonus: i commenti

Un **commento** inizia con `#`: da lì in poi Python **ignora** tutto.

```python
# Calcola l'area del rettangolo
base = 4
altezza = 3
area = base * altezza     # risultato
print(area)
```

- servono a spiegare **a un umano** cosa fa il codice (a te, tra una settimana);
- non cambiano l'esecuzione: sono uno dei posti "liberi";
- **non** si usa il commento per nascondere codice confuso.

> **N.B.** Un commento non salva un codice scritto male: prima si scrive chiaro, poi semmai si commenta.

---

# I mattoni, in breve

- **Variabili**: `nome = valore`; si inizializzano e si aggiornano.
- **`print()`**: mostra il risultato.
- **`while condizione:`**: ripete un blocco finché la condizione è vera.
- **`if` / `elif` / `else`**: esegue **un solo** blocco in base alle condizioni.
- **Commenti**: `#` per spiegare a un umano.

> **N.B.** Ogni blocco è identificato dall'**indentazione** e introdotto dai **due punti** `:`.
