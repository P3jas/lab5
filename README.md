# lab5 sprawozdanie

- Podać użyte polecenie do budowy obrazu i wynik jego działania 

polecenie:

docker build --build-arg VERSION=v1.0 -t lab5-image .


wynik polecenia przesłany w formie obrazu nazwie budowaObrazu-wynik.png


- Podać polecenie uruchamiające serwer

polecenie:

docker run -d -p 8080:80 --name lab5-serwer lab5-image


- Polecenie potwierdzające działanie kontenera i poprawne  funkcjonowanie opracowanej aplikacji

polecenie:

docker ps --filter name=lab5-serwer
