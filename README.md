# MN - TEMA 2

## Numerical Music

Pentru taskuri am scris multe comentarii în cod, care majoritatea reprezintă pașii descriși în descrierea temei. Programele foarte simple nu le-am mai explicat în readme fiidcă comentariile descriu cam tot.

Am lăsat comentariile în engleză ca să fie mai universală tema.

1. Plain Loop vs Plain Sound
Comparând spectrogramele Plain Loop pentru loop.wav și Plain Sound pentru drum-urile din music1.csv și music2.csv, prima este una continuă, spectrograma este toată plină cu valori ale amplitudinilor pentru orice interval de timp deoarece pe lângă beat mai este și sunetul din background care se repetă la intervale egale de timp. În ce de-a doua spectrogramă nu mai există loop, deci ea afișează doar valori ale amplitudinilor la anumite momente de timp, care încep cu o amplitudine mai ridicată ce scade pe măsură ce crește frecvența. În momentele în care nu este nici un beat spectrograma este goală.

2. Plain Sound vs Low Pass Sound

Sunetul care a fost generat de studio.m este exact lafel ca cel din conditia temei. Beat-urile din spectrograma au fost extinse în lateral și li s-a scăzut amplitudinea, așa ca acum nu se mai aud kick-urile acelea cu pitch mai ridicat.

3. Plain Sound vs Reverb Sound
La reverb spectrograma are la bază aceleași beat-uri de tobe, însă care par că sunt prelungite la dreapta, acum nemaifiind intervale goale în spectrogramă, ci un canvas cu porțiuni cu amplitudine relativ mare(mult roșu și galben) și repetitive.

4. Tech
Spectrograma din nou reprezintă porțiuni repetitive care au creșteri de amplitudine până la aproximativ 15kHz, după care amplitudinea este mică, de asemenea aceste porțiuni nu sunt fixe și au într-un fel un peak după o mică scădere până la următorul peak care are loc spontan, exact ca muzica din tech.wav .

5. Low Pass Tech
Amplitudinile mai ridicate de o anumită frecvență au fost toate scăzute, nu mai există porțiunile cu variații de amplitudine ridicată, acum amplitudini mari au rămas doar undevaa până la 1000 Hz.

6. Reverb Tech
S-a făcut cam acelaș lucru ca la Reverb Sound, au crescut mult amplitudinile din spectrogramă deoarece din nou au fost extinse beaturile la dreapta, ceea ce a dus la porțiunile cu ampliitudine mare să acopere mult mai mult loc, iar în porțiunile unde ea era mică acum este medie spre mare (verde - galben).

7. Low Pass + Reverb Tech
Aici fiindcă întâi au fost scăzute amplitudinile, iar după s-a aplicat reverb, la frecvențe mari amplitudinea este foarte joasă, însă se observă extinderea lor în lateral pe porțiuni.

8. Reverb + Low Pass Tech
Aici amplitudinile sunt mai mari decât la transformarea 7, probabil fiindcă reverbul a extins la început acele spike-uri de amplitudini, iar apoi acestea au fost scăzute la o formă asemănătoare cazului 5.

## Robotzii

### spline_c2.m

Am mers după pașii din condiția temei și cele din schelet și am făcut la fiecare pass for-loopuri pentru a inițializa coeficienții de pe fiecare rând al matricei A, la început plină cu 0.

La unele mi-am dat seama că coeficienții vor fi mereu o constantă, de aceea am pus direct valoarea, de exemplu pentru si(xi), din 4 în 4 coloane și câte un rând mai jos trebuie pusă valoarea 1 pentru coeficientul liber, penultimul rând va avea mereu valoarea 2 pe a treia coloană, ultimul rând va avea mereu ultimele două valori 2 și 6, etc...

Peste tot x_diff reprezintă paranteza (x - xi), care este ridicată la puterile corespunzătoare polinomului sau derivatelor acestuia și înmulțite cu coeficienții de la derivare.

### P_spline.m

Deoarece pentru fiecare x de interpolare trebuie să găsesc intervalul [x_i, x_i+1] în care este inclus pentru a lua coeficienții corecți ai lui s_i pentru acel x de interpolare. Acest lucru îl fac cu un simplu while care se oprește la ultima valoare a lui x mai mică ca x de interpolare.

După calculez iar x_diff care acum este diferența dintre x de interpolare și x_i, apoi selectez din coloana de coeficienți doar cei 4 care corespund polinomului s_i, după calculez efectiv valoarea polinomului pentru x_deff la puterile respective * coeficienții respectivi.

### vandermonde.m

Este cea mai ușoară interpolare, pur și simplu am parcurs valorile din x și pentru fiecare am creat linia cu puterile sale, după am aflat direct coeficienții care acum sunt pentru un întreg polinom e descrie curba.

### P_vandermonde.m

Aici printr-ul simplu loop am calculat valorile pentru fiecare y de interpolare ca valoarea polinomului pentru x de interpolare la puterile respective * coeficienții respectivi.

### plot_spline.m / plot_vandermonde.m

Am dat plot la toate fișierele de input din task-2, spline s-a descurcat cu toate, vandremonde a reușit doar la testul 1 și 4 fiincă aveau un număr mic de puncte, el nu prea se descurcă cu un număr mare fiincă funcția se bazează pe un singur polinom și dă eroare că matricea este singulară.

De asemenea, pentru datele pe care funcționează ambele metode de interpolare, pe 3 puncte diferențele nu sunt evidente, graficele arată aproximativ identic, însă la testul 4 unde avem 7 coordonate, vandermonde este mai liniar, nu își schimbă mult curba, pe când spline are multe puncte unde își schimbă monotonia, are mai multe curbe. La testele 2 și 3 unde avem 100 și 1000 de coordonate spline-ul face funcții pe porțiuni și de asta reușește să facă graficul care arată ca cardiograma inimii unei persoane care a făcut atac de cord.

## Recomendations

### recomendations.m

Codul este făcut după algoritm, am pus comentarii care explică fiecare pas care este și în descrierea task-ului.

În loc să elimin linia lui liked_theme din matricea V, am calculat direct pentru toate similaritățile și le-am sortat descrescător, iar acum logic că prima va fi 1 fiindcă liked_theme este identică cu ea însăși. De aceea returnez numărul de indecși începând cu a doua poziție.