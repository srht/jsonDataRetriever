import json
import pandas as pd
# open the JSON file
with open('input.json', 'r', encoding='utf-8-sig') as f:
    data = json.load(f)

row = ["title", "authors"]
jDataArrays=[[]]
jDataArrays.append(row)
# extract the arrays with the name "searchResults"
for dataIndex in range(len(data)):
    search_results = data[dataIndex]['searchResults']
    rowObj={
            "title":'',
            "authors":''
        }
    # iterate over each search result array and print its contents
    for results in search_results:
        if "title" in results:
            rowObj["title"]=results["title"]
        if "authors" in results:
            authors=""
            for author in results["authors"]:
                authors+=author["name"]+", "
            rowObj["authors"]=authors

        # write multidimensional array
        row = [rowObj["title"], rowObj["authors"]]
        jDataArrays.append(row)

pd.DataFrame(jDataArrays).to_csv("fileOut.csv")
print(jDataArrays)
