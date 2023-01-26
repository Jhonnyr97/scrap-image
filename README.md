- Install docker 
- build images 
```
docker build -t scrap_images_app .
```
- run project 
```
docker run -p 3000:3000 scrap_images_app
```
- run 
```
curl --location --request POST 'http://0.0.0.0:3000' \
    --header 'Content-Type: application/json' \
    --data-raw '["https://it.wikipedia.org/wiki/Pagina_principale", "https://www.bikewale.com/tvs-bikes/jupiter/images/"]'
```
