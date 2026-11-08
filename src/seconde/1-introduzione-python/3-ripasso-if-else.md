---
layout: cover
---

# Ripasso - if / else
Decidere cosa eseguire

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Perché serve una condizione

Finora il programma esegue le istruzioni **dall'alto verso il basso**, una dopo l'altra, sempre tutte.

Ma spesso vogliamo eseguire un pezzo di codice **solo se** succede qualcosa:

- se il voto è almeno 6 → promosso, altrimenti bocciato
- se la password è giusta → entra, altrimenti mostra un errore

Le istruzioni `if` / `elif` / `else` servono a questo: scegliere **quale blocco** di codice eseguire in base a una **condizione**.

> **N.B.** Viene eseguito **un solo** blocco tra quelli della catena, oppure nessuno (se non c'è `else` e nessuna condizione è vera).

---

# La condizione

Una **condizione** è un'espressione che, una volta valutata, vale `True` o `False`.

```python
voto = 7
print(voto >= 6)    # True
print(voto == 10)   # False
```

Qualsiasi espressione che produce un booleano va bene:

- un **confronto**: `voto >= 6`
- un **operatore logico**: `voto >= 6 and voto <= 10`
- un **valore diretto**: `if nome:` → dipende da cosa Python considera "vero" o "falso" (lo vediamo tra poco)

---

# Sintassi di base: `if`

```python
if condizione:
    istruzione_1
    istruzione_2
```

Analizziamo pezzo per pezzo — **nulla è opzionale**:

1. `if` è la parola chiave, sempre in minuscolo.
2. `condizione` è l'espressione da valutare. **Non** serve racchiuderla tra parentesi.
3. `:` i **due punti** chiudono la riga e dicono "qui inizia il blocco".
4. Le righe seguenti sono **indentate** (di norma 4 spazi): formano il **blocco** che viene eseguito solo se la condizione è `True`.

> **N.B.** In Python l'indentazione **non è estetica**: fa parte della sintassi. Non esistono le graffe `{ }` come in altri linguaggi.

---

# Cosa entra nel blocco

```python
voto = 7
if voto >= 6:
    print("Promosso")   # eseguito solo se voto >= 6
print("Fine")           # eseguito sempre: non è indentato, è fuori dal blocco
```

`print("Fine")` **non è indentato**: sta fuori dal blocco, quindi viene eseguito **sempre**.

---

# if / else

`else` introduce il blocco **alternativo**, eseguito quando la condizione è `False`.

```python
voto = 4
if voto >= 6:
    print("Promosso")
else:
    print("Bocciato")
```

Regole di `else`:

- **non** ha una condizione;
- deve comunque avere i **due punti** `:`;
- va scritto alla **stessa indentazione** dell'`if` a cui appartiene;
- è **opzionale**: se lo ometti e la condizione è falsa, semplicemente non succede nulla.

---

# if / elif / else

Per più di due alternative si usa `elif` (abbreviazione di *else if*).

```python
voto = 7
if voto >= 9:
    print("Ottimo")
elif voto >= 7:
    print("Buono")
elif voto >= 6:
    print("Sufficiente")
else:
    print("Insufficiente")
```

- `elif` si può ripetere quante volte si vuole; `else` va per ultimo ed è opzionale;
- le condizioni sono valutate **in ordine, dall'alto verso il basso**;
- appena una condizione è `True`, si esegue il suo blocco e **le successive vengono saltate**.

---
class: table-sm
---

# Cosa Python considera vero o falso

La condizione non deve essere per forza un confronto. Alcuni valori contano come **falsi** (*falsy*). **Tutto il resto** è considerato **vero** (*truthy*).

| Valore falsy      | Significato            |
| ----------------- | ---------------------- |
| `False`           | il booleano falso      |
| `0`, `0.0`        | zero                   |
| `""`              | stringa vuota          |
| `[]`, `{}`        | collezioni vuote       |
| `None`            | assenza di valore      |



```python
nome = ""
if nome:
    print(f"Ciao {nome}")
else:
    print("Nome mancante")   # -> viene stampato questo
```

---

# if innestato

Un `if` può contenere un altro `if`: si parla di **if annidato** (o innestato).

```python
utente = "admin"
password = "1234"

if utente == "admin":
    if password == "1234":
        print("Accesso consentito")
    else:
        print("Password errata")
else:
    print("Utente sconosciuto")
```

- Il secondo `if` è **dentro** il blocco del primo, quindi è indentato di un livello in più.
- Ogni livello di annidamento aggiunge **4 spazi**.
- Il blocco interno viene valutato **solo** se il blocco esterno è stato eseguito (cioè la sua condizione era `True`).

---

# Clausole più complesse

Una condizione può combinare più confronti con `and`, `or`, `not` e con i **confronti concatenati**.

```python
eta = 25
iscritto = True

if (eta >= 18 and eta <= 65) and iscritto:
    print("Accesso all'area riservata")
elif not iscritto:
    print("Devi prima iscriverti")
else:
    print("Fuori fascia d'età")
```

- Le **parentesi** rendono esplicito e leggibile l'ordine di valutazione.
- `18 <= eta <= 65` è la forma compatta di `eta >= 18 and eta <= 65`.
- `not iscritto` funziona da solo: `iscritto` è un booleano, quindi `not` lo nega.

---
layout: two-cols-header
---

# Esempio — if annidiato

::left::

### Con if annidati

```python
eta = 16
patente = False

if eta >= 18:
    if patente:
        print("Puoi guidare")
    else:
        print("Maggiorenne, ma senza patente")
else:
    print("Troppo giovane per guidare")
```

::right::

### Con `and` / `elif`

```python
eta = 16
patente = False

if eta >= 18 and patente:
    print("Puoi guidare")
elif eta >= 18:
    print("Maggiorenne, ma senza patente")
else:
    print("Troppo giovane per guidare")
```


::bottom::
Le due versioni producono lo **stesso risultato**: gli `and` e gli `elif` spesso sostituiscono un annidamento, rendendo il codice più piatto e leggibile.

---

# Esempio — clausola complessa

Un programma che classifica un triangolo in base ai lati:

```python
a = 3
b = 3
c = 5

if a + b > c and a + c > b and b + c > a:
    if a == b == c:
        print("Triangolo equilatero")
    elif a == b or b == c or a == c:
        print("Triangolo isoscele")
    else:
        print("Triangolo scaleno")
else:
    print("Non è un triangolo")
```

- Prima si controlla la **validità** (disuguaglianza triangolare), poi si classifica.
- `a == b == c` è un confronto concatenato: vero solo se tutti e tre sono uguali.
- `a == b or b == c or a == c` è vero se **almeno due** lati sono uguali.

---
class: table-sm
---

# Errori comuni

| Errore                              | Codice sbagliato     | Codice corretto        |
| ----------------------------------- | -------------------- | ---------------------- |
| confondere `=` con `==`             | `if x = 5:`          | `if x == 5:`           |
| dimenticare i due punti             | `if x > 5`           | `if x > 5:`            |
| indentazione incoerente             | 2 spazi poi 4 spazi  | sempre 4 spazi         |
| `else` con una condizione           | `else x > 5:`        | `else:`                |
| condizione vuota                    | `if:`                | `if x:`                |
| blocco vuoto senza `pass`           | `if x:` (niente)     | `if x:` + `pass`       |

```python
if x = 5:      # SyntaxError
    print(x)
```

> **N.B.** `=` assegna un valore a una variabile; `==` confronta due valori e produce `True`/`False`.

---

# Riepilogo

- `if condizione:` → esegue il blocco indentato solo se la condizione è `True`.
- `else:` → blocco alternativo, senza condizione.
- `elif condizione:` → nuove alternative, valutate in ordine.
- L'**indentazione** definisce i blocchi: è sintassi, non stile.
- I **due punti** `:` chiudono sempre la riga di `if`, `elif` ed `else`.
- Le condizioni possono usare confronti, `and`/`or`/`not` e confronti concatenati.
- Python considera "falsi" `0`, `""`, `[]`, `{}`, `None`, `False`; tutto il resto è vero.

> **N.B.** Un solo blocco viene eseguito: il primo la cui condizione è `True`. Non appena un ramo viene preso, gli altri sono ignorati.
