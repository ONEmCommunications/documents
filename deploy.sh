# if [ $# -eq 0 ]                                                                     
#   then                                                                              
#     echo "Usage: ./deploy.sh branch"                                                                                    
#     exit 1                                                                                                                                   
# fi  

docker build . --rm -t documents --build-arg SSH_PRV_KEY="$(cat ~/.ssh/id_rsa)" --build-arg SSH_PUB_KEY="$(cat ~/.ssh/id_rsa.pub)" --no-cache

ssh butler@nautilus2.dhq.onem docker container stop documents
ssh butler@nautilus2.dhq.onem docker container rm documents
ssh butler@nautilus2.dhq.onem docker image rm documents

docker save documents | ssh butler@nautilus2.dhq.onem docker load

ssh butler@nautilus2.dhq.onem docker run -d -i --name=documents --net=host -t documents mkdocs serve -a nautilus2.dhq.onem:7777
