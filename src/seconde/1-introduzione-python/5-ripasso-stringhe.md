---
layout: cover
---

# Ripasso - Stringhe
Sequenze di caratteri

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Cos'è una stringa

Una **stringa** (`str`) è una sequenza **ordinata** di caratteri. In memoria i caratteri sono memorizzati in un blocco **contiguo**, uno dopo l'altro, e ognuno ha un **indice**.

```python
s = "Python"
#  indice:  0  1  2  3  4  5
#  valore:  P  y  t  h  o  n
```

- `len(s)` → numero di caratteri (`6`)
- Gli indici partono da `0`
- Le stringhe sono **immutabili**: non si può cambiare un carattere, se ne crea una nuova

> **N.B.** L'essere contigue in memoria è ciò che rende possibile accedere a un carattere "salto" tramite il suo indice.

---

# Indici e slice

```python
s = "Python"
print(s[0])      # P      -> primo carattere
print(s[-1])     # n      -> ultimo carattere
print(s[1:4])    # yth    -> dal 2° al 4° (escluso)
print(s[:3])     # Pyt    -> dall'inizio
print(s[3:])     # hon    -> fino alla fine
```

> **N.B.** Gli indici partono da `0`; nello slice l'estremo **finale è escluso**.

---
class: table-sm
---

# Metodi principali

| Metodo           | Cosa fa                  | Esempio                       | Risultato            |
| ---------------- | ------------------------ | ----------------------------- | -------------------- |
| `.upper()`       | tutto maiuscolo          | `"Ciao".upper()`              | `"CIAO"`             |
| `.lower()`       | tutto minuscolo          | `"Ciao".lower()`              | `"ciao"`             |
| `.strip()`       | toglie gli spazi ai bordi | `" ciao ".strip()`           | `"ciao"`             |
| `.replace(a, b)` | sostituisce `a` con `b`  | `"ciao".replace("c", "m")`    | `"miao"`             |
| `.split(sep)`    | divide in una lista      | `"a,b,c".split(",")`          | `["a", "b", "c"]`    |
| `.join(lista)`   | unisce una lista         | `"-".join(["a", "b"])`        | `"a-b"`              |
| `.find(x)`       | posizione di `x`         | `"ciao".find("a")`            | `2`                  |
| `.count(x)`      | quante volte compare `x` | `"banana".count("a")`         | `3`                  |

> **N.B.** Le stringhe sono **immutabili**: i metodi non modificano l'originale, restituiscono una **nuova** stringa.

---
class: table-sm
---

# Operazioni utili

| Operazione     | Esempio            | Risultato          |
| -------------- | ------------------ | ------------------ |
| Concatenazione | `"a" + "b"`        | `"ab"`             |
| Ripetizione    | `"ab" * 2`         | `"abab"`           |
| Lunghezza      | `len("ciao")`      | `4`                |
| Appartenenza   | `"a" in "ciao"`    | `True`             |
| Indice         | `"ciao"[1]`        | `"i"`              |
| Slice          | `"ciao"[1:3]`      | `"ia"`             |
| f-string       | `f"Ciao {nome}"`   | inserisce `nome`   |

---
layout: two-cols-header
---

# Esempi

::left::

### Pulire e normalizzare

```python
testo = "  Ciao Mondo  "
print(testo.strip())          # "Ciao Mondo"
print(testo.strip().lower())  # "ciao mondo"
```

### Contare le vocali

```python
parola = "programma"
vocali = 0
for i in range(len(parola)):
    if parola[i] in "aeiou":
        vocali += 1
print(vocali)   # 3
```

::right::

### Maiuscole e lunghezza

```python
nome = "ada"
print(nome.upper())   # ADA
print(len(nome))      # 3
```

### Contare e sostituire

```python
frase = "banana"
print(frase.count("a"))          # 3
print(frase.replace("a", "o"))   # bonono
```

---

# Riepilogo

- Una **stringa** è una sequenza **ordinata** di caratteri, memorizzata in modo **contiguo**.
- È **immutabile**: i metodi restituiscono una **nuova** stringa.
- Indici da `0`; nello slice `[inizio:fine]` la fine è **esclusa**.
- Metodi utili: `.upper()`, `.lower()`, `.strip()`, `.replace()`, `.find()`, `.count()`, `.split()`, `.join()`.
- Operatori: `+` concatena, `*` ripete, `in` verifica l'appartenenza, `len()` conta.

> **N.B.** Per scorrere una stringa si usa l'indice: `for i in range(len(s))` e poi `s[i]`.
