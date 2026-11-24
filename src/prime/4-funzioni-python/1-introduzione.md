---
layout: cover
---

# Funzioni in Python
Insegnare al computer un nuovo verbo

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Il problema: copiare e incollare

Calcoliamo la media di tre liste di voti:

```python
voti1 = [7, 4, 9, 6]
somma = 0
for voto in voti1:
    somma = somma + voto
media1 = somma / len(voti1)

voti2 = [3, 8, 10]
somma = 0
for voto in voti2:
    somma = somma + voto
media2 = somma / len(voti2)

voti3 = [6, 6, 5, 8]
somma = 0
for voto in voti3:
    somma = somma + voto
media3 = somma / len(voti3)
```

Lo stesso calcolo è scritto **tre volte**.

---

# Cosa non va nel copia-incolla

- Se la formula è sbagliata, va corretta in **tre punti**;
- ogni copia può divergere dalle altre: bug silenziosi;
- i nomi `somma` e `media` si sovrascrivono a vicenda;
- il codice diventa più lungo, ma non più chiaro;
- per riusare il calcolo in un altro programma va copiato ancora.

> **Idea** Ogni volta che un pezzo di codice compare più di una volta, dovrebbe diventare una **funzione**.

---

# Che cos'è una funzione

Una **funzione** è un blocco di codice con un **nome**, che possiamo eseguire (chiamare) ogni volta che serve.

Come una ricetta: la scriviamo **una volta**, poi la usiamo tutte le volte che vogliamo.

```python
def calcola_media(voti):
    somma = 0
    for voto in voti:
        somma = somma + voto
    return somma / len(voti)

print(calcola_media([7, 4, 9, 6]))
print(calcola_media([3, 8, 10]))
print(calcola_media([6, 6, 5, 8]))
```

Un solo calcolo, tre utilizzi.

---

# Il modello mentale: input → funzione → output

Una funzione si comporta come una **scatola**:

```text
   input  ─────▶  FUNZIONE  ─────▶  output
 (argomenti)                       (valore di ritorno)
```

- **input**: i dati che diamo alla funzione quando la chiamiamo;
- **funzione**: le istruzioni che elaborano quei dati;
- **output**: il risultato che la funzione ci restituisce.

Chi usa la funzione non deve sapere **come** funziona dentro: gli basta sapere **cosa entra** e **cosa esce**.

---

# Funzioni che usiamo già

Anche senza saperlo, usiamo funzioni continuamente:

| Funzione        | Input        | Output              |
| --------------- | ------------ | ------------------- |
| `len("casa")`   | una stringa  | `4`                 |
| `int("42")`     | una stringa  | `42`                |
| `abs(-7)`       | un numero    | `7`                 |
| `print("ciao")` | un valore    | stampa a schermo    |

- `len` riceve una sequenza e **restituisce** la sua lunghezza;
- `int` riceve del testo e **restituisce** un numero;
- `print` riceve un valore e **non restituisce** nulla di utile: mostra soltanto.

> **N.B.** Una funzione non è magia: è codice che qualcuno ha già scritto per noi.

---

# Perché le funzioni sono utili

- **Evitano le ripetizioni**: un solo posto da correggere.
- **Danno un nome alle idee**: `calcola_media(voti)` si legge come l'enunciato.
- **Isolano la complessità**: per usarla basta conoscere input e output.
- **Semplificano i test**: si prova la funzione una volta, non ogni copia.
- **Permettono di riusarla**: anche in un altro programma.
- **Rendono il `main` leggibile**: poche righe che raccontano la storia.

> **N.B.** Scomporre un problema in funzioni è il primo passo per scrivere programmi grandi senza perdersi.

---

# Un programma fatto di funzioni

```python
def leggi_voti():
    return [7, 4, 9, 6]

def calcola_media(voti):
    return sum(voti) / len(voti)

def stampa_risultato(media):
    print("La media è", media)

def main():
    voti = leggi_voti()
    media = calcola_media(voti)
    stampa_risultato(media)

main()
```

Ogni funzione fa **una cosa sola**, con un nome che lo dice.
