TIMESTAMP=$(date +%s)
DIR="images"
URL="https://www.climaynievepirineos.com/webcams/pineta/cam.jpg"

curl -s "$URL" > "${DIR}/${TIMESTAMP}.jpg"

for file in ${DIR}/*.jpg; do
if [ "$file" != "${DIR}/${TIMESTAMP}.jpg" ]; then
    if cmp -s "$file" "${DIR}/${TIMESTAMP}.jpg"; then
        echo "Duplicate image found. Deleting ${DIR}/${TIMESTAMP}.jpg"
        rm "${DIR}/${TIMESTAMP}.jpg"
        break
    fi
fi
done
