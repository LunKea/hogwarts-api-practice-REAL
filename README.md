Man laver endpoint-testene ved at bruge bruno. Du kan finde filen til min bruno collection under mappen der hedder:  bruno collection_backup
Derefter vil du få mine .yml filder som man bruger bruno til at teste mine endpoints med.

# Houses har kun GET.
Det er GET ALL: http://localhost:3000/houses
OG GET single baseret på id: http://localhost:3000/houses/X

# Student, Houses og Courses har: GET, PUT, POST, DEL.

## Get er for at samle alle eller et ID fra hver tabel.
http://localhost:3000/students
http://localhost:3000/houses
http://localhost:3000/courses

## PUT for at opdatere et allerede eksisterende ID under en tabel.
Det gøres gennem bruno. Man klikker på put, går ind under body, og ser der er allerede et template klart til en. Man skriver de ændringer man gerne vil, ændrer ID tallet i URL'en for at vælge den ID man gerne vil opdatere dataen til, hvor man så efter trykker -> for at opdatere den ID man har valgt.

## POST er for at skabe et nyt ID inde for en tabel, så man kan sige man laver en ny række.
I bruno vælger man bare en post som er klart, satter dataen ind i templaten som er lavet og trykker ->. Der vil blive skabt en ny række, med et nyt ID.
Det skal siges at hvis der er tidligere blevet slettet et ID gennem DEL, vil det ID aldrig blive lavet igen. Så hvis man har tidligere sletter den nyeste som kunne være 13, og man laver en ny række, så vil det næste ID der bliver lavet være 14 og ikke 13.
13 I det tilfælde kan aldrig blive lavet igen.

## DEL - Nu når det er nævnt. Bliver brugt til at slette en række i en tabel.
Du vælger DEL på den tabel du gerne vile slette en række fra i bruno, og vælger hvilken række det er gennem URL'en i toppen, du skal skrive den ID du gerne vil slette.
