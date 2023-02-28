docker build -f ./Dockerfile -t dev:latest .

docker run -p 5000:5000 -it --volume //c/Users/jnicholson/Code:/home/code --env-file ./env.list dev:latest /bin/bash

docker exec -it hardcore_volhard /bin/bash
