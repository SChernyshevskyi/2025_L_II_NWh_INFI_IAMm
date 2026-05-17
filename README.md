# Simple Flask App

Aplikacja dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

Repozytorium projektu:
https://github.com/SChernyshevskyi/2025_L_II_NWh_INFI_IAMm

## Opis projektu

Projekt jest prostą aplikacją webową napisaną w języku Python z wykorzystaniem frameworka Flask.
Aplikacja zwraca komunikat `Hello World!` razem z imieniem użytkownika. W ramach ćwiczeń zmieniono
imię `Natalia` na własne imię: `Sviatoslav`.

Aplikacja obsługuje różne formaty wyjścia, między innymi format tekstowy oraz JSON.
W projekcie poprawiono również strukturę odpowiedzi JSON, aby była zgodna z poprawną składnią:

```json
{
  "imie": "Sviatoslav",
  "msg": "Hello World!"
}
```

## Struktura repozytorium

W repozytorium znajdują się między innymi:

- `README.md` – dokumentacja projektu,
- `main.py` – plik uruchamiający aplikację,
- `hello_world/` – kod źródłowy aplikacji Flask,
- `test/` – testy jednostkowe,
- `requirements.txt` – zależności aplikacji,
- `test_requirements.txt` – zależności testowe,
- `Makefile` – wspólny punkt wejścia do projektu,
- `Dockerfile` – konfiguracja budowania obrazu Docker,
- `.circleci/config.yml` – konfiguracja pipeline CircleCI.

## Środowisko wirtualne Python

W projekcie wykorzystujemy środowisko wirtualne, aby odizolować zależności aplikacji od systemowego Pythona.

```bash
python -m venv .venv
```

Aktywacja środowiska w Git Bash / Windows:

```bash
source .venv/Scripts/activate
```

Instalacja zależności:

```bash
pip install -r requirements.txt
pip install -r test_requirements.txt
```

Dezaktywacja środowiska:

```bash
deactivate
```

## Uruchamianie aplikacji

Aplikację można uruchomić bezpośrednio:

```bash
python main.py
```

Po uruchomieniu aplikacja jest dostępna pod adresem:

```text
http://127.0.0.1:5000
```

Przykładowe sprawdzenie działania:

```bash
curl 127.0.0.1:5000
curl 127.0.0.1:5000/outputs
curl 127.0.0.1:5000/?output=json
```

## Testy

Testy uruchamiane są za pomocą pytest:

```bash
PYTHONPATH=. python -m pytest --verbose -s
```

W projekcie testy sprawdzają między innymi poprawność działania formattera oraz endpointów aplikacji.

## Makefile

Projekt wykorzystuje `Makefile` jako jeden wspólny punkt wejścia do najważniejszych poleceń.
Dzięki temu każda osoba pracująca z projektem może używać tych samych komend.

Dostępne polecenia:

```bash
make deps
make lint
make test
make run
make docker_build
make docker_run
make docker_push
```

Opis poleceń:

- `make deps` – instaluje zależności aplikacji i testów,
- `make lint` – uruchamia linter flake8,
- `make test` – uruchamia testy jednostkowe,
- `make run` – uruchamia aplikację lokalnie,
- `make docker_build` – buduje obraz Dockera,
- `make docker_run` – uruchamia aplikację w kontenerze,
- `make docker_push` – publikuje obraz na Docker Hub.

## Linter

Do sprawdzania jakości kodu używany jest flake8:

```bash
make lint
```

Linter sprawdza zgodność kodu ze stylem PEP8, między innymi:
- długość linii,
- poprawne odstępy,
- nieużywane importy,
- poprawne zakończenie plików nową linią.

## Docker

Projekt zawiera plik `Dockerfile`, który pozwala zbudować obraz aplikacji.

Budowanie obrazu:

```bash
make docker_build
```

Uruchomienie kontenera:

```bash
make docker_run
```

Sprawdzenie działania kontenera:

```bash
docker ps
curl 127.0.0.1:5000
docker logs hello-world-printer-dev
```

Zatrzymanie i usunięcie kontenera:

```bash
docker stop hello-world-printer-dev
docker rm hello-world-printer-dev
```

## Docker Hub

Obraz Dockera został opublikowany w Docker Hub jako:

```text
sviatoslav65913/hello-world-printer
```

Uruchomienie aplikacji z obrazu pobranego z Docker Hub:

```bash
docker run -p 5000:5000 sviatoslav65913/hello-world-printer
```

## CircleCI

Projekt wykorzystuje CircleCI do automatyzacji procesu CI/CD.

Konfiguracja znajduje się w pliku:

```text
.circleci/config.yml
```

Pipeline wykonuje następujące kroki:

1. `make deps` – instalacja zależności,
2. `make lint` – sprawdzenie stylu kodu,
3. `make test` – uruchomienie testów,
4. `make docker_build` – budowa obrazu Dockera,
5. `make docker_push` – publikacja obrazu w Docker Hub.

Dzięki temu po każdym pushu do repozytorium GitHub CircleCI automatycznie sprawdza projekt,
buduje obraz Docker i przygotowuje go do dostarczenia.

## Continuous Integration, Delivery i Deployment

Continuous Integration polega na automatycznym uruchamianiu testów i sprawdzaniu jakości kodu po zmianach w repozytorium.

Continuous Delivery polega na przygotowaniu gotowego artefaktu aplikacji, w tym przypadku obrazu Docker.

Continuous Deployment oznacza możliwość uruchomienia gotowej wersji aplikacji po stronie klienta z obrazu dostępnego w Docker Hub.

## Format JSON, YAML i XML

JSON jest formatem często używanym w API. Dane zapisuje się jako pary klucz-wartość.

Przykład JSON:

```json
{
  "imie": "Sviatoslav",
  "msg": "Hello World!"
}
```

YAML jest formatem często używanym w plikach konfiguracyjnych, np. w CircleCI.

Przykład YAML:

```yaml
imie: Sviatoslav
msg: Hello World!
```

XML jest bardziej rozbudowanym formatem opartym na tagach.

Przykład XML:

```xml
<user>
  <imie>Sviatoslav</imie>
  <msg>Hello World!</msg>
</user>
```

## Podsumowanie

W projekcie wykonano pełny proces od pracy z kodem źródłowym do przygotowania obrazu Docker
i publikacji go w Docker Hub. Repozytorium zawiera kod aplikacji, testy, Makefile, Dockerfile oraz konfigurację CircleCI.
