---
layout: cover
---

# Nomenclatura

### Imparare i nomi delle cose per capirsi

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Blocco

Un **blocco** è un gruppo di istruzioni che stanno insieme, indentate allo stesso livello. Dice al computer "queste righe vanno eseguite insieme" (in un `if`, in un ciclo…).

```python
voto = 7
if voto >= 6:
    print("Promosso")   # <- stesso blocco
    print("Bravo!")     # <- stesso blocco
print("Fine")           # <- fuori dal blocco
```

- inizia dopo i **due punti** `:`;
- è **tutto indentato allo stesso livello**;
- finisce quando l'indentazione **torna indietro**.

> **N.B.** Blocchi uno dentro l'altro si chiamano **annidati**: ogni livello aggiunge 4 spazi.

---

# Espressione

Un'**espressione** è un pezzo di codice che viene **valutato** e produce **un valore**.

```python
2 + 3          # 5
voto >= 6      # True
"ca" + "sa"    # "casa"
```

Un'espressione può contenere **variabili**: il suo valore dipende da quello che c'è dentro.

```python
x = 4
y = 10
print(x < y)   # True
```

> **N.B.** Ogni espressione, quando viene eseguita, "diventa" un valore: è il computer che fa il calcolo al posto tuo.

---
class: table-sm
---

# La stessa espressione, valori diversi

Il valore di un'espressione **cambia** al cambiare delle variabili che contiene.

```python
x = 2
print(x + 10)   # 12
x = 5
print(x + 10)   # 15
```

| Espressione | Valore di `x` | Risultato |
| ----------- | ------------- | --------- |
| `x + 10`    | `2`           | `12`      |
| `x + 10`    | `5`           | `15`      |
| `x > 3`     | `2`           | `False`   |
| `x > 3`     | `5`           | `True`    |

> **N.B.** L'espressione è la **domanda**, il valore è la **risposta**: dipende dal momento.

---
layout: two-cols-header
---

# Istruzione vs espressione

::left::
### Espressione
**Produce un valore.** Da sola non "fa" nulla di visibile.

```python
2 + 3
voto >= 6
"ciao"
```

→ `5`, `True`, `"ciao"`

::right::
### Istruzione
**Esegue un'azione.** Spesso contiene espressioni.

```python
x = 2 + 3
print(voto)
if voto >= 6:
    # ...
```

→ assegna, stampa, decide

::bottom::
> **N.B.** In `x = 2 + 3` prima si **valuta** l'espressione `2 + 3` (→ `5`), poi l'istruzione **assegna** `5` a `x`. Sono due momenti distinti.

---
class: table-sm
---

# Operatore e operando

Un **operatore** è un simbolo che combina uno o più **operandi** per produrre un valore.

```text
   7 + 3
   ^   ^   operandi
     ^     operatore
```

| Categoria    | Operatori         | Produce          |
| ------------ | ----------------- | ---------------- |
| Aritmetici   | `+ - * / // % **` | un numero        |
| Confronto    | `== != < > <= >=` | `True` / `False` |
| Logici       | `and or not`      | `True` / `False` |
| Assegnamento | `=`               | (nessun valore)  |

> **N.B.** Lo **stesso** operatore può comportarsi diversamente: `+` somma i numeri ma **concatena** le stringhe (`"a" + "b"` → `"ab"`).

---
layout: two-cols-header
---

# Parola chiave e valore letterale

::left::
### Parola chiave (*keyword*)
Una parola **riservata** del linguaggio: non si può usare come nome di variabile.

> `if` · `elif` · `else` · `while` · `and` · `or` · `not` · `True` · `False` · `None`

::right::
### Valore letterale (*literal*)
Un valore scritto **direttamente** nel codice, senza calcoli.

```python
42          # intero
3.14        # con la virgola
"ciao"      # stringa
True        # booleano

```

::bottom::

> **Rifletti.** Come mai non si possono usare le keywords come nome delle variabili?

---

# Iterare / iterazione

**Iterare** significa **ripetere** un blocco di istruzioni. Ogni ripetizione è una **iterazione** (o "giro").

```text
i = 0  -->  [ iterazione 1: print(0), i = 1 ]
i = 1  -->  [ iterazione 2: print(1), i = 2 ]
i = 2  -->  [ iterazione 3: print(2), i = 3 ]
i = 3  -->  condizione falsa  -->  esci
```

Termini collegati:

- **condizione del ciclo**: `i < 3`, controllata prima di ogni giro;
- **corpo del ciclo**: le istruzioni indentate;
- **variabile di controllo**: `i`, che cambia a ogni giro.

> **N.B.** Si dice anche "iterare su una lista", cioè passare uno per uno sui suoi elementi.

---

# Nomenclatura, in breve

- **Blocco** — gruppo di istruzioni indentate allo stesso livello.
- **Espressione** — codice che produce un valore.
- **Istruzione** — codice che esegue un'azione.
- **Operatore / operando** — il simbolo e i valori su cui agisce.
- **Parola chiave** — parola riservata (`if`, `while`…).
- **Valore letterale** — valore scritto direttamente (`42`, `"ciao"`).
- **Iterazione** — una ripetizione del blocco di un ciclo.

> **N.B.** Usare i nomi giusti serve a leggere la documentazione e a farsi capire quando si chiede aiuto.
