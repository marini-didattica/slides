---
layout: cover
---

# f-string
Costruire testo leggibile

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>
---

# Il problema: unire testo e variabili

Vogliamo stampare una frase che contiene dei valori:

```text
Ciao Ada, hai 36 anni.
```

La variabile `eta` è un numero, quindi non possiamo concatenarla direttamente a una stringa.

```python
print("Ciao " + nome + ", hai " + eta + " anni.")
# TypeError: can only concatenate str (not "int") to str
```

La versione non idiomatica converte ogni valore con `str()` e concatena tutto con `+`.
---

# Soluzione non idiomatica

```python
nome = "Ada"
eta = 36

print("Ciao " + nome + ", hai " + str(eta) + " anni.")
```

Funziona, ma:

- bisogna ricordarsi ogni `str()`;
- le virgolette e i `+` spezzano la frase;
- aggiungere un valore significa riscrivere l'intera riga;
- è facile dimenticare uno spazio.
---

# Soluzione idiomatica: f-string

Una **f-string** è una stringa preceduta da `f`. Dentro le graffe `{...}` si possono mettere variabili ed espressioni:

```python
nome = "Ada"
eta = 36

print(f"Ciao {nome}, hai {eta} anni.")
```

`Output:`

```text
Ciao Ada, hai 36 anni.
```

- La `f` davanti alle virgolette attiva le sostituzioni.
- Dentro `{}` va un'espressione Python qualsiasi.
- Il resto della stringa è testo normale.

> **N.B.** La f-string è il modo consigliato di costruire testo in Python moderno. Le f-string le avevamo già incontrate; ora le usiamo in modo sistematico.
---

# Dentro le graffe: espressioni

Non serve creare una variabile per ogni pezzo: dentro `{}` possiamo mettere qualsiasi espressione.

```python
a = 7
b = 3

print(f"{a} + {b} = {a + b}")          # 7 + 3 = 10
print(f"{a} / {b} = {a / b}")          # 7 / 3 = 2.3333333333333335
print(f"Il doppio di {a} è {a * 2}")   # Il doppio di 7 è 14
```

Possiamo anche chiamare funzioni:

```python
voti = [7, 4, 9, 6]

print(f"Media: {sum(voti) / len(voti)}")
```

> **N.B.** Le graffe devono contenere un'espressione valida. `f"{a +}"` è un errore di sintassi.
---

# Esercizio 1 — Media con due decimali

Stampare la media con **esattamente due cifre decimali**.

| Input          | Output         |
| -------------- | -------------- |
| `[7, 4, 9, 6]` | `Media: 6.50`  |

La versione non idiomatica usa `round()` e `str()`:

```python
media = sum(voti) / len(voti)
print("Media: " + str(round(media, 2)))
```

Il problema: `round(6.5, 2)` vale `6.5`, quindi stampa `6.5`, **non** `6.50`.
---

# Formattazione dei numeri

Dopo i due punti, dentro le graffe, si può specificare **come** formattare il valore:

```python
media = 6.5

print(f"Media: {media:.2f}")    # Media: 6.50
print(f"Media: {media:.1f}")    # Media: 6.5
print(f"Media: {media:.0f}")    # Media: 6
```

- `.2f` = numero con la virgola, **2 cifre decimali**.
- `.1f` = 1 cifra decimale.
- `.0f` = nessuna cifra decimale.

La specifica dopo `:` è potente: non si limita a convertire, **formatta**.
---

# Esercizio 2 — Report leggibile

Stampare una riga di report con nome, voto e media.

| Dati                         | Output                                |
| ---------------------------- | ------------------------------------- |
| `"Ada"`, `8`, `7.5`          | `Ada ha preso 8, media 7.50`          |

> **Nota** La media va stampata con due decimali; il resto è testo.
---

# Report — soluzione

```python
nome = "Ada"
voto = 8
media = 7.5

print(f"{nome} ha preso {voto}, media {media:.2f}")
```

Possiamo anche includere un'espressione:

```python
print(f"{nome} ha preso {voto}, dista {10 - voto} punti dal massimo")
```

> **N.B.** Non serve nessuna conversione esplicita: la f-string chiama `str()` per noi su ogni valore.
---

# Esercizio 3 — Tabella allineata

Stampare una tabella di nomi e voti con le colonne allineate.

```text
Nome       Voto
Ada           8
Luca          6
Sara          9
```

La versione non idiomatica aggiunge spazi a mano, contando i caratteri di ogni nome.
---

# Allineamento e larghezza

Dentro la specifica di formato si può indicare la **larghezza** della colonna e l'**allineamento**:

```python
nome = "Ada"
voto = 8

print(f"{nome:<10}{voto:>5}")
```

- `<10` = larghezza 10, allineato a **sinistra**.
- `>5` = larghezza 5, allineato a **destra**.
- `^10` = centrato.

```python
print(f"{'Nome':<10}{'Voto':>5}")
print(f"{'Ada':<10}{8:>5}")
print(f"{'Luca':<10}{6:>5}")
```

> **N.B.** La larghezza è il numero minimo di caratteri: se il testo è più lungo, la colonna si allarga.
---

# Bonus: percentuali e zeri iniziali

```python
print(f"{0.734:.1%}")     # 73.4%
print(f"{0.734:%}")       # 73.400000%

print(f"{7:02d}")         # 07
print(f"{7:03d}")         # 007
```

- `%` moltiplica per 100 e aggiunge il simbolo.
- `02d` = intero con almeno 2 cifre, riempite con `0`.

Esempio pratico: orari e minuti.

```python
ore = 9
minuti = 5
print(f"{ore:02d}:{minuti:02d}")   # 09:05
```
---

# Parentesi graffe letterali

Se nel testo servono davvero le graffe, si raddoppiano:

```python
print(f"Per fare una f-string si usa {{valore}}")
# Per fare una f-string si usa {valore}

print(f"{{}} contiene un'espressione")
# {} contiene un'espressione
```

> **N.B.** `{{` produce `{` e `}}` produce `}`. Una singola graffa apre sempre una sostituzione.
---

# Riepilogo — f-string

- `f"..."` attiva le sostituzioni.
- `{espressione}` inserisce il valore dell'espressione.
- `{valore:.2f}` formatta un numero con due decimali.
- `{testo:<10}` e `{numero:>5}` allineano su una larghezza fissa.
- `{0.734:.1%}` formatta le percentuali.
- `{{` e `}}` producono graffe letterali.

> **N.B.** Rispetto a `+` e `str()`, la f-string tiene **la frase intera** in una sola stringa: si legge come il testo finale e si modifica senza toccare la punteggiatura.
